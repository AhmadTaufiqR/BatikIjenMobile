import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ijen_batik/models/category.dart';
import 'package:ijen_batik/components/categories.dart';
import 'package:ijen_batik/components/navbar_buttom.dart';
import 'package:ijen_batik/view/dash.dart';
import 'package:ijen_batik/view/detailProduct.dart';
import 'package:ijen_batik/view/login_page.dart';
import 'package:ijen_batik/view/productListCategory.dart';
import 'package:ijen_batik/view/product_list_search.dart';
import 'package:ijen_batik/view/register_page.dart';
import 'package:ijen_batik/view/reset_password.dart';
import 'package:ijen_batik/view/search.dart';
import 'package:ijen_batik/view/splash_screen.dart';
import 'package:ijen_batik/view/userprofile.dart';

void main() {
  runApp(
    MyApp(),
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
        '/': (context) => SplashScreen(),
        '/login': (context) => login(),
        '/dashAfter': (context) => Dashboard(),
        '/profile': (context) => UserProfile(),
      },
    );
  }
}
