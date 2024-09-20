import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:product_app/dark_theme.dart';
import 'package:product_app/model/cart.dart';
import 'package:product_app/model/product.dart';

class CategoryItem extends StatelessWidget {
  const CategoryItem({super.key, required this.product});
  final Product product;
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Container(
      height: height / 3,
      width: width / 2.5,
      decoration: BoxDecoration(
        color: Colors.blueAccent[100]!.withOpacity(0.1),
        borderRadius: BorderRadius.circular(15),
      ),
      child: Padding(
        padding: const EdgeInsets.only(bottom: 5),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Align(
              alignment: Alignment.center,
              child: Container(
                height: height / 6,
                width: double.infinity,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                ),
                child: CachedNetworkImage(
                  imageUrl: product.images[0],
                  height: height / 6,
                  fit: BoxFit.fitHeight,
                ),
              ),
            ),
            const SizedBox(
              height: 5,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 5),
              child: Text(
                overflow: TextOverflow.ellipsis,
                product.title,
                style: darkTheme.textTheme.bodyMedium,
              ),
            ),
            const Spacer(),
            Padding(
              padding: const EdgeInsets.fromLTRB(5, 0, 15, 0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "€${product.price}",
                    style: darkTheme.textTheme.bodySmall,
                  ),
                  InkWell(
                    onTap: () => Cart.addItem(product: product),
                    child: Container(
                      height: width / 13,
                      width: width / 13,
                      decoration: BoxDecoration(
                          color: Colors.black,
                          borderRadius: BorderRadius.circular(10)),
                      child: const Icon(
                        Icons.shopping_bag_outlined,
                        color: Colors.white,
                        size: 22,
                      ),
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
