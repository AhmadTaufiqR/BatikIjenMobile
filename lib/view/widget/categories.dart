import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CategoryCard extends StatelessWidget {
  const CategoryCard(
      {super.key,
      required this.image,
      required this.title,
      required this.press});
  final String image, title;
  final VoidCallback press;

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
      onPressed: press,
      style: OutlinedButton.styleFrom(
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(10)),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(
          vertical: 5,
        ),
        child: Column(
          children: [
            Image.asset(
              image,
            ),
            Text(title,
                style: GoogleFonts.dmSans(fontSize: 16, color: Colors.black))
          ],
        ),
      ),
    );
  }
}
