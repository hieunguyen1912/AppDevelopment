import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tmdt_app/controllers/product_controller.dart';
import 'package:tmdt_app/models/product_model.dart';
import 'package:tmdt_app/views/screens/inner_screens/product_detail_screen.dart';

class ProductItemWidget extends StatelessWidget {
  final dynamic product;

  const ProductItemWidget({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    final productController = ProductController();

    return InkWell(
      onTap: () => productController.navigateToProductDetail(context, product),
      child: Container(
        width: 146,
        height: 245,
        clipBehavior: Clip.antiAlias,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
          boxShadow: [
            BoxShadow(
              color: const Color(0x0f040828),
              blurRadius: 20,
              offset: const Offset(0, 10),
            )
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildProductImage(),
            const SizedBox(height: 5),
            _buildProductName(),
            _buildCategory(),
            _buildPrice(),
            _buildFavoriteButton(),
          ],
        ),
      ),
    );
  }

  /// 🖼 Hiển thị hình ảnh sản phẩm
  Widget _buildProductImage() {
    return Container(
      width: double.infinity,
      height: 110,
      decoration: BoxDecoration(
        color: const Color.fromARGB(225, 194, 202, 212),
        borderRadius: BorderRadius.circular(4),
        border: Border.all(width: 0.8, color: Colors.white),
      ),
      child: Image.network(
        product['productImage'][0],
        width: 110,
        height: 110,
        fit: BoxFit.contain,
        errorBuilder: (context, error, stackTrace) =>
            const Icon(Icons.broken_image, size: 50, color: Colors.grey),
      ),
    );
  }

  /// 📌 Hiển thị tên sản phẩm
  Widget _buildProductName() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 7),
      child: Text(
        product['productName'],
        style: GoogleFonts.lato(
          color: const Color(0xFF1E3354),
          fontSize: 14,
          fontWeight: FontWeight.bold,
          letterSpacing: 0.3,
        ),
        maxLines: 2,
        overflow: TextOverflow.ellipsis,
      ),
    );
  }

  /// 🏷️ Hiển thị danh mục sản phẩm
  Widget _buildCategory() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 7),
      child: Text(
        product['category'],
        style: GoogleFonts.lato(
          color: const Color(0xFF1E3354),
          fontSize: 12,
          fontWeight: FontWeight.bold,
          letterSpacing: 0.2,
        ),
      ),
    );
  }

  /// 💰 Hiển thị giá sản phẩm và giảm giá
  Widget _buildPrice() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 7),
      child: Row(
        children: [
          Text(
            '\$${product['discount']}',
            style: GoogleFonts.lato(
              color: const Color(0xFF1E3354),
              fontSize: 20,
              fontWeight: FontWeight.w600,
              letterSpacing: 0.4,
            ),
          ),
          const SizedBox(width: 5),
          Text(
            '\$${product['productPrice']}',
            style: GoogleFonts.lato(
              color: Colors.grey,
              fontSize: 16,
              fontWeight: FontWeight.w600,
              letterSpacing: 0.3,
              decoration: TextDecoration.lineThrough,
            ),
          ),
        ],
      ),
    );
  }

 
  /// ❤️ Nút yêu thích (Favorite)
  Widget _buildFavoriteButton() {
    return Positioned(
      right: 8,
      top: 8,
      child: IconButton(
        onPressed: () {
          // TODO: Thêm logic yêu thích sản phẩm
        },
        icon: const Icon(Icons.favorite_border, color: Colors.red, size: 18),
      ),
    );
  }
}