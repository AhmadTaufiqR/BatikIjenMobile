// ignore_for_file: camel_case_types, prefer_typing_uninitialized_variables

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ijen_batik/view/widget/autocom.dart';
import 'package:ijen_batik/view/widget/card.dart';

class allproduct extends StatelessWidget {
  final String back;
  final String? status;
  final String back2;
  Future methodP;

  allproduct(
      {Key? key,
      required this.back,
      this.status,
      required this.back2,
      required this.methodP})
      : super(key: key);

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
              Padding(
                padding: const EdgeInsets.only(right: 15),
                child: InkWell(
                  child: SvgPicture.asset('assets/icon/vector.svg'),
                  onTap: () {
                    Get.toNamed(back2);
                  },
                ),
              )
            ],
          )
        ],
        body: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              const SizedBox(
                height: 30,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 11),
                child: Text(status!,
                    style: GoogleFonts.dmSans(
                        fontSize: 24, fontWeight: FontWeight.bold)),
              ),
              const SizedBox(
                height: 25,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 7),
                child: FutureBuilder(
                  future: methodP,
                  initialData: const [],
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
    );
  }
}
