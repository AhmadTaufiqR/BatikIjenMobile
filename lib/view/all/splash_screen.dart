import 'dart:async';

import 'package:flutter/material.dart';
import 'package:ijen_batik/view/all/login_page.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Timer(
      Duration(seconds: 4),
      () => Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => LoginPage(),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Image.asset(
          "assets/img/4.png",
          fit: BoxFit.cover,
          width: MediaQuery.of(context).size.width,
          height: double.infinity,
        ),
      ),
    );
  }
}
