import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ijen_batik/view/Screen/Order.dart';
import 'package:ijen_batik/view/Screen/dash.dart';
import 'package:ijen_batik/view/Screen/login_page.dart';
import 'package:ijen_batik/view/Screen/notification.dart';

class NavBottom extends StatefulWidget {
  NavBottom({Key? key}) : super(key: key);

  @override
  State<NavBottom> createState() => _NavBottomState();
}

class _NavBottomState extends State<NavBottom> {
  int _selectedIndex = 0;

  var Screen = [
    Dashboard(),
    orderProduct(),
    notificationScreen(),
    login(),
  ];

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      items: const <BottomNavigationBarItem>[
        BottomNavigationBarItem(
          icon: Icon(Icons.home_filled, color: Colors.black26),
          label: 'Home',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.shopping_bag_rounded, color: Colors.black26),
          label: 'Orders',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.notifications, color: Colors.black26),
          label: 'Notification',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.account_circle, color: Colors.black26),
          label: 'login',
        ),
      ],
      currentIndex: _selectedIndex,
      type: BottomNavigationBarType.fixed,
      selectedItemColor: const Color.fromRGBO(54, 105, 201, 100),
      onTap: (index) {
        _selectedIndex = index;
      },
    );
  }
}
