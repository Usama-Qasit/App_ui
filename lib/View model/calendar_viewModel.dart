// view_models/calendar_view_model.dart
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:testing_ui/models/calendar_model.dart';
import 'package:table_calendar/table_calendar.dart';

class CalendarViewModel {
  final BuildContext context;

  CalendarViewModel(this.context);

  CalendarModel get calendarModel => Provider.of<CalendarModel>(context);

  void onDaySelected(DateTime selectedDay) {
    calendarModel.setSelectedDay(selectedDay);
    calendarModel.setFocusedDay(selectedDay);
  }

  void onFormatChanged(CalendarFormat format) {
    calendarModel.setCalendarFormat(format);
  }
}