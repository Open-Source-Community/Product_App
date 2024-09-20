import 'package:product_app/model/product.dart';

class CartItem extends Product {
  int counter = 1;
  CartItem({required Product product}) : super(product);
  void addItem() {
    counter++;
  }

  void deletItem() {
    counter--;
  }
}
