import 'package:flutter/material.dart';

class CartModel extends ChangeNotifier {
  final List<Map<String, dynamic>> _items = [];

  List<Map<String, dynamic>> get items => _items;

  void addToCart(Map<String, dynamic> shoe, String size) {
    final item = {
      'name': shoe['name'],
      'price': shoe['price'],
      'imageURL': shoe['imageURL'],
      'size': size,
    };
    _items.add(item);
    notifyListeners(); // Notify listeners for state update
  }

  void removeFromCart(int index) {
    _items.removeAt(index);
    notifyListeners();
  }
}

final cartModel = CartModel();
