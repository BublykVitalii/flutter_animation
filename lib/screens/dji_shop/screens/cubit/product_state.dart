part of 'product_cubit.dart';

enum ProductStatus {
  initial,
  loading,
  success,
  error,
}

class ProductState extends Equatable {
  final ProductStatus status;
  final String? errorMessage;
  final List<Product>? products;
  final Product? product;

  const ProductState({
    this.status = ProductStatus.initial,
    this.errorMessage,
    this.products,
    this.product,
  });

  ProductState copyWith({
    ProductStatus? status,
    String? errorMessage,
    List<Product>? products,
    Product? product,
  }) {
    return ProductState(
      status: status ?? this.status,
      errorMessage: errorMessage ?? this.errorMessage,
      products: products ?? this.products,
      product: product ?? this.product,
    );
  }

  @override
  List<Object?> get props => [
        status,
        errorMessage,
        products,
        product,
      ];
}
