import 'package:flutter/material.dart';
import 'package:product_app/dark_theme.dart';
import 'package:product_app/model/product.dart';
import 'package:product_app/view/home/widget/item.dart';
import 'package:product_app/view/home/widget/see_all.dart';

class Section extends StatelessWidget {
  const Section({super.key, required this.products, required this.title});
  final List<Product> products;
  final String title;

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.fromLTRB(width / 25, 7, 0, 7),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                title,
                style: darkTheme.textTheme.displaySmall,
              ),
              TextButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => SeeAll(
                                  title: title,
                                )));
                  },
                  child: Text(
                    "See all",
                    style: darkTheme.textTheme.displaySmall,
                  )),
            ],
          ),
        ),
        Container(
            padding: const EdgeInsets.only(left: 10),
            margin: const EdgeInsets.only(bottom: 5),
            height: height / 3.8,
            width: width,
            child: ListView.separated(
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) => Item(
                      product: products[index],
                    ),
                separatorBuilder: (context, index) => const SizedBox(
                      width: 10,
                    ),
                itemCount: products.length)),
      ],
    );
  }
}
