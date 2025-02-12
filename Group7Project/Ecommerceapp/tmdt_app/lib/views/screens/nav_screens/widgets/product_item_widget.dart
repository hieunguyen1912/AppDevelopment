import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tmdt_app/views/screens/inner_screens/product_detail_screen.dart';

class ProductItemWidget extends StatelessWidget {
  final dynamic productData;

  const ProductItemWidget({super.key, required this.productData});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => ProductDetailScreen(productData: productData),
          ),
        );
      },
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
        productData['productImage']?[0] ?? '',
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
        productData['productName'] ?? 'No Name',
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
        productData['category'] ?? 'No Category',
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
            '\$${productData['discount'] ?? '0'}',
            style: GoogleFonts.lato(
              color: const Color(0xFF1E3354),
              fontSize: 20,
              fontWeight: FontWeight.w600,
              letterSpacing: 0.4,
            ),
          ),
          const SizedBox(width: 5),
          Text(
            '\$${productData['productPrice'] ?? '0'}',
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

  /// ⭐ Hiển thị đánh giá và số lượng bán
  Widget _buildRatingsAndSales() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 7),
      child: Row(
        children: [
          const Icon(Icons.star, color: Colors.amber, size: 14),
          const SizedBox(width: 4),
          Text(
            productData['rating']?.toString() ?? '0.0',
            style: GoogleFonts.lato(color: const Color(0xFF7F8E9D), fontSize: 12),
          ),
          const Spacer(),
          Text(
            '${productData['sold'] ?? 0} sold',
            style: GoogleFonts.lato(color: const Color(0xFF7F8E9D), fontSize: 12),
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
