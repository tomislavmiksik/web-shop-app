import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:web_shop_app/providers/cart_provider.dart';

class CartListItem extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final cartItem = Provider.of<CartItem>(context);
    final cart = Provider.of<Cart>(context);

    return Card(
      color: Color(0xff273d8b),
      margin: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
      child: Padding(
        padding: EdgeInsets.all(8),

        //tile containing the info
        //
        //
        child: ListTile(
          leading: CircleAvatar(
            backgroundImage: NetworkImage(cartItem.imgUrl),
          ),
          title: Text(
            cartItem.title,
            style: TextStyle(
              fontSize: 18,
            ),
          ),
          subtitle: Text(
            '\$${(cartItem.price * cartItem.quantity).toString()}',
            style: TextStyle(
              fontSize: 15,
              color: Color(0xFFf5487f),
              fontWeight: FontWeight.bold
            ),
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
                  onPressed: () => cart.removeItem(cartItem.id, cartItem.title,
                      cartItem.price, cartItem.imgUrl, cartItem.quantity),
                  icon: Icon(
                    Icons.remove,
                    color: Color(0xFFf5487f),
                  ),
                ),
                Text(
                  cartItem.quantity.toString(),
                ),
                IconButton(
                  onPressed: () => cart.addItem(cartItem.id, cartItem.title,
                      cartItem.price, cartItem.imgUrl),
                  icon: Icon(
                    Icons.add,
                    color: Color(0xFFf5487f),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
