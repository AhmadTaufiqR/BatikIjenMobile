import 'package:flutter/material.dart';
import 'package:ijen_batik/view/components/login_button.dart';

class LoginPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: ListView(
          children: [
            SizedBox(
              height: 10,
            ),
            login_button(),
          ],
        ),
      ),
    );
  }
}
