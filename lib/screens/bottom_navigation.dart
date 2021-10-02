import 'package:flutter/material.dart';
import 'package:quikie_funds/screens/settings.dart';
import 'package:quikie_funds/screens/support.dart';

import '../constants.dart';
import 'home.dart';

class BottomNavigation extends StatefulWidget {

  @override
  _BottomNavigationState createState() => _BottomNavigationState();
}

class _BottomNavigationState extends State<BottomNavigation> {
  int _currentIndex = 0;
  @override
  Widget build(BuildContext context) {

    final bottomNavigationScreens =[
      HomeScreen(),
      SettingsScreen(),
      SupportScreen(),
    ];

    void _onItemTap(int index){
      setState(() {
        _currentIndex = index;
      });
    }

    return Scaffold(
      body: bottomNavigationScreens[_currentIndex],

      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        currentIndex: _currentIndex,
        onTap: _onItemTap,
        elevation: 16,
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: 'Settings',

          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.headphones),
            label: 'Support',
          ),
        ],
        selectedItemColor: kCOLOR_PRIMARY,
      ),
    );
  }
}
