import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:web_shop_app/providers/cart_provider.dart';

class CartListItem extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final cartItem = Provider.of<CartItem>(context);
    final cart = Provider.of<Cart>(context);

    return Dismissible(
      direction: DismissDirection.endToStart,
      background: Container(
        padding: const EdgeInsets.all(12),
        margin: const EdgeInsets.symmetric(vertical: 10),
        color: const Color(0xFFDF6464),
        child: const Icon(
          Icons.delete_forever,
          size: 35,
          color: Colors.white,
        ),
        alignment: Alignment.centerRight,
      ),
      onDismissed: (DismissDirection direction) {
        cart.removeItem(cartItem.id, cartItem.title, cartItem.price,
            cartItem.imgUrl, cartItem.quantity);
      },
      key: UniqueKey(),
      child: Card(
        color: const Color(0xFF082032),
        margin: const EdgeInsets.only(top: 10, bottom: 10),
        child: Padding(
          padding: const EdgeInsets.all(8),

          //tile containing the info
          //
          //
          child: ListTile(
            leading: CircleAvatar(
              backgroundImage: NetworkImage(cartItem.imgUrl),
            ),
            title: Text(
              cartItem.title,
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            subtitle: Text(
              '\$${(cartItem.price * cartItem.quantity).toStringAsFixed(2)}',
              style: const TextStyle(
                  fontSize: 15,
                  color: Colors.white,
                  fontWeight: FontWeight.bold),
            ),

            //row containing quantity info and add/remove buttons
            //
            //
            trailing: SizedBox(
              width: 150,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  IconButton(
                    onPressed: () => cart.removeItem(
                        cartItem.id,
                        cartItem.title,
                        cartItem.price,
                        cartItem.imgUrl,
                        cartItem.quantity),
                    icon: const Icon(
                      Icons.remove,
                      color: Color(0xFFDF6464),
                    ),
                    splashColor: const Color(0xFFDF6464),
                  ),
                  Text(
                    cartItem.quantity.toString(),
                  ),
                  IconButton(
                    onPressed: () => cart.addItem(cartItem.id, cartItem.title,
                        cartItem.price, cartItem.imgUrl),
                    icon: const Icon(
                      Icons.add,
                      color: Color(0xFF66C1E6),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
