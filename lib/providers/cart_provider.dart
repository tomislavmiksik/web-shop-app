import 'package:flutter/material.dart';

class CartItem with ChangeNotifier {
  final String id;
  final String title;
  int quantity;
  final double price;
  final String imgUrl;

  CartItem({
    required this.id,
    required this.title,
    required this.quantity,
    required this.price,
    required this.imgUrl,
  });
}

class Cart with ChangeNotifier {
  Map<String, CartItem> _items = {};

  Map<String, CartItem> get items {
    return _items;
  }

  void addItem(String prodId, String prodTitle, double prodPrice, String imageUrl) {
    if (_items.containsKey(prodTitle)) {
      _items.update(
        prodTitle,
        (value) => CartItem(
            title: value.title,
            id: value.id,
            price: value.price,
            quantity: value.quantity + 1,
            imgUrl: value.imgUrl),
      );
      notifyListeners();
    } else {
      _items.putIfAbsent(
        prodTitle,
        () => CartItem(
            id: DateTime.now().toString(),
            title: prodTitle,
            quantity: 1,
            price: prodPrice,
            imgUrl: imageUrl),
      );
      notifyListeners();
    }
  }

  void removeItem(String prodId, String prodTitle, double prodPrice, String imageUrl, int quantity){
    if(quantity <= 1){
      _items.removeWhere((_,value) => value.title == prodTitle);
    }else{
      _items.update(
        prodTitle,
        (value) => CartItem(
            title: value.title,
            id: value.id,
            price: value.price,
            quantity: value.quantity - 1,
            imgUrl: value.imgUrl),
      );
    }
    notifyListeners();
  }

  double get totalAmount {
    double total = 0.0;
    _items.forEach((key, value) {
      total += value.price * value.quantity;
    });
    return total;
  }

  int get itemCount {
    return _items == null ? 0 : _items.length;
  }
}
