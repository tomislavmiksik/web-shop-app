import 'package:flutter/material.dart';

import 'package:web_shop_app/providers/orders_provider.dart';
import 'package:web_shop_app/widgets/order_list_item_detail.dart';

class OrderListItem extends StatelessWidget {
  final OrderItem order;

  OrderListItem(this.order);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Card(
        margin: const EdgeInsets.only(top: 10, bottom: 10),
        color: Colors.transparent,
        child: ListTile(
          leading: Text('\#${order.id.toString()}'),
          trailing: Text('\$${order.amount.toStringAsFixed(2)}'),
        ),
      ),

      /* onLongPress: () {
        showDialog(
          context: context,
          builder: (context) {
            return Padding(
              padding: const EdgeInsets.symmetric(vertical: 200),
              child: Dialog(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),

                ),
                backgroundColor: Color(0x111213ff),
                elevation: 50,
                child: Container(
                    child: ListView.builder(
                  itemBuilder: (ctx, i) => OrderListItemDetail(order.items[i]),
                  itemCount: order.items.length,
                )),
              ),
            );
          },
        );
      }, */
    );
  }
}
