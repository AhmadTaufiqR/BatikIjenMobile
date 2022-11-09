import 'package:flutter/material.dart';
import 'package:ijen_batik/models/category.dart';
import 'package:ijen_batik/components/categories.dart';
import 'package:ijen_batik/components/navbar_buttom.dart';
import 'package:ijen_batik/view/dash.dart';
import 'package:ijen_batik/view/page_view.dart';
import 'package:ijen_batik/view/product_list_search.dart';
import 'package:ijen_batik/view/search.dart';

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
    return MaterialApp(
      theme: ThemeData(primaryColor: Color.fromARGB(255, 169, 147, 147)),
      debugShowCheckedModeBanner: false,
      home: SearchPage(),
    );
  }
}
