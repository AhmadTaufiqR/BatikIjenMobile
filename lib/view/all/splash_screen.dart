import 'dart:async';

import 'package:flutter/material.dart';
import 'package:ijen_batik/view/all/dash.dart';
import 'package:ijen_batik/view/all/login_page.dart';
import 'package:ijen_batik/view/components/background.dart';

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
      Duration(seconds: 7),
      () => Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => login(),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Background_image(
        assets: "assets/img/211.png",
      ),
    );
  }
}
