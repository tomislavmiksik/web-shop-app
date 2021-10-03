import 'package:flutter/material.dart';

class CartItem {
  final String id;
  final String title;
  int quantity;
  final double price;

  CartItem(
      {required this.id,
      required this.title,
      required this.quantity,
      required this.price});
}

class Cart with ChangeNotifier {
  Map<String,CartItem> _items = {};

  Map<String,CartItem> get items{
    return _items;
  }

  void addItem(String prodId, String prodTitle, double prodPrice){
    if(_items.containsKey(prodId)){
      _items.update(prodId, (value) => CartItem(title: value.title, id: value.id, price: value.price, quantity: value.quantity + 1));
      notifyListeners();
    }else{
      _items.putIfAbsent(prodId, () => CartItem(id: DateTime.now().toString(), title: prodTitle, quantity: 1 ,price: prodPrice));
      notifyListeners();
    }
  }

  double get totalAmount{
    double total = 0.0;
    _items.forEach((key, value) {
      total += value.price * value.quantity;
    });
    return total;
  }


  int get itemCount{
    return _items == null ? 0 : _items.length;
  }

}
