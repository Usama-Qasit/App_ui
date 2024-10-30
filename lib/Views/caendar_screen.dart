// Views/calendar_screen.dart
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:testing_ui/View%20model/calendar_viewModel.dart';
import 'package:testing_ui/models/calendar_model.dart';
import 'package:testing_ui/Widgets/Mysizedbox.dart';

class CalendarScreen extends StatelessWidget {
  const CalendarScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final viewModel = CalendarViewModel(context);
    final model = viewModel.calendarModel;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 8),
      child: ListView(
        children: [
          const Text(
            "Calendar",
            style: TextStyle(
              fontSize: 28,
              fontWeight: FontWeight.bold,
            ),
          ),
          const MySizedBox(h: 0.02, w: 0),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                width: MediaQuery.of(context).size.width * 0.44,
                decoration: BoxDecoration(
                    color: Colors.grey.shade300,
                    borderRadius: BorderRadius.circular(12)),
                child: Row(
                  children: [
                    _buildFormatButton(context, "Month", CalendarFormat.month),
                    Image.asset('assets/divider_icon.png', height: 22, color: Colors.black38),
                    _buildFormatButton(context, "Week", CalendarFormat.week),
                    Image.asset('assets/divider_icon.png', height: 22, color: Colors.black38),
                    _buildFormatButton(context, "Day", CalendarFormat.twoWeeks),
                    const Spacer(),
                  ],
                ),
              ),
              const MySizedBox(h: 0.05, w: 0),
              FloatingActionButton(
                onPressed: () {},
                backgroundColor: Colors.blue,
                child: const Icon(
                  Icons.add,
                  color: Colors.white,
                ),
              ),
            ],
          ),
          const MySizedBox(h: 0.02, w: 0),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(12),
                boxShadow: const [
                  BoxShadow(
                    color: Colors.grey,
                    spreadRadius: 0.3,
                    blurRadius: 8,
                    offset: Offset(0, 3),
                  ),
                ],
              ),
              child: TableCalendar(
                firstDay: DateTime.utc(2010, 10, 16),
                lastDay: DateTime.utc(2030, 3, 14),
                focusedDay: model.focusedDay,
                calendarFormat: model.calendarFormat,
                selectedDayPredicate: (day) {
                  return isSameDay(model.selectedDay, day);
                },
                onDaySelected: (selectedDay, focusedDay) {
                  viewModel.onDaySelected(selectedDay);
                },
                onFormatChanged: (format) {
                  viewModel.onFormatChanged(format);
                },
                onPageChanged: (focusedDay) {
                  model.setFocusedDay(focusedDay);
                },
                headerStyle: const HeaderStyle(
                  formatButtonVisible: false,
                  titleCentered: true,
                  leftChevronIcon: Icon(Icons.arrow_back),
                  rightChevronIcon: Icon(Icons.arrow_forward),
                ),
                calendarStyle: CalendarStyle(
                  todayDecoration: BoxDecoration(
                    color: Colors.blue,
                    shape: BoxShape.rectangle,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  selectedDecoration: BoxDecoration(
                    color: Colors.blueAccent,
                    shape: BoxShape.rectangle,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  markerDecoration: const BoxDecoration(
                    color: Colors.orange,
                    shape: BoxShape.circle,
                  ),
                ),
              ),
            ),
          ),
          const MySizedBox(h: 0.03, w: 0),
          const Text(
            "Upcoming",
            style: TextStyle(
              fontSize: 28,
              fontWeight: FontWeight.bold,
            ),
          ),
          const MySizedBox(h: 0.01, w: 0),

          // Row with time labels and event cards
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Time labels on the left
              Column(
                children: List.generate(9, (index) {
                  int hour = 7 + index ~/ 2;
                  int minute = (index % 2) * 30;
                  String timeLabel = "${hour.toString().padLeft(2, '0')}:${minute.toString().padLeft(2, '0')}";
                  return Padding(
                    padding: const EdgeInsets.symmetric(vertical: 16.0),
                    child: Text(
                      timeLabel,
                      style: TextStyle(color: Colors.grey[600], fontSize: 16),
                    ),
                  );
                }),
              ),
              const SizedBox(width: 15),

              // Event cards
              Expanded(
                child: Column(
                  children: [
                    _buildEventCard("Brandbook and Guidebook", "Design", "07:00", Colors.orange, [
                      'assets/avatar2.png',
                      'assets/avatar5.png',
                      'assets/avatar7.png',
                    ]),
                    _buildEventCard("App Development", "Coding", "08:30", Colors.green, [
                      'assets/home_avatar.png',
                      'assets/avatar2.png',
                      'assets/avatar3.png',
                    ]),
                    _buildEventCard("Landing Page", "Meeting", "10:00", Colors.purple, [
                      'assets/home_avatar.png',
                      'assets/avatar3.png',
                      'assets/avatar2.png',
                    ]),
                    _buildEventCard("Project \"Rocket\"", "Meeting", "11:30", Colors.yellow, [
                      'assets/avatar6.png',
                      'assets/avatar2.png',
                      'assets/avatar4.png',
                    ]),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildFormatButton(BuildContext context, String text, CalendarFormat format) {
    final model = Provider.of<CalendarModel>(context);
    return InkWell(
      onTap: () => model.setCalendarFormat(format),
      child: Container(
        decoration: BoxDecoration(
          color: model.calendarFormat == format ? Colors.white : Colors.transparent,
          borderRadius: BorderRadius.circular(12),
        ),
        child: Padding(
          padding: const EdgeInsets.all(13),
          child: Text(
            text,
            style: const TextStyle(color: Colors.black),
          ),
        ),
      ),
    );
  }

  Widget _buildEventCard(String title, String category, String time, Color color, List<String> avatars) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 5),
      child: Container(
        padding: const EdgeInsets.all(12.0),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.3),
              spreadRadius: 2,
              blurRadius: 5,
              offset: const Offset(0, 3),
            ),
          ],
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const MySizedBox(h: 0.06, w: 0),
            const SizedBox(width: 10),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    "$category • $time",
                    style: TextStyle(fontSize: 14, color: Colors.grey[600]),
                  ),
                  const SizedBox(height: 8),
                  Row(
                    children: avatars
                        .map((avatar) => Padding(
                              padding: const EdgeInsets.only(right: 4.0),
                              child: CircleAvatar(
                                backgroundImage: AssetImage(avatar),
                                radius: 16,
                              ),
                            ))
                        .toList(),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}