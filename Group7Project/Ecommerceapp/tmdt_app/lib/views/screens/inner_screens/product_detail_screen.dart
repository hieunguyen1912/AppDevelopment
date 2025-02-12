import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tmdt_app/provider/cart_provider.dart';
import 'package:tmdt_app/models/cart_models.dart';

class ProductDetailScreen extends ConsumerStatefulWidget {
  final dynamic productData;

  const ProductDetailScreen({super.key, required this.productData});

  @override
  _ProductDetailScreenState createState() => _ProductDetailScreenState();
}

class _ProductDetailScreenState extends ConsumerState<ProductDetailScreen> {
  String selectedSize = ''; // Lưu size được chọn

  @override
  Widget build(BuildContext context) {
    final cartProviderNotifier = ref.read(cartProvider.notifier);

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'Product Detail',
          style: GoogleFonts.lato(fontWeight: FontWeight.bold, fontSize: 18),
        ),
        actions: [
          IconButton(
            onPressed: () {}, 
            icon: const Icon(Icons.favorite, color: Colors.red),
          )
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildProductImage(),
            _buildProductInfo(),
            _buildSizeSelector(),
            _buildDescription(),
            const Spacer(),
            _buildAddToCartButton(cartProviderNotifier),
            const SizedBox(height: 10),
          ],
        ),
      ),
    );
  }

  /// 🖼 **Hiển thị hình ảnh sản phẩm**
  Widget _buildProductImage() {
    return Center(
      child: Container(
        width: 260,
        height: 274,
        decoration: const BoxDecoration(),
        child: Stack(
          children: [
            Positioned(
              left: 0,
              top: 50,
              child: Container(
                width: 260,
                height: 260,
                decoration: BoxDecoration(
                  color: Colors.black,
                  borderRadius: BorderRadius.circular(130),
                ),
              ),
            ),
            Positioned(
              left: 22,
              top: 0,
              child: Container(
                width: 216,
                height: 274,
                decoration: BoxDecoration(
                  color: const Color(0xFF9CA8FF),
                  borderRadius: BorderRadius.circular(108),
                ),
                child: widget.productData['productImage'] != null &&
                        widget.productData['productImage'].isNotEmpty
                    ? PageView.builder(
                        itemCount: widget.productData['productImage'].length,
                        itemBuilder: (context, index) {
                          return Image.network(
                            widget.productData['productImage'][index],
                            width: 198,
                            height: 225,
                            fit: BoxFit.cover,
                          );
                        },
                      )
                    : const Center(child: Text("No Image Available")),
              ),
            ),
          ],
        ),
      ),
    );
  }

  /// 📌 **Tên sản phẩm & Giá**
  Widget _buildProductInfo() {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            widget.productData['productName'] ?? 'Unknown Product',
            style: GoogleFonts.roboto(
              fontSize: 17,
              fontWeight: FontWeight.bold,
              color: const Color(0xFF3C55EF),
            ),
          ),
          Text(
            '\$${widget.productData['productPrice'] ?? '0.00'}',
            style: GoogleFonts.roboto(
              fontSize: 17,
              fontWeight: FontWeight.bold,
              color: const Color(0xFF3C55EF),
            ),
          ),
        ],
      ),
    );
  }

  /// 👕 **Chọn Size Sản Phẩm**
  Widget _buildSizeSelector() {
    return Padding(
      padding: const EdgeInsets.only(top: 8),
      child: Row(
        children: [
          Text(
            'Size: ',
            style: GoogleFonts.roboto(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: const Color(0xFF343434),
            ),
          ),
          Expanded(
            child: widget.productData['productSize'] != null &&
                    widget.productData['productSize'].isNotEmpty
                ? SizedBox(
                    height: 50,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: widget.productData['productSize'].length,
                      itemBuilder: (context, index) {
                        final size = widget.productData['productSize'][index];
                        return GestureDetector(
                          onTap: () {
                            setState(() {
                              selectedSize = size;
                            });

                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                content: Text("Selected size: $size"),
                                duration: const Duration(seconds: 1),
                              ),
                            );
                          },
                          child: Container(
                            margin: const EdgeInsets.symmetric(horizontal: 5),
                            alignment: Alignment.center,
                            width: 50,
                            height: 50,
                            decoration: BoxDecoration(
                              color: selectedSize == size
                                  ? Colors.blue
                                  : Colors.grey[200],
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Text(
                              size,
                              style: GoogleFonts.roboto(
                                fontSize: 17,
                                color: const Color(0xFF343434),
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                  )
                : const Text("No Sizes Available"),
          ),
        ],
      ),
    );
  }

  /// 📖 **Mô tả sản phẩm**
  Widget _buildDescription() {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'About',
            style: GoogleFonts.lato(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: const Color(0xFF363330),
            ),
          ),
          Text(
            widget.productData['description'] ?? 'No description available.',
            style: GoogleFonts.roboto(
              fontSize: 16,
              color: const Color(0xFF363330),
            ),
          ),
        ],
      ),
    );
  }

  /// 🛒 **Nút "Add to Cart"**
  Widget _buildAddToCartButton(CartNotifier cartProviderNotifier) {
    return SizedBox(
      width: double.infinity,
      height: 50,
      child: ElevatedButton.icon(
        onPressed: () {
          if (selectedSize.isEmpty) {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(
                content: Text("Please select a size!"),
                duration: Duration(seconds: 2),
              ),
            );
            return;
          }

          cartProviderNotifier.addProductToCart(
            CartModel(
              productName: widget.productData['productName'],
              productPrice: widget.productData['productPrice'],
              categoryname: widget.productData['category'],
              imageUrl: widget.productData['productImage'],
              quantity: 1,
              instock: widget.productData['quantity'],
              productId: widget.productData['productId'],
              productSize: selectedSize,
              discount: widget.productData['discount'],
              description: widget.productData['description'],
            ),
          );

          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text("Added to Cart!"),
              duration: Duration(seconds: 2),
            ),
          );
        },
        icon: const Icon(Icons.shopping_cart, color: Colors.white),
        label: Text("Add to Cart", style: GoogleFonts.roboto(fontSize: 18, color: Colors.white)),
        style: ElevatedButton.styleFrom(
          backgroundColor: const Color(0xFF3C55EF),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        ),
      ),
    );
  }
}
