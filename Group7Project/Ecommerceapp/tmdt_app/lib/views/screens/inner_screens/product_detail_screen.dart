import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ProductDetailScreen extends StatelessWidget {
  final dynamic productData;

  const ProductDetailScreen({super.key, required this.productData});

  @override
  Widget build(BuildContext context) {
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
                        child: productData['productImage'] != null &&
                                productData['productImage'].isNotEmpty
                            ? PageView.builder(
                                scrollDirection: Axis.horizontal,
                                itemCount: productData['productImage'].length,
                                itemBuilder: (context, index) {
                                  return Image.network(
                                    productData['productImage'][index],
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
                    productData['productName'] ?? 'Unknown Product',
                    style: GoogleFonts.roboto(
                      fontSize: 17,
                      fontWeight: FontWeight.bold,
                      letterSpacing: 1,
                      color: const Color(0xFF3C55EF),
                    ),
                  ),
                  Text(
                    '\$${productData['productPrice'] ?? '0.00'}',
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
                productData['category'] ?? 'Unknown Category',
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
                      child: productData['productSize'] != null &&
                              productData['productSize'].isNotEmpty
                          ? ListView.builder(
                              scrollDirection: Axis.horizontal,
                              itemCount: productData['productSize'].length,
                              itemBuilder: (context, index) {
                                return InkWell(
                                  onTap: () {
                                    // Thêm chức năng chọn size nếu cần
                                  },
                                  child: Container(
                                    margin: const EdgeInsets.symmetric(horizontal: 5),
                                    alignment: Alignment.center,
                                    width: 50,
                                    height: 50,
                                    decoration: BoxDecoration(
                                      color: Colors.grey[200],
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                    child: Text(
                                      productData['productSize'][index],
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
                      letterSpacing: 1
                    ),
                  ),

                  Text(
                  productData['description'] ?? 'No description available.',
                  style: GoogleFonts.roboto(
                      color: Color(0xFF363330),
                      fontSize: 16,
                      letterSpacing: 1
                    ),
                  ),
                ]
              ),
            ),

            const Spacer(), // Đẩy nút xuống cuối màn hình

            SizedBox(
              width: double.infinity,
              height: 50,
              child: ElevatedButton.icon(
                onPressed: () {
                  // Xử lý sự kiện khi bấm Add to Cart
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
