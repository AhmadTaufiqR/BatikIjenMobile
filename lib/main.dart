import 'package:flutter/material.dart';
import 'package:ijen_batik/view/all/register_page.dart';
import 'package:ijen_batik/view/all/splash_screen.dart';

void main() => runApp(
      MaterialApp(
        theme: ThemeData(primaryColor: Colors.white),
        debugShowCheckedModeBanner: false,
        home: SplashScreen(),
      ),
    );
