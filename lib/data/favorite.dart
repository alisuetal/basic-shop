import 'package:shop/models/product.dart';

class FavoriteProducts {
  static final List<Product> products = [];

  static void addProduct(Product product) {
    if (!checkProduct(product)) {
      products.add(product);
    }
  }

  static void removeProduct(Product product) {
    if (checkProduct(product)) {
      products.remove(product);
    }
  }

  static bool checkProduct(Product product) {
    return products.contains(product);
  }

  static List<Product> getProducts() {
    return products;
  }
}
