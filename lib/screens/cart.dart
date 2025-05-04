import 'package:flutter/material.dart';

class Cart with ChangeNotifier {
  final List<Map<String, dynamic>> _items = [];

  List<Map<String, dynamic>> get items => _items;

  void addItem(Map<String, dynamic> product) {
    _items.add(product);
    notifyListeners();
  }

  void removeItem(int index) {
    _items.removeAt(index);
    notifyListeners();
  }

  void clearCart() {
    _items.clear();
    notifyListeners();
  }

  int get itemCount => _items.length;

  double get totalPrice =>
      _items.fold(0, (sum, item) => sum + (item['price'] as double));

  void checkout() {
    // Logic for checkout (e.g., API call to process payment)
    clearCart(); // Clear cart after checkout
  }
}