import 'package:flutter/material.dart';
import 'package:web_shop_app/providers/cart_provider.dart';
import 'package:web_shop_app/widgets/cart_list_item.dart';

class OrderListItemDetail extends StatelessWidget {
  final CartItem item;

  OrderListItemDetail(this.item);

  @override
  Widget build(BuildContext context) {
    return Card(
        color: const Color(0xFF082032),
        //margin: const EdgeInsets.only(top: 10, bottom: 10),
        child: Padding(
          padding: const EdgeInsets.all(8),
          //tile containing the info
          //
          //
          child: ListTile(
            leading: CircleAvatar(
              backgroundImage: NetworkImage(item.imgUrl),
            ),
            title: Text(
              item.title,
              style: const TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.bold,
              ),
            ),
            subtitle: Text(
              '\$${(item.price * item.quantity).toStringAsFixed(2)}',
              style: const TextStyle(
                  fontSize: 12,
                  color: Colors.white,
                  fontWeight: FontWeight.bold),
            ),

            //row containing quantity info and add/remove buttons
            //
            //
            trailing: SizedBox(
              width: 60,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text(
                    item.quantity.toString(),
                  ),
                ],
              ),
            ),
          ),
        ),
      );
  }
}
