class CartModel {
  final String productName;
  final String productPrice;
  final String categoryname;
  final List imageUrl;
  int quantity;
  final int instock;
  final String productId;
  final String productSize;
  final int discount;
  final String description;

  CartModel({
    required this.productName,
    required this.productPrice,
    required this.categoryname,
    required this.imageUrl,
    required this.quantity,
    required this.instock,
    required this.productId,
    required this.productSize,
    required this.discount,
    required this.description,
  });

  CartModel copyWith({
    String? productName,
    String? productPrice,
    String? categoryname,
    List? imageUrl,
    int? quantity,
    int? instock,
    String? productId,
    String? productSize,
    int? discount,
    String? description,
  }) {
    return CartModel(
      productName: productName ?? this.productName,
      productPrice: productPrice ?? this.productPrice,
      categoryname: categoryname ?? this.categoryname,
      imageUrl: imageUrl ?? this.imageUrl,
      quantity: quantity ?? this.quantity,
      instock: instock ?? this.instock,
      productId: productId ?? this.productId,
      productSize: productSize ?? this.productSize,
      discount: discount ?? this.discount,
      description: description ?? this.description,
    );
  }
}
