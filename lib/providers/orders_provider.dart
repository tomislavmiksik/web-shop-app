import 'package:flutter/material.dart';
import 'package:web_shop_app/providers/cart_provider.dart';

class OrderItem {
  final String id;
  final double amount;
  final List<CartItem> items;
  final DateTime dateTime;

  OrderItem(
      {required this.id,
      required this.amount,
      required this.items,
      required this.dateTime});
}

class Orders with ChangeNotifier {
  List<OrderItem> _orders = [];

  List<OrderItem> get orders {
    return [..._orders];
  }

  void addOrder(List<CartItem> cartContent, double total) {
    _orders.insert(
      0,
      OrderItem(
          id: DateTime.now().toString(),
          amount: total,
          dateTime: DateTime.now(),
          items: cartContent),
    );
    notifyListeners();
  }
}
