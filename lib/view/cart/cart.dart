
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:product_app/cubit/cart.dart';
import 'package:product_app/cubit/cart_states.dart';
import 'package:product_app/dark_theme.dart';
import 'package:product_app/model/cart_item.dart';
import 'package:product_app/view/cart/widget/cart_item.dart';
import 'package:product_app/view/cart/widget/check_out.dart';

class CartScraen extends StatelessWidget {
  const CartScraen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => CartCubit()..getData(),
      child: Scaffold(
          appBar: AppBar(
            forceMaterialTransparency: true,
            title: Text(
              "My Cart",
              style: darkTheme.textTheme.displaySmall,
            ),
            centerTitle: true,
          ),
          body: BlocBuilder<CartCubit, CartStates>(
            builder: (context, state) {
              if (state is CartLoadingState) {
                return Center(
                    child: Image.asset("asset/Animation - 1722642940048.gif"));
              } else if (state is CartSuccessState) {
                return SingleChildScrollView(
                  child: Column(
                    children: [
                      for (CartItem item in state.items)
                        ItemCart(
                          cartItem: item,
                          cartCubit: BlocProvider.of<CartCubit>(context),
                        ),
                    ],
                  ),
                );
              } else {
                return Container();
              }
            },
          ),
          bottomNavigationBar: BlocBuilder<CartCubit, CartStates>(
            builder: (context, state) {
              if (state is CartLoadingState) {
                return const SizedBox(
                  height: 0,
                  width: 0,
                );
              } else if (state is CartSuccessState) {
                return CheckOut(
                  subTotal: state.subTotal,
                  discount: state.discount,
                  totalPrice: state.totalPrice,
                  cartCubit: BlocProvider.of<CartCubit>(context),
                );
              } else {
                return const SizedBox(
                  height: 0,
                  width: 0,
                );
              }
            },
          )),
    );
  }
}
