class Product {
  late int id;
  late String title;
  late String description;
  late double price;
  late List images;
  Product.fromApi({required Map<String, dynamic> map}) {
    id = map["id"];
    title = map["title"];
    description = map["description"];
    price = map["price"];
    images = map["images"] as List;
  }
  Product(Product product) {
    id = product.id;
    title = product.title;
    description = product.description;
    price = product.price;
    images = product.images;
  }
}

class ProductsData {
  List<Product> products = [];
  ProductsData({required Map<String, dynamic> map}) {
    var data = map["products"] as List;
    products = List.from(data.map(
      (product) => Product.fromApi(map: product),
    ));
  }
}
