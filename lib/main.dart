import 'package:flutter/material.dart';
import 'package:ijen_batik/models/category.dart';
import 'package:ijen_batik/view/all/dash.dart';
import 'package:ijen_batik/view/all/login_page.dart';
import 'package:ijen_batik/view/components/categories.dart';
import 'package:ijen_batik/view/components/nafbar.dart';
import 'package:ijen_batik/view/components/navbar_buttom.dart';

void main() => runApp(
      MaterialApp(
        theme: ThemeData(primaryColor: Colors.white),
        debugShowCheckedModeBanner: false,
        home: Dashboard(),
      ),
    );
