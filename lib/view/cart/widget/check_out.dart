import 'package:flutter/material.dart';
import 'package:product_app/cubit/cart.dart';
import 'package:product_app/dark_theme.dart';
import 'package:product_app/model/cart.dart';

class CheckOut extends StatelessWidget {
  const CheckOut(
      {super.key,
      required this.subTotal,
      required this.discount,
      required this.totalPrice,
      required this.cartCubit});
  final double subTotal;
  final double discount;
  final double totalPrice;
  final CartCubit cartCubit;
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    return Container(
        padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 15),
        height: height / 4,
        decoration: BoxDecoration(
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                  color: Colors.black.withOpacity(0.2),
                  blurRadius: 15,
                  spreadRadius: 2)
            ],
            borderRadius:
                const BorderRadius.vertical(top: Radius.circular(30))),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              children: [
                rowItem("Sub Total", "€${subTotal.toStringAsFixed(2)}"),
                const SizedBox(
                  height: 5,
                ),
                rowItem("Discount", "-€${discount.toStringAsFixed(2)}"),
              ],
            ),
            rowItem("Total Price", "€${totalPrice.toStringAsFixed(2)}"),
            buildBotton(cartCubit),
          ],
        ));
  }
}

Widget rowItem(String text, String price) => Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          text,
          style: darkTheme.textTheme.displaySmall
              ?.copyWith(color: Colors.grey[700]),
        ),
        Text(price, style: darkTheme.textTheme.headlineMedium)
      ],
    );
Widget buildBotton(CartCubit cartCubit) => SizedBox(
      height: 50,
      width: double.infinity,
      child: ElevatedButton(
        style: ButtonStyle(
            backgroundColor: const WidgetStatePropertyAll(Colors.black),
            shape: WidgetStateProperty.all<RoundedRectangleBorder>(
                RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12)))),
        onPressed: () {
          Cart.deletAllItems();
          cartCubit.getData();
        },
        child: Text(
          "Checkout",
          style:
              darkTheme.textTheme.headlineMedium?.copyWith(color: Colors.white),
        ),
      ),
    );
