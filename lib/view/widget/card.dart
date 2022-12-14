import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Cardvalue extends StatelessWidget {
  final title, img, harga;
  const Cardvalue({Key? key, this.title, this.img, this.harga})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
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
                              padding: const EdgeInsets.only(left: 10, top: 5),
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
                              padding: const EdgeInsets.only(left: 10, top: 15),
                              child: Text(
                                'Rp.$harga',
                                style: GoogleFonts.dmSans(
                                  fontWeight: FontWeight.w500,
                                  color: Colors.redAccent,
                                ),
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 7, top: 10),
                            child: Row(
                              children: [
                                const Icon(
                                  Icons.star_rate_rounded,
                                  color: Color.fromRGBO(255, 193, 32, 100),
                                  size: 18,
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(left: 1),
                                  child: Text(
                                    '4.5',
                                    style: GoogleFonts.dmSans(
                                      fontSize: 11,
                                    ),
                                  ),
                                ),
                              ],
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
    );
  }
}
