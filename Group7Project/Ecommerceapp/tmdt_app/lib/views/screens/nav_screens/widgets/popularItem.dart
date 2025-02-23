import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:tmdt_app/views/screens/inner_screens/product_detail_screen.dart';

class PopularItem extends StatelessWidget {
  const PopularItem({
    super.key,
    required this.productData,
  });

  final QueryDocumentSnapshot<Object?> productData;

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
      child: SizedBox(
        width: 110,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(6),
              child: Container(
                width: 87,
                height: 81,
                decoration: BoxDecoration(
                  color: const Color(0xFFB0CCFF), // Fixed color syntax
                  borderRadius: BorderRadius.circular(5),
                ),
                child: Image.network(
                  productData['productImage'][0],
                  width: 71,
                  height: 71,
                  fit: BoxFit.contain,
                ),
              ),
            ),
            const SizedBox(height: 0.8), // Added missing comma
            Text(
              '\$${productData['discount']}', // Fixed string interpolation and key access
              style: const TextStyle(
                color: Color(0xFF1E3354), // Fixed color syntax
                fontSize: 17,
                letterSpacing: 0.4,
                fontWeight: FontWeight.w400,
              ),
            ),
            Text(
              productData['productName'],
              style: const TextStyle(
                // Added const
                color: Colors.black,
                fontSize: 14,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    ); // Removed extra semicolon
  }
}
