import 'package:product_app/model/cart_item.dart';

class CartStates {}

class CartLoadingState extends CartStates {}

class CartSuccessState extends CartStates {
  List<CartItem> items;
  double subTotal = 0;
  double discount = 0;
  double totalPrice = 0;
  CartSuccessState(
      {required this.items,
      required this.subTotal,
      required this.discount,
      required this.totalPrice});
}
