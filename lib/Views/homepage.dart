import 'package:flutter/material.dart';
import 'package:icons_plus/icons_plus.dart';
import 'package:testing_ui/Views/caendar_screen.dart';
import 'package:testing_ui/Views/mail_page.dart';
import 'package:testing_ui/Views/overview_screen.dart';
import 'package:testing_ui/Widgets/Mysizedbox.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  Widget _currentBody = const CalendarScreen(); // Default body is Calendar_screen
  String _selectedTile = 'Calendar'; // Default selected tile is Calendar

  void _navigateToSearch() {
    setState(() {
      _currentBody = const MailPage();
      _selectedTile = 'Mail'; // Update selected tile
    });
  }

  void _navigateToCalender() {
    setState(() {
      _currentBody = const CalendarScreen();
      _selectedTile = 'Calendar'; // Update selected tile
    });
  }

  void _navigateToOverView() {
    setState(() {
      _currentBody = const OverViewScreen();
      _selectedTile = 'OverView'; // Update selected tile
    });
  }

  Widget _buildListTile({
    required String title,
    required IconData icon,
    required VoidCallback onTap,
  }) {
    final isSelected = _selectedTile == title;
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 4, horizontal: 8),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        color: isSelected ? Colors.lightBlue.withOpacity(0.15) : Colors.transparent,
      ),
      child: ListTile(
        onTap: onTap,
        title: Text(
          title,
          style: TextStyle(color: isSelected ? Colors.blue : Colors.black),
        ),
        leading: Icon(
          icon,
          color: isSelected ? Colors.blue : Colors.black,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xffF2F4F7),
        actions: [
          IconButton(
            onPressed: () {}, // _navigateToSearch, // Call the navigation function
            icon: const Icon(
              EvaIcons.search,
              color: Colors.black87,
            ),
          ),
          const MySizedBox(h: 0, w: 0.03),
          IconButton(
            onPressed: () {}, // _navigateToOverView,
            icon: const Icon(
              EvaIcons.settings_2,
              color: Colors.black54,
            ),
          ),
          const MySizedBox(h: 0, w: 0.03),
          IconButton(
            onPressed: () {},
            icon: const Icon(
              EvaIcons.bell,
              color: Colors.black87,
            ),
          ),
          const MySizedBox(h: 0, w: 0.03),
          Image.asset(
            'assets/divider_icon.png',
            height: 27,
            color: Colors.black54,
          ),
          const SizedBox(width: 10),
          const CircleAvatar(
            backgroundImage: AssetImage('assets/home_avatar.png'),
          ),
          const SizedBox(width: 10),
        ],
        leading: Builder(
          builder: (BuildContext context) {
            return IconButton(
              onPressed: () {
                Scaffold.of(context).openDrawer();
              },
              icon: Image.asset(
                'assets/menu_icon.png',
                height: 24,
              ),
            );
          },
        ),
      ),
      drawer: Drawer(
        backgroundColor: const Color(0xffF2F4F7),
        child: SafeArea(
          child: Column(
            children: [
              Image.asset(
                'assets/ Full.png',
                height: MediaQuery.of(context).size.height * 0.09,
              ),
              _buildListTile(
                title: "OverView",
                icon: Icons.home,
                onTap: _navigateToOverView,
              ),
              _buildListTile(
                title: "Ecommerce",
                icon: Icons.shopping_cart,
                onTap: () {},
              ),
              _buildListTile(
                title: "Calendar",
                icon: Icons.calendar_month_rounded,
                onTap: _navigateToCalender,
              ),
              _buildListTile(
                title: "Mail",
                icon: Icons.mail,
                onTap: _navigateToSearch,
              ),
              _buildListTile(
                title: "Chat",
                icon: Icons.chat_bubble_outline_rounded,
                onTap: () {},
              ),
              _buildListTile(
                title: "Tasks",
                icon: Icons.task,
                onTap: () {},
              ),
              _buildListTile(
                title: "Projects",
                icon: Icons.work,
                onTap: () {},
              ),
              _buildListTile(
                title: "File Manager",
                icon: Icons.folder_open_rounded,
                onTap: () {},
              ),
              _buildListTile(
                title: "Notes",
                icon: Icons.notes_rounded,
                onTap: () {},
              ),
              _buildListTile(
                title: "Contacts",
                icon: Icons.contact_phone_rounded,
                onTap: () {},
              ),
            ],
          ),
        ),
      ),
      body: _currentBody, // Use the current body widget
    );
  }
}
