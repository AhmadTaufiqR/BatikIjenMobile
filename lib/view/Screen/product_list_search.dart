import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ijen_batik/models/argumentsSearch.dart';
import 'package:ijen_batik/service/service.dart';
import 'package:ijen_batik/view/widget/card.dart';

class ProductListSearch extends StatefulWidget {
  const ProductListSearch({Key? key}) : super(key: key);

  @override
  State<ProductListSearch> createState() => _ProductListSearchState();
}

class _ProductListSearchState extends State<ProductListSearch> {
  GetxSnippet snip = GetxSnippet();
  @override
  Widget build(BuildContext context) {
    final args = ModalRoute.of(context)!.settings.arguments as argumentsSearch;
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
                        onTap: () {
                          Get.toNamed('/cart');
                        },
                      )
                    ],
                  )
                ],
            body: SingleChildScrollView(
              child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 7),
                  child: GridView.builder(
                    shrinkWrap: true,
                    physics: const ScrollPhysics(),
                    gridDelegate:
                        const SliverGridDelegateWithMaxCrossAxisExtent(
                            maxCrossAxisExtent: 290,
                            childAspectRatio: 0.65,
                            crossAxisSpacing: 3,
                            mainAxisSpacing: 3),
                    itemCount: args.data!.length,
                    itemBuilder: (context, index) {
                      return Cardvalue(
                        title: args.data![index]['nama_produk'],
                        img:
                            "http://10.0.2.2/api/baru/uploads/${args.data![index]['gambar_produk']}",
                        harga: args.data![index]['harga_produk'],
                        data: args.data![index],
                        desc: args.data![index]['rincian_produk'],
                      );
                    },
                  )),
            )));
  }
}
