import 'dart:async';

import 'package:flutter/material.dart';
import 'package:ijen_batik/view/Screen/login_page.dart';
import 'package:ijen_batik/view/widget/background.dart';

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
      const Duration(seconds: 7),
      () => Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => const login(),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Background_image(
        assets: "assets/img/211.png",
      ),
    );
  }
}
