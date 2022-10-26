import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ijen_batik/view/all/dash.dart';
import 'package:ijen_batik/view/all/login_page.dart';
import 'package:ijen_batik/view/all/register_page.dart';
import 'package:ijen_batik/view/all/splash_screen.dart';

class navbar_bottom extends StatefulWidget {
  const navbar_bottom({super.key});

  @override
  State<navbar_bottom> createState() => _navbar_bottomState();
}

class _navbar_bottomState extends State<navbar_bottom> {
  int _selectedIndex = 0;
  static const TextStyle optionStyle =
      TextStyle(fontSize: 30, fontWeight: FontWeight.bold);
  static const List<Widget> _widgetOptions = <Widget>[];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home_filled),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_bag_rounded),
            label: 'Business',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.account_circle),
            label: 'School',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.amber[800],
        onTap: _onItemTapped,
      ),
    );
  }
}
