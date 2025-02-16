import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:badges/badges.dart' as badges;
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tmdt_app/provider/cart_provider.dart';
import 'package:tmdt_app/views/screens/inner_screens/checkout_screen.dart';
import 'package:tmdt_app/views/screens/main_screens.dart';

class CartScreens extends ConsumerStatefulWidget {
  const CartScreens({super.key});

  @override
  _CartScreensState createState() => _CartScreensState();
}

class _CartScreensState extends ConsumerState<CartScreens> {
  @override
  Widget build(BuildContext context) {
    final cartData = ref.watch(cartProvider);
    final cartProviderNotifier = ref.read(cartProvider.notifier);
    final totalAmount = cartProviderNotifier.calculateTotalAmount();

    return Scaffold(
      appBar: _buildAppBar(cartData.length),
      body: cartData.isEmpty
          ? _buildEmptyCart(context)
          : Column(
              children: [
                Expanded( // ✅ Đảm bảo ListView không bị lỗi
                  child: _buildCartList(cartData, cartProviderNotifier),
                ),
              ],
            ),
      bottomNavigationBar: _buildBottomBar(totalAmount),
    );
  }

  PreferredSizeWidget _buildAppBar(int cartCount) {
    return AppBar(
      toolbarHeight: MediaQuery.of(context).size.height * 0.1,
      backgroundColor: const Color.fromARGB(255, 13, 13, 220),
      centerTitle: true,
      title: Text(
        "My Cart",
        style: GoogleFonts.lato(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.white),
      ),
      actions: [
        Stack(
          children: [
            IconButton(
              icon: const Icon(CupertinoIcons.bell, color: Colors.white),
              onPressed: () {},
            ),
            if (cartCount > 0)
              Positioned(
                right: 4,
                top: 4,
                child: badges.Badge(
                  badgeStyle: badges.BadgeStyle(
                    badgeColor: Colors.yellow.shade900,
                  ),
                  badgeContent: Text(
                    cartCount.toString(),
                    style: GoogleFonts.lato(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
          ],
        ),
      ],
    );
  }

  Widget _buildEmptyCart(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'Your shopping cart is empty.',
            textAlign: TextAlign.center,
            style: GoogleFonts.roboto(fontSize: 17, letterSpacing: 1.5),
          ),
          const SizedBox(height: 10),
          ElevatedButton(
            onPressed: () {
              Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => MainScreen()));
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: const Color.fromARGB(255, 13, 13, 220),
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
            ),
            child: Text("Shop Now", style: GoogleFonts.lato(fontSize: 16, color: Colors.white)),
          ),
        ],
      ),
    );
  }

  Widget _buildCartList(List cartData, CartNotifier cartProviderNotifier) {
    return ListView.builder(
      itemCount: cartData.length,
      padding: const EdgeInsets.symmetric(vertical: 10),
      itemBuilder: (context, index) {
        final cartItem = cartData[index];
        return _buildCartItem(cartItem, cartProviderNotifier);
      },
    );
  }

  Widget _buildCartItem(cartItem, CartNotifier cartProviderNotifier) {
    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      child: ListTile(
        leading: ClipRRect(
          borderRadius: BorderRadius.circular(8),
          child: Image.network(
            cartItem.imageUrl[0],
            width: 70,
            height: 70,
            fit: BoxFit.cover,
          ),
        ),
        title: Text(
          cartItem.productName,
          style: GoogleFonts.lato(fontWeight: FontWeight.bold),
        ),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              cartItem.categoryname,
              style: GoogleFonts.lato(fontSize: 14, color: Colors.grey),
            ),
            Text(
              '\$${cartItem.productPrice}',
              style: GoogleFonts.lato(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.red),
            ),
          ],
        ),
        trailing: _buildQuantityControls(cartItem, cartProviderNotifier),
      ),
    );
  }

  Widget _buildQuantityControls(cartItem, CartNotifier cartProviderNotifier) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        IconButton(
          onPressed: () => cartProviderNotifier.decrementItem(cartItem.productId),
          icon: const Icon(CupertinoIcons.minus_circle, color: Colors.blue),
        ),
        Text(cartItem.quantity.toString(), style: GoogleFonts.lato(fontSize: 16)),
        IconButton(
          onPressed: () => cartProviderNotifier.incrementItem(cartItem.productId),
          icon: const Icon(CupertinoIcons.plus_circle, color: Colors.blue),
        ),
        IconButton(
          onPressed: () => cartProviderNotifier.removeFromCart(cartItem.productId),
          icon: const Icon(CupertinoIcons.trash, color: Colors.red),
        ),
      ],
    );
  }

  Widget _buildBottomBar(double totalAmount) {
    return Container(
      height: 100,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border(top: BorderSide(color: Colors.grey.shade300)),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("Subtotal", style: GoogleFonts.roboto(fontSize: 16, color: Colors.grey)),
              Text(
                "\$${totalAmount.toStringAsFixed(2)}",
                style: GoogleFonts.roboto(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.red),
              ),
            ],
          ),
          ElevatedButton.icon(
            onPressed: totalAmount > 0 ? () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => CheckoutScreen(),
                ),
              );
            } : null,
            style: ElevatedButton.styleFrom(
              backgroundColor: totalAmount > 0 ? Colors.blue : Colors.grey,
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
            ),
            icon: const Icon(Icons.shopping_cart_checkout, color: Colors.white),
            label: Text("Checkout", style: GoogleFonts.lato(fontSize: 16, color: Colors.white)),
          ),
        ],
      ),
    );
  }
}
