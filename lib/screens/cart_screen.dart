import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:web_shop_app/providers/cart_provider.dart';

class CartScreen extends StatelessWidget {

  static const routePath = 'cart-screen';

  @override
  Widget build(BuildContext context) {

    final cart = Provider.of<Cart>(context);
    return Scaffold(
      backgroundColor: Color(0xFF1f306e),
      appBar: AppBar(
        actions: [
          Card(
          color: Color(0xFF1f306e),
          shadowColor: Colors.transparent,
          //margin: EdgeInsets.all(15),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                const Text(
                  'Total',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,

                  ),
                ),
                const SizedBox(
                  width: 10,
                ),
                Chip(
                  label: Text('\$${cart.totalAmount}', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),),
                  backgroundColor: Color(0xFFf5487f),
                )
              ],
            ),
          ),
        ),],
      ),
      //extendBodyBehindAppBar: true,
      body: Column(
        children: [
          Container(
            //child:
          ),
        ],
      ),
    );
  }
}
