class ProductModel {
  final String productName;
  final String category;
  final num productPrice;
  final num discount;
  final List<String> productImage;
  final List<String> productSize;
  final String description;
  final int quantity;
  final String productId;

  ProductModel({
    required this.productName,
    required this.category,
    required this.productPrice,
    required this.discount,
    required this.productImage,
    required this.productSize,
    required this.description,
    required this.quantity,
    required this.productId,
  });

  factory ProductModel.fromJson(Map<String, dynamic> json) {
  return ProductModel(
    productName: json['productName'] ?? '', // Kiểm tra null
    category: json['category'] ?? '',
    productPrice: (json['productPrice'] is num)
        ? json['productPrice']
        : num.tryParse(json['productPrice'].toString()) ?? 0, // Ép kiểu an toàn
    discount: (json['discount'] is num)
        ? json['discount']
        : num.tryParse(json['discount'].toString()) ?? 0,
    productSize: (json['productSize'] is List)
        ? List<String>.from(json['productSize'])
        : json['productSize'] != null
            ? json['productSize'].toString().split(', ') // Chuyển đổi nếu bị lỗi
            : [],
    productImage: (json['productImage'] is List)
        ? List<String>.from(json['productImage'])
        : json['productImage'] != null
            ? [json['productImage'].toString()] // Đảm bảo luôn là List<String>
            : [],
    description: json['description'] ?? '',
    quantity: (json['quantity'] is int)
        ? json['quantity']
        : int.tryParse(json['quantity'].toString()) ?? 0,
    productId: json['productId'] ?? '',
  );
}

}
