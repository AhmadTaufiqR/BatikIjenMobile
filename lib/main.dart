import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ijen_batik/view/Screen/DashAfter.dart';
import 'package:ijen_batik/view/Screen/cart.dart';
import 'package:ijen_batik/view/Screen/categories.dart';
import 'package:ijen_batik/view/Screen/productListCategory.dart';
import 'package:ijen_batik/view/Screen/product_list_search.dart';
import 'package:ijen_batik/view/Screen/profile.dart';
import 'package:ijen_batik/view/Screen/rekomendasi.dart';
import 'package:ijen_batik/view/Screen/login_page.dart';
import 'package:ijen_batik/view/Screen/search.dart';
import 'package:ijen_batik/view/Screen/userprofile.dart';
import 'package:shared_preferences/shared_preferences.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SharedPreferences prefs = await SharedPreferences.getInstance();
  var username = prefs.getString('username');
  var password = prefs.getString('password');
  print(username);
  print(password);
  runApp(
    GetMaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: username == null && password == null ? '/login' : '/',
      title: 'Sanggar Batik',
      routes: {
        '/': (context) => const MyScreen(),
        '/login': (context) => const login(),
        '/dashAfter': (context) => const DashboardAfter(),
        '/profile': (context) => const UserProfile(),
        '/search': (context) => const SearchPage(),
        '/myScreen': (context) => const MyScreen(),
        '/rekomendasi': (context) => const rekomendasi(),
        '/listcategory': (context) => const ProductListCategory(),
        '/listsearch': (context) => const ProductListSearch(),
        '/cart': (context) => const PageCart(),
        '/categories': (context) => const CategoriesPage(),
      },
    ),
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
        '/': (context) => const DashboardAfter(),
        '/login': (context) => const login(),
        '/dashAfter': (context) => const DashboardAfter(),
        '/profile': (context) => const UserProfile(),
        '/search': (context) => const SearchPage(),
        '/myScreen': (context) => const MyScreen(),
        '/rekomendasi': (context) => const rekomendasi(),
        '/listcategory': (context) => ProductListCategory(),
        '/cart': (context) => const PageCart(),
        '/categories': (context) => const CategoriesPage(),
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
      const SearchPage(),
      const CategoriesPage(),
      const PageCart(),
      const ProfilePage(),
    ];

    return Scaffold(
      body: screen[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home_filled),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search_rounded),
            label: 'Search',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.category),
            label: 'Category',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_cart_sharp),
            label: 'Cart',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.account_circle),
            label: "Saya",
          ),
        ],
        currentIndex: _selectedIndex,
        type: BottomNavigationBarType.shifting,
        unselectedItemColor: Colors.grey[350],
        selectedItemColor: const Color.fromRGBO(54, 105, 201, 100),
        onTap: (index) {
          setState(
            () {
              _selectedIndex = index;
            },
          );
        },
      ),
    );
  }
}
