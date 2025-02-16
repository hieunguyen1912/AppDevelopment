import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:tmdt_app/models/product_model.dart';
import 'package:tmdt_app/views/screens/nav_screens/widgets/product_item_widget.dart';

class RecommendedProductWidget extends StatelessWidget {
  const RecommendedProductWidget({super.key});
  

  @override
  Widget build(BuildContext context) {
    final Stream<QuerySnapshot> _productsStream = FirebaseFirestore.instance.collection('products').snapshots();

    return StreamBuilder<QuerySnapshot>(
      stream: _productsStream,
      builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
        if (snapshot.hasError) {
          return Text('Something went wrong');
        }

        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator());
        }

        return SizedBox(
          height: 250,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: snapshot.data!.docs.length,
            itemBuilder: (context, index) {
              final productData = snapshot.data!.docs[index].data() as Map<String, dynamic>;
              final product = ProductModel.fromMap(productData);
              return ProductItemWidget(product: product,);
            }
          ),
        );
      },
    );
  }
}