import 'package:flutter/material.dart';
import 'package:ijen_batik/service/service.dart';
import 'package:ijen_batik/view/widget/allproduct.dart';

class rekomendasi extends StatefulWidget {
  const rekomendasi({Key? key}) : super(key: key);

  @override
  State<rekomendasi> createState() => _rekomendasiState();
}

class _rekomendasiState extends State<rekomendasi> {
  @override
  Widget build(BuildContext context) {
    GetxSnippet snip = GetxSnippet();
    return Scaffold(
        body: allproduct(
            back: "/myScreen",
            status: "Rekomendasi",
            back2: "/cart",
            methodP: snip.allproduct()));
  }
}
