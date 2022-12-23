import 'package:flutter_animation/screens/dji_shop/domain/product.dart';
import 'package:injectable/injectable.dart';

@singleton
abstract class ProductRepository {
  Future<Product> getProduct(int id);
  Future<List<Product>> getProducts();
}
