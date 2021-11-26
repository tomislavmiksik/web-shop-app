import 'package:flutter/material.dart';
import 'package:web_shop_app/providers/cart_provider.dart';
import 'dart:math';

class OrderItem {
  final int id;
  final double amount;
  final List<CartItem> items;
  final DateTime dateTime;

  OrderItem(
      {required this.id,
      required this.amount,
      required this.items,
      required this.dateTime});

  factory OrderItem.fromJson(Map<String, dynamic> json) {
    return OrderItem(
      id: json['id'],
      amount: json['amount'],
      dateTime: json['dateTime'],
      items: json['items'],
    );
  }
}

class Orders with ChangeNotifier {
  List<OrderItem> _orders = [];

  List<OrderItem> get orders {
    return [..._orders];
  }

  void addOrder(List<CartItem> cartContent, double total) {
    if (total != 0) {
      var rnd = Random();
      _orders.insert(
        0,
        OrderItem(
            //random broj dddati umjesto datuma
            //s
            id: rnd.nextInt(999999),
            amount: total,
            dateTime: DateTime.now(),
            items: cartContent),
      );
    } else {
      return;
    }
    notifyListeners();
  }
}
