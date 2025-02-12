import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tmdt_app/models/cart_models.dart';

final cartProvider =
    StateNotifierProvider<CartNotifier, List<CartModel>>((ref) {
  return CartNotifier();
});

class CartNotifier extends StateNotifier<List<CartModel>> {
  CartNotifier() : super([]);

  void addProductToCart(CartModel product) {
    print("Adding product: ${product.productName}, Quantity: ${product.quantity}");
    state = [...state, product];  // Thêm sản phẩm vào danh sách
  }

  void removeFromCart(String productId) {
    state = state.where((item) => item.productId != productId).toList();
  }
}
