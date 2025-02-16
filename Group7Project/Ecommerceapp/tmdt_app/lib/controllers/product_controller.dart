import 'package:flutter/material.dart';
import 'package:tmdt_app/models/product_model.dart';
import 'package:tmdt_app/views/screens/inner_screens/product_detail_screen.dart';

class ProductController {
  void navigateToProductDetail(BuildContext context, dynamic product) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => ProductDetailScreen(productData: product),
      ),
    );
  }
}