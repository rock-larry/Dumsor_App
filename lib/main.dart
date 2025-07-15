import 'package:flutter/material.dart';

import 'history_screen.dart';
import 'home_screen.dart';
import 'map_screen.dart';

void main() => runApp(DumsorApp());

class DumsorApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Dumsor Tracker',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        scaffoldBackgroundColor: Colors.grey, // Global background
        primarySwatch: Colors.orange,
      ),
      home: MainScreen(),
    );

  }
}

class MainScreen extends StatefulWidget {
  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _selectedIndex = 0;

  static final List<Widget> _screens = <Widget>[
    HomeScreen(),
    //will import mapscreen and history screen
    MapScreen(),
    HistoryScreen(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) => Scaffold(

      body: _screens[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.black,
        selectedItemColor: Colors.orangeAccent,
        unselectedItemColor: Colors.white70,
        onTap: _onItemTapped,
        currentIndex:_selectedIndex,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.flash_on), label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.map), label: 'Map'),
          BottomNavigationBarItem(icon: Icon(Icons.history), label: 'History'),
        ],

      ),
    );
}
//will remove this after import

