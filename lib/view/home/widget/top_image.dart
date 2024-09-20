import 'package:flutter/material.dart';
import 'package:product_app/dark_theme.dart';
import 'package:product_app/view/category/category.dart';

class TopImage extends StatelessWidget {
  const TopImage({super.key});

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;

    return Container(
      alignment: Alignment.center,
      child: Stack(children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(20),
          child: Image.asset(
            "asset/austin-distel-97HfVpyNR1M-unsplash.jpg",
            height: height / 3.8,
            width: width / 1.1,
            fit: BoxFit.cover,
          ),
        ),
        Positioned(
          top: 0,
          left: 0,
          child: Container(
            height: height / 3.8,
            width: width / 1.1,
            decoration: BoxDecoration(
                color: Colors.black.withOpacity(0.5),
                borderRadius: BorderRadius.circular(20)),
          ),
        ),
        Positioned(
            top: 30,
            left: 20,
            height: height / 4.8,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "25% Off",
                  style: darkTheme.textTheme.labelLarge,
                ),
                Text(
                  "Jul 9 - Jul 20",
                  style: darkTheme.textTheme.labelSmall,
                ),
                const Spacer(),
                shopNowButton(width, context),
              ],
            )),
      ]),
    );
  }
}

Widget shopNowButton(double width, context) => SizedBox(
      height: 34,
      width: 130,
      child: ElevatedButton(
        style: ButtonStyle(
            shape: WidgetStateProperty.all<RoundedRectangleBorder>(
                RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12)))),
        onPressed: () {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => const Category()));
        },
        child: Text(
          "Shop Now",
          style: darkTheme.textTheme.titleSmall,
        ),
      ),
    );
