import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ijen_batik/service/service.dart';
import 'package:ijen_batik/view/Screen/dash.dart';
import 'package:ijen_batik/view/widget/autocom.dart';
import 'package:ijen_batik/view/widget/card.dart';

class ProductListCategory extends StatefulWidget {
  const ProductListCategory({Key? key}) : super(key: key);

  @override
  State<ProductListCategory> createState() => _ProductListCategoryState();
}

class _ProductListCategoryState extends State<ProductListCategory> {
  GetxSnippet snip = GetxSnippet();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
          child: Container(
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
                                          builder: (context) =>
                                              const Dashboard()));
                                },
                                child: SvgPicture.asset(
                                    'assets/icon/arrowback.svg'),
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
                                        builder: (context) =>
                                            const Dashboard()));
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
                  child: Text("Gadget",
                      style: GoogleFonts.dmSans(
                          fontSize: 24, fontWeight: FontWeight.bold)),
                ),
                const SizedBox(
                  height: 25,
                ),
                const autocom(),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 7),
                  child: FutureBuilder(
                    future: snip.allproduct(),
                    initialData: [],
                    builder: (context, snapshot) {
                      if (snapshot.hasError) print(snapshot.error);
                      List data = snapshot.data;
                      return snapshot.hasData
                          ? GridView.builder(
                              shrinkWrap: true,
                              physics: const ScrollPhysics(),
                              gridDelegate:
                                  const SliverGridDelegateWithMaxCrossAxisExtent(
                                      maxCrossAxisExtent: 290,
                                      childAspectRatio: 0.65,
                                      crossAxisSpacing: 3,
                                      mainAxisSpacing: 3),
                              itemCount: data.length,
                              itemBuilder: (context, index) {
                                return Cardvalue(
                                  title: data[index]['nama_produk'],
                                  img:
                                      "http://10.0.2.2/api/baru/uploads/${data[index]['gambar_produk']}",
                                  harga: data[index]['harga_produk'],
                                  data: data[index],
                                  desc: data[index]['rincian_produk'],
                                );
                              },
                            )
                          : const Center(
                              child: CircularProgressIndicator(),
                            );
                    },
                  ),
                )
              ],
            ),
          ),
        ),
        bottomNavigationBar: Container(
          height: 70,
          padding: const EdgeInsets.all(8.0),
          child: OutlinedButton(
            onPressed: () {
              snip.allproduct();
            },
            style: OutlinedButton.styleFrom(
                side: const BorderSide(),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10))),
            child: Text(
              "Filter & Sorting",
              style: GoogleFonts.dmSans(
                  fontSize: 14,
                  color: Colors.black,
                  fontWeight: FontWeight.bold),
            ),
          ),
        ));
  }
}
