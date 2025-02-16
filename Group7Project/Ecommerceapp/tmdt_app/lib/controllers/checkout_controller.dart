import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tmdt_app/models/cart_models.dart';
import 'package:tmdt_app/provider/cart_provider.dart';
import 'package:uuid/uuid.dart';

class CheckoutController {
  final BuildContext context;
  final WidgetRef ref;

  CheckoutController(this.context, this.ref);

  Future<void> placeOrder(List<CartModel> cartItems, int selectedPaymentMethod) async {
    if (cartItems.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("No items in cart")),
      );
      return;
    }

    try {

      String orderId = Uuid().v4();

      User? user = FirebaseAuth.instance.currentUser;

      if (user == null) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text("Please login to place order")),
        );
        return;
      }
      String userId = user.uid;

      // Calculate total price
      double totalPrice = cartItems.fold(0, (sum, item) => sum + (item.productPrice * item.quantity));

      // Create order data
      Map<String, dynamic> orderData = {
        "orderId": orderId,
        "userId": userId,
        "items": cartItems.map((item) => {
              "productId": item.productId,
              "productName": item.productName,
              "quantity": item.quantity,
              "price": item.productPrice * item.quantity,
            }).toList(),
        "totalAmount": totalPrice,
        "paymentMethod": selectedPaymentMethod == 0 ? "Banking" : "Cash on Delivery",
        "timestamp": FieldValue.serverTimestamp(),
      };

      // Save order to Firestore
      await FirebaseFirestore.instance.collection("orders").add(orderData);

      // Clear cart
      ref.read(cartProvider.notifier).state = [];

      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Order placed successfully!")),
      );

      // Navigate back or to order confirmation screen
      Navigator.pop(context);
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Failed to place order: $e")),
      );
    }
  }
}