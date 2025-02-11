import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tmdt_app/views/screens/inner_screens/product_detail_screen.dart';

class ProductItemWidget extends StatelessWidget {
  const ProductItemWidget({super.key, required this.productData});

  final dynamic productData;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(context, MaterialPageRoute(builder: (context) => ProductDetailScreen(productData: productData,)));
      },
      child: Container(
        width: 146,
        height: 245,
        clipBehavior: Clip.antiAlias,
        decoration: const BoxDecoration(),
        child: Stack(
          clipBehavior: Clip.hardEdge,
          children: [
            Positioned(
              left: 0,
              top: 0,
              child: Container(
                width: 146,
                height: 245,
                clipBehavior: Clip.antiAlias,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                  boxShadow: [
                    BoxShadow(
                      color: Color(0x0f040828),
                      spreadRadius: 0,
                      blurRadius: 20,
                      offset: const Offset(0, 10), 
                    )
                  ]
                ),
              ),
            ),
      
            Positioned(
              left: 7,
              top: 130,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 5.0),
                child: Text(
                  productData['productName'],
                  style: GoogleFonts.lato(
                    color: Color(0xFF1E3354),
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                    letterSpacing: 0.3,
                  ),
                ),
              ),
            ),
      
            Positioned(
              left: 7,
              top: 177,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 5.0),
                child: Text(
                  productData['category'],
                  style: GoogleFonts.lato(
                    color: Color(0xFF1E3354),
                    fontSize: 12,
                    fontWeight: FontWeight.bold,
                    letterSpacing: 0.2,
                  ),
                ),
              ),
            ),
      
            Positioned(
              left: 7,
              top: 207,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 5.0),
                child: Text(
                  '\$${productData['discount']}',
                  style: GoogleFonts.lato(
                    color: Color(0xFF1E3354),
                    fontSize: 20,
                    fontWeight: FontWeight.w600,
                    letterSpacing: 0.4,
                  ),
                ),
              ),
            ),
      
            Positioned(
              left: 51,
              top: 210,
              child: Text(
                '\$${productData['productPrice']}',
                style: GoogleFonts.lato(
                  color: Colors.grey,
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                  letterSpacing: 0.3,
                  decoration: TextDecoration.lineThrough,
                ),
              ),
            ),
      
            Positioned(
              left: 9,
              top: 9,
              child: Container(
                width: 128,
                height: 108,
                clipBehavior: Clip.antiAlias,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(3),
                ),
                child: Stack(
                  clipBehavior: Clip.none,
                  children: [
                    Positioned(
                      left: -1,
                      top: -1,
                      child: Container(
                        width: 130,
                        height: 110,
                        decoration: BoxDecoration(
                          color: Color(0xFFFFF5C3),
                          border: Border.all(
                            width: 0.8,
                            color: Colors.white,
                          ),
                          borderRadius: BorderRadius.circular(4),
                        ),
                      ),
                    ),
                    
                    Positioned(
                      left: 10,
                      top: -10,
                      child: Image.network(
                        productData['productImage'][0],
                        width: 110,
                        height: 110,
                        fit: BoxFit.contain,
                      )
                    )
                  ],
                ),
      
              ),
            ),
            Positioned(
              left: 56,
              top: 155,
              child: Text(
                '500 > sold',
                style: GoogleFonts.lato(
                  color: const Color(0xFF7F8E9D),
                  fontSize: 12,
                )
              )
            ),
      
            Positioned(
              left: 23,
              top:155,
              child: Text(
                "4.5", 
                style: GoogleFonts.lato(
                  color: const Color(0xFF7F8E9D),
                  fontSize: 12,
                )
              ),
            ),
      
            Positioned(
              left: 104,
              top: 15,
              child: Container(
                width: 27,
                height: 27,
                decoration: BoxDecoration(
                  color: Color(0xFFFA634D),
                  borderRadius: BorderRadius.circular(14),
                  boxShadow: const [
                    BoxShadow(
                      color: Color(0x33FF2000),
                      spreadRadius: 0,
                      offset: Offset(0,7),
                      blurRadius: 15,
                    )
                  ] 
                ),
              ),
            ),
      
            Positioned(
              right: 8,
              top: 8,
              child: IconButton(
                onPressed: () {},
                icon: const Icon(Icons.favorite_border, color: Colors.white, size: 16,))
            )
          ],  
        ),
      ),
    );
  }
}