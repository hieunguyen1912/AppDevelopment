class ProductModel {
  final String productName;
  final String category;
  final double productPrice;
  final double discount;
  final double rating;
  final int sold;
  final List<String> productImage;

  ProductModel({
    required this.productName,
    required this.category,
    required this.productPrice,
    required this.discount,
    required this.rating,
    required this.sold,
    required this.productImage,
  });

  factory ProductModel.fromJson(Map<String, dynamic> json) {
    return ProductModel(
      productName: json['productName'],
      category: json['category'],
      productPrice: json['productPrice'],
      discount: json['discount'],
      rating: json['rating'],
      sold: json['sold'],
      productImage: List<String>.from(json['productImage']),
    );
  }

  static fromMap(Map<String, dynamic> productData) {
    return ProductModel(
      productName: productData['productName'],
      category: productData['category'],
      productPrice: productData['productPrice'],
      discount: productData['discount'],
      rating: productData['rating'],
      sold: productData['sold'],
      productImage: List<String>.from(productData['productImage']),
    );
  }
}