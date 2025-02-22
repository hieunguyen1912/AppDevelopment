import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:tmdt_app/controllers/checkout_controller.dart';
import 'package:tmdt_app/models/cart_models.dart';
import 'package:tmdt_app/provider/cart_provider.dart';

class CheckoutScreen extends ConsumerStatefulWidget {
  const CheckoutScreen({super.key});

  @override
  ConsumerState<CheckoutScreen> createState() => _CheckoutScreenState();
}

class _CheckoutScreenState extends ConsumerState<CheckoutScreen> {
  int _selectedPaymentMethod = 0; 

  @override
  Widget build(BuildContext context) {
    final cartItems = ref.watch(cartProvider);
    final cartNotifier = ref.read(cartProvider.notifier);
    final checkoutController = CheckoutController(context, ref);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Checkout'),
      ),
      body: cartItems.isEmpty
          ? const Center(child: Text("Your cart is empty"))
          : _buildCartList(cartItems, cartNotifier),
      bottomNavigationBar: _buildButton(cartItems, checkoutController),
    );
  }

  Widget _buildCartList(List<CartModel> cartData, CartNotifier cartProviderNotifier) {
    return Column(
      children: [
        InkWell(
          onTap: () {
            
          },
          child: SizedBox(
            height: 50,
            width: double.infinity,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: const [
                Icon(Icons.location_on, color: Colors.red),
                Text("Deliver to this address", style: TextStyle(color: Colors.red)),
              ],
            ),
          ),
        ),
        Expanded(
          child: ListView.builder(
            itemCount: cartData.length,
            padding: const EdgeInsets.all(10),
            itemBuilder: (context, index) {
              final cartItem = cartData[index];
              return _buildCartItem(cartItem);
            },
          ),
        ),

        // Payment Method Selection
        const Text(
          "Choose Payment Method",
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 10),
        ListTile(
          title: const Text("Banking"),
          leading: Radio(
            value: 0,
            groupValue: _selectedPaymentMethod,
            onChanged: (int? value) {
              setState(() => _selectedPaymentMethod = value!);
            },
          ),
        ),
        ListTile(
          title: const Text("Cash on Delivery"),
          leading: Radio(
            value: 1,
            groupValue: _selectedPaymentMethod,
            onChanged: (int? value) {
              setState(() => _selectedPaymentMethod = value!);
            },
          ),
        ),
      ],
    );
  }

  Widget _buildCartItem(CartModel cartItem) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Your item',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 10),
          // Product Card
          Container(
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: Colors.grey[200],
            ),
            child: Row(
              children: [
                Container(
                  width: 80,
                  height: 60,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    image: DecorationImage(
                      image: NetworkImage(cartItem.imageUrl[0]),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                const SizedBox(width: 10),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(cartItem.productName, style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                      Text(cartItem.categoryname, style: const TextStyle(color: Colors.grey)),
                      Text('Quantity: ${cartItem.quantity}', style: const TextStyle(color: Colors.grey)),
                    ],
                  ),
                ),
                Text(
                  '\$${(cartItem.productPrice * cartItem.quantity).toStringAsFixed(2)}',
                  style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.red),
                ),
              ],
            ),
          ),

          const SizedBox(height: 20),
        ],
      ),
    );
  }

  Widget _buildButton(List<CartModel> cartItems, CheckoutController checkoutController) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: SizedBox(
        width: double.infinity,
        height: 50,
        child: ElevatedButton(
          onPressed: () async {
            await checkoutController.placeOrder(cartItems, _selectedPaymentMethod);
          },
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.blue,
            padding: const EdgeInsets.symmetric(vertical: 15),
          ),
          child: const Text(
            "PLACE ORDER",
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.white),
          ),
        ),
      ),
    );
  }
}
