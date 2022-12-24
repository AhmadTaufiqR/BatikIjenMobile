import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ijen_batik/view/Screen/detailProduct.dart';

class Cardvalue extends StatelessWidget {
  final title, img, harga, desc;
  final Map? data;
  const Cardvalue(
      {Key? key, this.title, this.img, this.harga, this.data, this.desc})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => ProductView(data1: data!),
          ),
        );
      },
      child: Card(
        shadowColor: Colors.black,
        elevation: 3,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        color: Colors.blueGrey,
        child: Column(
          children: [
            Stack(
              children: [
                Container(
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(20)),
                    child: Image.network(img)),
                Padding(
                  padding: const EdgeInsets.only(top: 170),
                  child: AnimatedContainer(
                    decoration: const BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(10),
                        bottomRight: Radius.circular(10),
                      ),
                    ),
                    duration: const Duration(milliseconds: 300),
                    width: 180,
                    curve: Curves.bounceIn,
                    height: 105,
                    child: Row(
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Flexible(
                              child: Container(
                                width: 179,
                                padding:
                                    const EdgeInsets.only(left: 10, top: 5),
                                child: Text(
                                  title,
                                  overflow: TextOverflow.ellipsis,
                                  maxLines: 2,
                                  style: GoogleFonts.dmSans(
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                            ),
                            Flexible(
                              child: Container(
                                width: 179,
                                padding:
                                    const EdgeInsets.only(left: 10, top: 15),
                                child: Text(
                                  'Rp. $harga',
                                  style: GoogleFonts.dmSans(
                                    fontWeight: FontWeight.w500,
                                    color: Colors.redAccent,
                                  ),
                                ),
                              ),
                            ),
                            Flexible(
                              child: Container(
                                width: 179,
                                padding: const EdgeInsets.only(
                                    left: 10, top: 5, right: 10),
                                child: Text(
                                  desc,
                                  overflow: TextOverflow.ellipsis,
                                  maxLines: 2,
                                  style: GoogleFonts.dmSans(fontSize: 12),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
