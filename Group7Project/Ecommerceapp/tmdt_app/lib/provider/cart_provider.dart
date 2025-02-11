import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tmdt_app/models/cart_models.dart';

final cartProviedr =
    StateNotifierProvider<CartNotifier, Map<String, CartModel>>(
  (Ref) {
    return CartNotifier();
  },
);

class CartNotifier extends StateNotifier<Map<String, CartModel>> {
  CartNotifier() : super({});

  void appProductToCart({
    required String productName,
    required int productPrice,
    required String categoryname,
    required List imageUrl,
    required int quantily,
    required int instock,
    required String productId,
    required String productSize,
    required int discount,
    required String description,
  }) {
    if (state.containsKey(productId)) {
      state = {
        ...state,
        productId: CartModel(
          productName: state[productId]!.productName,
          productPrice: state[productId]!.productPrice,
          categoryname: state[productId]!.categoryname,
          imageUrl: state[productId]!.imageUrl,
          quantily: state[productId]!.quantily + 1,
          instock: state[productId]!.instock,
          productId: state[productId]!.productId,
          productSize: state[productId]!.productSize,
          discount: state[productId]!.discount,
          description: state[productId]!.description,
        ),
      };
    } else {
      state = {
        ...state,
        productId: CartModel(
          productName: productName,
          productPrice: productPrice,
          categoryname: categoryname,
          imageUrl: imageUrl,
          quantily: quantily,
          instock: instock,
          productId: productId,
          productSize: productSize,
          discount: discount,
          description: description,
        )
      };
    }
  }

  Map<String, CartModel> get getCartItem => state;
}
