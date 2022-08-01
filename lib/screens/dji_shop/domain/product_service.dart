import 'package:injectable/injectable.dart';

import 'package:flutter_animation/screens/dji_shop/domain/product.dart';
import 'package:flutter_animation/screens/dji_shop/domain/product_repository.dart';

@singleton
class ProductService {
  ProductService(this._productRepository);
  final ProductRepository _productRepository;

  List<Product>? _products;
  List<Product>? get products => _products;

  Product? _product;
  Product? get product => _product;

  Future<Product?> getProduct(int id) async {
    _product = await _productRepository.getProduct(id);
    return _product;
  }

  Future<List<Product>?> getProducts() async {
    _products = await _productRepository.getProducts();
    return _products;
  }
}
