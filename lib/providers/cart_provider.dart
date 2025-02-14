import 'package:flutter/material.dart';
import 'package:shopping_flutter/cart_item.dart';
import 'package:shopping_flutter/product.dart';

class CartProvider with ChangeNotifier {
  final List<CartItem> _cartItems = [];

  List<CartItem> get cartItems => _cartItems;

  double get totalAmount {
    return _cartItems.fold(0, (sum, item) => sum + item.totalPrice);
  }

  void addToCart(Product product) {
    final existingItemIndex =
        _cartItems.indexWhere((item) => item.product.id == product.id);
    if (existingItemIndex >= 0) {
      _cartItems[existingItemIndex].quantity++;
    } else {
      _cartItems.add(CartItem(product: product));
    }
    notifyListeners();
  }

  void removeFromCart(String productId) {
    print('Removing product with ID: $productId');
    _cartItems.removeWhere((item) => item.product.id.toString() == productId);
    notifyListeners();
  }

  void clearCart() {
    _cartItems.clear();
    notifyListeners();
  }
}
