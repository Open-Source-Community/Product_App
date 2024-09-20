import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:product_app/cubit/cart_states.dart';
import 'package:product_app/model/cart.dart';
import 'package:product_app/model/cart_item.dart';

class CartCubit extends Cubit<CartStates> {
  CartCubit() : super(CartStates());
  List<CartItem> items = [];
  double subTotal = 0;
  double discount = 0;
  double totalPrice = 0;
  void getData() {
    emit(CartLoadingState());
    items = [];
    Cart.items.forEach(
      (key, value) => items.add(value),
    );

    if (items.isNotEmpty) {
      subTotal = Cart.getTotal();
      discount = subTotal * 25 / 100;
      totalPrice = subTotal - discount;
      emit(CartSuccessState(
          items: items,
          subTotal: subTotal,
          discount: discount,
          totalPrice: totalPrice));
    }
  }

  void deletAllItems() {
    Cart.deletAllItems();
    items.clear();
    emit(CartLoadingState());
  }
}
