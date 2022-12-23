class Product {
  final String productName;
  final String description;
  final String price;
  final int id;
  final List<String> imageProduct;

  Product({
    required this.productName,
    required this.description,
    required this.price,
    required this.id,
    required this.imageProduct,
  });

  @override
  String toString() {
    return 'Product(productName: $productName, description: $description, price: $price, index: $id, imageProduct: $imageProduct,)';
  }
}
