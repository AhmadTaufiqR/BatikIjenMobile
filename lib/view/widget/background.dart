import 'package:flutter/cupertino.dart';

class Background_image extends StatelessWidget {
  const Background_image({super.key, required this.assets});
  final String assets;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage(assets),
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
