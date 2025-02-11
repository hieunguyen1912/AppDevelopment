import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tmdt_app/provider/cart_provider.dart';

class CartScreens extends ConsumerStatefulWidget {
  const CartScreens({super.key});

  @override
  _CartScreensState createState() => _CartScreensState();
}

class _CartScreensState extends ConsumerState<CartScreens> {
  @override
  Widget build(BuildContext context) {
    final cartData = ref.watch(cartProviedr);
    return Scaffold(
        body: ListView.builder(
      shrinkWrap: true,
      physics: const ScrollPhysics(),
      itemCount: cartData.length,
      itemBuilder: (context, index) {
        final cartItem = cartData.values.toList()[index];

        return Center(
          child: Text(
            cartItem.productName,
          ),
        );
      },
    ));
  }
}
