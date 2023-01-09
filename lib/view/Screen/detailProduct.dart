// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ijen_batik/service/sqlhalper.dart';

class ProductView extends StatefulWidget {
  final Map? data1;
  const ProductView({Key? key, this.data1}) : super(key: key);

  @override
  State<ProductView> createState() => _ProductViewState();
}

class _ProductViewState extends State<ProductView> {
  Map? datas;
  @override
  void initState() {
    datas = widget.data1;
    super.initState();
  }

  Future<void> additems() async {
    await SQLHelper.createItem(datas!['nama_produk'], datas!['gambar_produk'],
        datas!['harga_produk'], '1');
    // ignore: use_build_context_synchronously
    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
      content: Text('Berhasil Menambah Barang!'),
    ));
    // print(datas);
  }

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
                child: Image.asset('assets/logo/keranjang.png'),
                onTap: () {
                  Get.toNamed('/cart');
                },
              )
            ],
          )
        ],
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 350,
                width: double.infinity,
                child: Image.network(
                  "https://sanggar-batik.wstif3a-bws.id/gambar/${datas!['gambar_produk']}",
                  fit: BoxFit.fill,
                ),
              ),
              Container(
                height: 120,
                width: double.infinity,
                decoration: const BoxDecoration(color: Colors.white),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        datas!['nama_produk'],
                        style: GoogleFonts.dmSans(
                            fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(
                        height: 40,
                      ),
                      Text(
                        'Rp. ${datas!['harga_produk']}',
                        style: GoogleFonts.dmSans(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: Colors.red),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Description",
                      style: GoogleFonts.dmSans(
                          fontSize: 16, fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Text("${datas!['rincian_produk']}"),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: Container(
        height: 70,
        padding: const EdgeInsets.all(8.0),
        child: OutlinedButton(
          onPressed: () {
            additems();
          },
          style: OutlinedButton.styleFrom(
              side: const BorderSide(),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10))),
          child: Text(
            "Add To Cart",
            style: GoogleFonts.dmSans(
                fontSize: 14, color: Colors.black, fontWeight: FontWeight.bold),
          ),
        ),
      ),
    );
  }
}
