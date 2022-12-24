import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ijen_batik/view/Screen/DashAfter.dart';
import 'package:ijen_batik/view/Screen/Order.dart';
import 'package:ijen_batik/view/Screen/cart.dart';
import 'package:ijen_batik/view/Screen/detailProduct.dart';
import 'package:ijen_batik/view/Screen/productListCategory.dart';
import 'package:ijen_batik/view/Screen/rekomendasi.dart';
import 'package:ijen_batik/view/Screen/dash.dart';
import 'package:ijen_batik/view/Screen/login_page.dart';
import 'package:ijen_batik/view/Screen/notification.dart';
import 'package:ijen_batik/view/Screen/search.dart';
import 'package:ijen_batik/view/Screen/userprofile.dart';

void main() {
  runApp(
    const MyApp(),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Sanggar Batik',
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      routes: {
        '/': (context) => PageCart(),
        '/login': (context) => const login(),
        '/dashBefore': (context) => const Dashboard(),
        '/dashAfter': (context) => const DashboardAfter(),
        '/profile': (context) => const UserProfile(),
        '/search': (context) => const SearchPage(),
        '/order': (context) => const orderProduct(),
        '/notification': (context) => const notificationScreen(),
        '/myScreen': (context) => const MyScreen(),
        '/rekomendasi': (context) => const rekomendasi(),
        '/listcategory': (context) => const ProductListCategory(),
      },
    );
  }
}

class MyScreen extends StatefulWidget {
  const MyScreen({Key? key}) : super(key: key);

  @override
  State<MyScreen> createState() => _MyScreenState();
}

class _MyScreenState extends State<MyScreen> {
  int _selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    List screen = [
      const DashboardAfter(),
      const orderProduct(),
      const notificationScreen(),
      const SearchPage(),
    ];

    return Scaffold(
      body: screen[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        items: <BottomNavigationBarItem>[
          const BottomNavigationBarItem(
            icon: Icon(Icons.home_filled),
            label: 'Home',
          ),
          const BottomNavigationBarItem(
            icon: Icon(Icons.shopping_bag_rounded),
            label: 'Orders',
          ),
          const BottomNavigationBarItem(
            icon: Icon(Icons.notifications),
            label: 'Notification',
          ),
          BottomNavigationBarItem(
            icon: const Icon(Icons.account_circle),
            label: Get.arguments == null ? "Login" : "Saya",
          ),
        ],
        currentIndex: _selectedIndex,
        type: BottomNavigationBarType.shifting,
        unselectedItemColor: Colors.grey[350],
        selectedItemColor: const Color.fromRGBO(54, 105, 201, 100),
        onTap: (index) {
          setState(
            () {
              if (index == 3 && Get.arguments == null) {
                AwesomeDialog(
                  context: context,
                  dialogType: DialogType.warning,
                  headerAnimationLoop: false,
                  animType: AnimType.topSlide,
                  closeIcon: const Icon(Icons.close_fullscreen_outlined),
                  title: 'Warning',
                  desc: 'Silahkan Login Terlebih Dahulu',
                  btnCancelOnPress: () {},
                  onDismissCallback: (type) {
                    debugPrint('Dialog Dissmiss from callback $type');
                  },
                  btnOkOnPress: () {
                    Get.to(const login());
                  },
                ).show();
              } else {
                _selectedIndex = index;
              }
            },
          );
        },
      ),
    );
  }
}
