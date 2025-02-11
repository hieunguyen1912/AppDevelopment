class CartModel {
  final String productName;
  final int productPrice;
  final String categoryname;
  final List imageUrl;
  final int quantily;
  final int instock;
  final String productId;
  final String productSize;
  final int discount;
  final String description;

  CartModel(
      {required this.productName,
      required this.productPrice,
      required this.categoryname,
      required this.imageUrl,
      required this.quantily,
      required this.instock,
      required this.productId,
      required this.productSize,
      required this.discount,
      required this.description});
}
