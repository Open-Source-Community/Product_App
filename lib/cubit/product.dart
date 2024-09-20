import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:product_app/cubit/product_states.dart';
import 'package:product_app/model/product.dart';

class ProductCubit extends Cubit<ProductStates> {
  ProductCubit() : super(ProductStates());
  List<Product> allProducts = [];
  List<Product> womenProducts = [];
  List<Product> manProducts = [];
  List<Product> electronics = [];
  int paginationNum = 0;
  void getData() async {
    try {
      emit(ProductLoadingState());
      Response responseMan = await Dio().get(
          "https://dummyjson.com/products?limit=10&skip=83&select=title,price,description,id,images");
      Response responseWomen = await Dio().get(
          "https://dummyjson.com/products?limit=10&skip=172&select=title,price,description,id,images");
      Response responseElectronics = await Dio().get(
          "https://dummyjson.com/products/category/laptops?select=title,price,description,id,images");
      ProductsData productsMan = ProductsData(map: responseMan.data);
      ProductsData productsWomen = ProductsData(map: responseWomen.data);
      ProductsData productsElectronics =
          ProductsData(map: responseElectronics.data);
      manProducts = productsMan.products;
      womenProducts = productsWomen.products;
      electronics = productsElectronics.products;
      emit(ProductSuccessState(
          manProducts: manProducts,
          womenProducts: womenProducts,
          electronics: electronics));
    } on DioException {
      emit(ProductfailedState());
    }
  }

  void getAllProducts({bool paginat = false}) async {
    try {
      if (paginat) {
        emit(ProductLoadingPaginationState());
      } else {
        emit(ProductLoadingState());
      }
      Response response = await Dio().get(
          "https://dummyjson.com/products?limit=20&skip=$paginationNum&select=title,price,description,id,images");
      ProductsData productsData = ProductsData(map: response.data);
      allProducts.addAll(productsData.products);
      paginationNum += 20;
      emit(ProductSuccessCategoryState(products: allProducts));
    } on DioException {
      emit(ProductfailedState());
    }
  }

  void getGenderProducts(String category) async {
    try {
      emit(ProductLoadingState());
      Response response;
      if (category == "Man Category") {
        response = await Dio().get(
            "https://dummyjson.com/products?limit=15&skip=83&select=title,price,description,id,images");
      } else if (category == "Women Category") {
        response = await Dio().get(
            "https://dummyjson.com/products?limit=22&skip=172&select=title,price,description,id,images");
      } else {
        getElectronicsProducts();
        return;
      }
      ProductsData productsData = ProductsData(map: response.data);
      allProducts = productsData.products;
      emit(ProductSuccessCategoryState(products: allProducts));
    } on DioException {
      emit(ProductfailedState());
    }
  }

  void getElectronicsProducts() async {
    try {
      emit(ProductLoadingState());
      List<String> pages = [
        "https://dummyjson.com/products/category/laptops?select=title,price,description,id,images",
        "https://dummyjson.com/products/category/smartphones?select=title,price,description,id,images",
        "https://dummyjson.com/products/category/mobile-accessories?select=title,price,description,id,images"
      ];

      for (int i = 0; i < 3; i++) {
        Response response = await Dio().get(pages[i]);
        ProductsData productsData = ProductsData(map: response.data);
        allProducts.addAll(productsData.products);
      }
      emit(ProductSuccessCategoryState(products: allProducts));
    } on DioException {
      emit(ProductfailedState());
    }
  }
}
