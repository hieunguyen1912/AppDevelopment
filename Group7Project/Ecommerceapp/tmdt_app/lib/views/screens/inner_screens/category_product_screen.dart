import 'package:badges/badges.dart' as badges;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart' show GoogleFonts;
import 'package:tmdt_app/models/category_models.dart';
import 'package:tmdt_app/views/screens/inner_screens/product_detail_screen.dart';

class CategoryProductScreen extends StatelessWidget {
  final CategoryModels categoryModel;

  const CategoryProductScreen({super.key, required this.categoryModel});

  @override
  Widget build(BuildContext context) {
    final Stream<QuerySnapshot> _productStream = FirebaseFirestore.instance
        .collection('products')
        .where('category', isEqualTo: categoryModel.categoryName)
        .snapshots();
    return Scaffold(
      appBar: AppBar(
        title: Text(categoryModel.categoryName),
      ),
      body: StreamBuilder<QuerySnapshot>(
        stream: _productStream,
        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (snapshot.hasError) {
            return const Text('Something went wrong');
          }

          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Text("Loading");
          }

          if (snapshot.data!.docs.isEmpty) {
            return const Center(
              child: Text(
                'No products found\ncheck back later',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
            );
          }

          return GridView.count(
            physics: const ScrollPhysics(),
            shrinkWrap: true,
            crossAxisCount: 3,
            mainAxisSpacing: 15, // Added missing comma
            crossAxisSpacing: 15,
            childAspectRatio: 300 / 500,
            children: List.generate(snapshot.data!.size, (index) {
              final productData = snapshot.data!.docs[index];
              return PopularItem(productData: productData);
            }),
          );
        },
      ),
    ); // Removed extra closing parenthesis
  }
}

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
