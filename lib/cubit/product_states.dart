import 'package:product_app/model/product.dart';

class ProductStates {}

class ProductSuccessState extends ProductStates {
  List<Product> womenProducts;
  List<Product> manProducts;
  List<Product> electronics;
  ProductSuccessState(
      {required this.womenProducts,
      required this.manProducts,
      required this.electronics});
}

class ProductSuccessCategoryState extends ProductStates {
  List<Product> products;
  ProductSuccessCategoryState({required this.products});
}

class ProductLoadingState extends ProductStates {}

class ProductfailedState extends ProductStates {}

class ProductLoadingPaginationState extends ProductStates {}
