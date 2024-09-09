//
import 'package:flutter/material.dart';
import 'package:smart_healths/chartList.dart';
import 'package:smart_healths/home_page.dart';
import 'package:smart_healths/line_chart.dart';

class splash extends StatefulWidget {
  @override
  _splashState createState() => _splashState();
}

class _splashState extends State<splash> {
  int _selectedIndex = 0; // Track the selected tab

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  final List<Widget> _pages = [
    HomeScreen(),
    MyLineChart(),
    ChartList(),
    Center(child: Text('Profile', style: TextStyle(fontSize: 24))),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green[300],
        title: Text("Health"),
      ),
      body: IndexedStack(
        index: _selectedIndex,
        children: _pages, // Display the selected page
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex, // Active tab
        onTap: _onItemTapped, // Handle tab tap
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.medical_information_rounded),
            label: 'NCD',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.pie_chart_rounded), // Notification icon

            label: 'Chart',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile',
          ),
        ],
        type: BottomNavigationBarType.fixed, // Ensure all labels are visible
        selectedItemColor: Colors.blue, // Highlight color for the active tab
      ),
    );
  }
}
