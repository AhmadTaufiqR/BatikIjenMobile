import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProductListSearch extends StatefulWidget {
  const ProductListSearch({Key? key}) : super(key: key);

  @override
  State<ProductListSearch> createState() => _ProductListSearchState();
}

class _ProductListSearchState extends State<ProductListSearch> {
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
            body: Container()));
  }
}
