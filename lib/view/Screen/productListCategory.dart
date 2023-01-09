// ignore_for_file: file_names
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ijen_batik/main.dart';
import 'package:ijen_batik/models/argumencatgory.dart';
import 'package:ijen_batik/service/service.dart';
import 'package:ijen_batik/view/widget/autocom.dart';
import 'package:ijen_batik/view/widget/card.dart';

class ProductListCategory extends StatefulWidget {
  const ProductListCategory({Key? key}) : super(key: key);

  @override
  State<ProductListCategory> createState() => _ProductListCategoryState();
}

class _ProductListCategoryState extends State<ProductListCategory> {
  @override
  Widget build(BuildContext context) {
    final args = ModalRoute.of(context)!.settings.arguments as argumentcategory;
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Stack(
              children: [
                Container(
                  decoration: const BoxDecoration(boxShadow: [
                    BoxShadow(
                        blurRadius: 5,
                        blurStyle: BlurStyle.normal,
                        color: Colors.black12,
                        spreadRadius: 80)
                  ]),
                ),
                Container(
                  height: 80,
                  decoration: const BoxDecoration(color: Colors.white),
                  child: Padding(
                    padding: const EdgeInsets.only(top: 17),
                    child: Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 15),
                          child: InkWell(
                            onTap: () {
                              Navigator.pushReplacement(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => const MyScreen()));
                            },
                            child: Image.asset('assets/img/vector.png'),
                          ),
                        ),
                        Center(
                          widthFactor: 4.68,
                          child: Text(
                            "Category",
                            style: GoogleFonts.dmSans(
                              fontWeight: FontWeight.bold,
                              fontSize: 16,
                            ),
                          ),
                        ),
                        InkWell(
                          onTap: () {
                            Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => const MyScreen()));
                          },
                          child: SvgPicture.asset('assets/icon/vector.svg'),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 30,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 11),
              child: Text(args.produk!,
                  style: GoogleFonts.dmSans(
                      fontSize: 24, fontWeight: FontWeight.bold)),
            ),
            const SizedBox(
              height: 25,
            ),
            const autocom(),
            Padding(
                padding: const EdgeInsets.symmetric(horizontal: 7),
                child: GridView.builder(
                  shrinkWrap: true,
                  physics: const ScrollPhysics(),
                  gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                      maxCrossAxisExtent: 290,
                      childAspectRatio: 0.65,
                      crossAxisSpacing: 3,
                      mainAxisSpacing: 3),
                  itemCount: args.data!.length,
                  itemBuilder: (context, index) {
                    return Cardvalue(
                      title: args.data![index]['nama_produk'],
                      img:
                          "https://sanggar-batik.wstif3a-bws.id/gambar/${args.data![index]['gambar_produk']}",
                      harga: args.data![index]['harga_produk'],
                      data: args.data![index],
                      desc: args.data![index]['rincian_produk'],
                    );
                  },
                ))
          ],
        ),
      ),
    );
  }
}
