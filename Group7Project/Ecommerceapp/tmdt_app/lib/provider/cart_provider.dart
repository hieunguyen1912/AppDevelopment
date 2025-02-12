import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tmdt_app/models/cart_models.dart';

final cartProvider =
    StateNotifierProvider<CartNotifier, List<CartModel>>((ref) {
  return CartNotifier();
});

class CartNotifier extends StateNotifier<List<CartModel>> {
  CartNotifier() : super([]);

  void addProductToCart(CartModel product) {
    print(
        "Adding product: ${product.productName}, Quantity: ${product.quantity}");
    state = [...state, product]; // Thêm sản phẩm vào danh sách
  }

  void removeFromCart(String productId) {
    state = state.where((item) => item.productId != productId).toList();
  }

  void incrementItem(String productId) {
    state = state.map((item) {
      if (item.productId == productId) {
        return item.copyWith(quantity: item.quantity + 1);
      }
      return item;
    }).toList();
  }

  void decrementItem(String productId) {
    state = state.map((item) {
      if (item.productId == productId && item.quantity > 1) {
        return item.copyWith(quantity: item.quantity - 1);
      }
      return item;
    }).toList();
  }

  double calculateTotalAmount() {
    double totalAmount = 0.0;
    state.forEach((cartItem) {
      totalAmount += cartItem.quantity * cartItem.discount;
    });
    return totalAmount;
  }
}
