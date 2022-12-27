// ignore_for_file: camel_case_types, prefer_typing_uninitialized_variables

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ijen_batik/models/categories.dart';
import 'package:ijen_batik/view/widget/categories.dart';

class CategoriesPage extends StatefulWidget {
  const CategoriesPage({Key? key}) : super(key: key);

  @override
  State<CategoriesPage> createState() => _CategoriesPageState();
}

class _CategoriesPageState extends State<CategoriesPage> {
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
            onTap: () => Get.back(),
          ),
          actions: <Widget>[
            InkWell(
              child: Image.asset('assets/logo/keranjang.png'),
              onTap: () {},
            )
          ],
        )
      ],
      body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 7),
          child: GridView.builder(
            shrinkWrap: true,
            physics: const ScrollPhysics(),
            gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                maxCrossAxisExtent: 115,
                childAspectRatio: 0.95,
                crossAxisSpacing: 15,
                mainAxisSpacing: 15),
            itemCount: categories.length,
            itemBuilder: (context, index) {
              return CategoryCard(
                image: categories[index].icon,
                title: categories[index].title,
                press: () {},
              );
            },
          )),
    ));
  }
}
