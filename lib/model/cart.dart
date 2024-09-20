import 'package:product_app/model/cart_item.dart';
import 'package:product_app/model/product.dart';

class Cart {
  static Map<int, CartItem> items = {};
  static void addItem({required Product product}) {
    CartItem cartItem = CartItem(product: product);
    if (items.containsKey(cartItem.id)) {
      items[cartItem.id]!.addItem();
    } else {
      items[cartItem.id] = cartItem;
    }
  }

  static double getTotal() {
    double total = 0;
    items.forEach((key, value) {
      total += value.price * value.counter;
    });
    return total;
  }

  static void addCounter({required int id}) {
    items[id]!.addItem();
  }

  static void minusCounter({required int id}) {
    if (items[id]!.counter == 1) {
      items.remove(id);
      return;
    }
    items[id]!.deletItem();
  }

  void deletItem({required int id}) {
    items.remove(id);
  }

  static void deletAllItems() {
    items.clear();
  }
}
