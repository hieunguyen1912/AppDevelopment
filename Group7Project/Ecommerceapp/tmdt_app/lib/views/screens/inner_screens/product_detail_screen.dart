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
  @override
  Widget build(BuildContext context) {
    final _cartProvider = ref.read(cartProvider.notifier);

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'Product Detail',
          style: GoogleFonts.lato(
            fontWeight: FontWeight.bold,
            fontSize: 18,
          ),
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.favorite,
              color: Colors.red,
            ),
          )
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Hình ảnh sản phẩm
            Center(
              child: Container(
                width: 260,
                height: 274,
                clipBehavior: Clip.hardEdge,
                decoration: const BoxDecoration(),
                child: Stack(
                  clipBehavior: Clip.none,
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
                                scrollDirection: Axis.horizontal,
                                itemCount:
                                    widget.productData['productImage'].length,
                                itemBuilder: (context, index) {
                                  return Image.network(
                                    widget.productData['productImage'][index],
                                    width: 198,
                                    height: 225,
                                    fit: BoxFit.cover,
                                  );
                                },
                              )
                            : const Center(
                                child: Text("No Image Available"),
                              ),
                      ),
                    ),
                  ],
                ),
              ),
            ),

            // Tên sản phẩm và giá
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 8),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    widget.productData['productName'] ?? 'Unknown Product',
                    style: GoogleFonts.roboto(
                      fontSize: 17,
                      fontWeight: FontWeight.bold,
                      letterSpacing: 1,
                      color: const Color(0xFF3C55EF),
                    ),
                  ),
                  Text(
                    '\$${widget.productData['productPrice'] ?? '0.00'}',
                    style: GoogleFonts.roboto(
                      fontSize: 17,
                      fontWeight: FontWeight.bold,
                      letterSpacing: 1,
                      color: const Color(0xFF3C55EF),
                    ),
                  ),
                ],
              ),
            ),

            // Danh mục sản phẩm
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 4),
              child: Text(
                widget.productData['category'] ?? 'Unknown Category',
                style: GoogleFonts.roboto(
                  fontSize: 17,
                  letterSpacing: 1,
                  color: Colors.grey,
                ),
              ),
            ),

            // Chọn Size sản phẩm
            Padding(
              padding: const EdgeInsets.only(top: 8),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    'Size: ',
                    style: GoogleFonts.roboto(
                      fontSize: 16,
                      letterSpacing: 1.6,
                      color: const Color(0xFF343434),
                    ),
                  ),
                  Expanded(
                    child: SizedBox(
                      height: 50,
                      child: widget.productData['productSize'] != null &&
                              widget.productData['productSize'].isNotEmpty
                          ? ListView.builder(
                              scrollDirection: Axis.horizontal,
                              itemCount:
                                  widget.productData['productSize'].length,
                              itemBuilder: (context, index) {
                                return InkWell(
                                  onTap: () {

                                    ScaffoldMessenger.of(context).showSnackBar(
                                        SnackBar(
                                            margin: const EdgeInsets.all(15),
                                            behavior: SnackBarBehavior.floating,
                                            backgroundColor: Colors.grey,
                                            content: Text(
                                              "Selected size: ${widget.productData['productSize'][index]}"
                                            ),
                                            duration: const Duration(seconds: 1),
                                      )
                                    );
                                    // Thêm chức năng chọn size nếu cần
                                  },
                                  child: Container(
                                    margin: const EdgeInsets.symmetric(
                                        horizontal: 5),
                                    alignment: Alignment.center,
                                    width: 50,
                                    height: 50,
                                    decoration: BoxDecoration(
                                      color: Colors.grey[200],
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                    child: Text(
                                      widget.productData['productSize'][index],
                                      style: GoogleFonts.roboto(
                                        fontSize: 17,
                                        letterSpacing: 1.6,
                                        color: const Color(0xFF343434),
                                      ),
                                    ),
                                  ),
                                );
                              },
                            )
                          : const Center(
                              child: Text("No Sizes Available"),
                            ),
                    ),
                  ),
                ],
              ),
            ),

            Padding(
              padding: const EdgeInsets.symmetric(vertical: 8),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'About',
                      style: GoogleFonts.lato(
                          color: Color(0xFF363330),
                          fontSize: 16,
                          letterSpacing: 1),
                    ),
                    Text(
                      widget.productData['description'] ??
                          'No description available.',
                      style: GoogleFonts.roboto(
                          color: Color(0xFF363330),
                          fontSize: 16,
                          letterSpacing: 1),
                    ),
                  ]),
            ),

            const Spacer(), // Đẩy nút xuống cuối màn hình

            SizedBox(
              width: double.infinity,
              height: 50,
              child: ElevatedButton.icon( 
                onPressed: () {
                  ref.read(cartProvider.notifier).addProductToCart(
                    CartModel(
                      productName: widget.productData['productName'],
                      productPrice: widget.productData['productPrice'],
                      categoryname: widget.productData['category'],
                      imageUrl: widget.productData['productImage'],
                      quantity: 1,
                      instock: widget.productData['quantity'],
                      productId: widget.productData['productId'],
                      productSize: '',
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
                label: Text(
                  "Add to Cart",
                  style: GoogleFonts.roboto(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF3C55EF),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 10),
          ],
        ),
      ),
    );
  }
}
