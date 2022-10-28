import 'package:flutter/material.dart';
import 'package:ijen_batik/models/category.dart';
import 'package:ijen_batik/view/all/dash.dart';
import 'package:ijen_batik/view/all/login_page.dart';
import 'package:ijen_batik/view/all/newPassword.dart';
import 'package:ijen_batik/view/all/register_page.dart';
import 'package:ijen_batik/view/all/reset_password.dart';
import 'package:ijen_batik/view/all/splash_screen.dart';
import 'package:ijen_batik/view/all/userprofile.dart';
import 'package:ijen_batik/view/components/categories.dart';
import 'package:ijen_batik/view/components/navbar_buttom.dart';

void main() => runApp(
      MaterialApp(
        theme: ThemeData(primaryColor: Color.fromARGB(255, 169, 147, 147)),
        debugShowCheckedModeBanner: false,
        home: SplashScreen(),
      ),
    );
