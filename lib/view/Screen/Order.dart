// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:get/get.dart';

class orderProduct extends StatefulWidget {
  const orderProduct({Key? key}) : super(key: key);

  @override
  State<orderProduct> createState() => _orderProductState();
}

class _orderProductState extends State<orderProduct> {
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
