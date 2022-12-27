import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: NestedScrollView(
          floatHeaderSlivers: true,
          headerSliverBuilder: (context, innerBoxIsScrolled) => [
                SliverAppBar(
                  backgroundColor: Colors.white,
                  floating: true,
                  expandedHeight: 60,
                  snap: true,
                  leading: InkWell(
                    child: Image.asset('assets/img/vector.png'),
                    onTap: () => Navigator.pop(context),
                  ),
                  actions: <Widget>[
                    InkWell(
                      child: Image.asset('assets/logo/2.png'),
                      onTap: () {},
                    ),
                    InkWell(
                      child: Image.asset('assets/logo/keranjang.png'),
                      onTap: () {
                        Get.toNamed('/cart');
                      },
                    )
                  ],
                )
              ],
          body: Container()),
    );
  }
}
