import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:product_app/cubit/cart.dart';
import 'package:product_app/dark_theme.dart';
import 'package:product_app/model/cart.dart';
import 'package:product_app/model/cart_item.dart';

class ItemCart extends StatelessWidget {
  const ItemCart({super.key, required this.cartItem, required this.cartCubit});
  final CartItem cartItem;
  final CartCubit cartCubit;
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return SizedBox(
      height: height / 5,
      width: double.infinity,
      child: Row(
        children: [
          Expanded(
            flex: 3,
            child: CachedNetworkImage(
              imageUrl: cartItem.images[0],
              fit: BoxFit.fitHeight,
            ),
          ),
          Expanded(
            flex: 4,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(
                  height: 20,
                ),
                Text(
                  cartItem.title,
                  style: darkTheme.textTheme.bodyMedium,
                ),
                const SizedBox(
                  height: 30,
                ),
                Text(
                  "€${cartItem.price}",
                  style: darkTheme.textTheme.bodyMedium,
                )
              ],
            ),
          ),
          Expanded(
            flex: 3,
            child: Row(
              children: [
                InkWell(
                  onTap: () {
                    Cart.minusCounter(id: cartItem.id);
                    cartCubit.getData();
                  },
                  child: Container(
                    height: width / 12,
                    width: width / 12,
                    alignment: Alignment.center,
                    margin: const EdgeInsets.only(right: 5),
                    decoration: BoxDecoration(
                        color: Colors.black,
                        borderRadius: BorderRadius.circular(10)),
                    child: Text(
                      "-",
                      style: darkTheme.textTheme.displaySmall
                          ?.copyWith(color: Colors.white),
                    ),
                  ),
                ),
                Text(
                  cartItem.counter.toString(),
                  style: darkTheme.textTheme.displaySmall,
                ),
                InkWell(
                  onTap: () {
                    Cart.addCounter(id: cartItem.id);
                    cartCubit.getData();
                  },
                  child: Container(
                    height: width / 12,
                    width: width / 13,
                    alignment: Alignment.center,
                    margin: const EdgeInsets.only(left: 5),
                    decoration: BoxDecoration(
                        color: Colors.black,
                        borderRadius: BorderRadius.circular(10)),
                    child: Text(
                      "+",
                      style: darkTheme.textTheme.displaySmall
                          ?.copyWith(color: Colors.white),
                    ),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
