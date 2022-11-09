import 'package:flutter/material.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ijen_batik/models/category.dart';

class CategoryProduk extends StatelessWidget {
  const CategoryProduk({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 84,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        itemCount: categories.length,
        itemBuilder: (context, index) => CategoryCard(
          image: categories[index].icon,
          title: categories[index].title,
          press: () {},
        ),
        separatorBuilder: (context, index) => const SizedBox(width: 5),
      ),
    );
  }
}

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
          borderRadius: BorderRadius.all(Radius.circular(defaultBorderRadius)),
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

const Color primaryColor = Color(0xFFF67952);
const Color bgColor = Color(0xFFFBFBFD);

const double defaultPadding = 16.0;
const double defaultBorderRadius = 12.0;
