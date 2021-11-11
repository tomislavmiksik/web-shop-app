import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:web_shop_app/widgets/order_list_item.dart';
import '../providers/orders_provider.dart';

class OrdersScreen extends StatelessWidget {
  static const routePath = 'orders-screen';

  @override
  Widget build(BuildContext context) {
    final orderData = Provider.of<Orders>(context);

    return Scaffold(
      backgroundColor: const Color(0x111213ff),
      //backgroundColor: Colors.red,
      appBar: AppBar(
        title: const Text('List of orders'),
      ),
      body: ListView.builder(
        itemCount: orderData.orders.length,
        itemBuilder: (ctx, i) => OrderListItem(orderData.orders[i]),
      ),
    );
  }
}
