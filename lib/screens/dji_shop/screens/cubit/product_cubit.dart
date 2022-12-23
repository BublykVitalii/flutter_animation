import 'package:dio/dio.dart';

import 'package:get_it/get_it.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:flutter_animation/screens/dji_shop/domain/product.dart';
import 'package:flutter_animation/screens/dji_shop/domain/product_service.dart';

part 'product_state.dart';

class ProductCubit extends Cubit<ProductState> {
  ProductCubit() : super(const ProductState());
  ProductService get productService => GetIt.instance.get<ProductService>();

  void getProducts() async {
    try {
      final products = await productService.getProducts();

      emit(state.copyWith(
        status: ProductStatus.success,
        products: products,
      ));
    } on DioError catch (_) {
      rethrow;
    }
  }
}
