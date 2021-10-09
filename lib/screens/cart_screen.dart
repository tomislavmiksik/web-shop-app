import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:web_shop_app/providers/cart_provider.dart';
import 'package:web_shop_app/widgets/cart_list_item.dart';

class CartScreen extends StatelessWidget {
  static const routePath = 'cart-screen';

  @override
  Widget build(BuildContext context) {
    final cart = Provider.of<Cart>(context);

    return Scaffold(
      backgroundColor: const Color(0xFF1f306e),
      appBar: AppBar(
        actions: [
          Card(
            color: const Color(0xFF1f306e),
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
                    label: Text(
                      '\$${cart.totalAmount.toString()}',
                      style: const TextStyle(
                          color: Colors.white, fontWeight: FontWeight.bold),
                    ),
                    backgroundColor: const Color(0xFFf5487f),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
      //extendBodyBehindAppBar: true,
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemBuilder: (ctx, i) => ChangeNotifierProvider.value(
                value: cart.items.values.toList()[i],
                child: CartListItem(),
              ),
              itemCount: cart.itemCount,
            ),
          ),
        ],
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: SizedBox(
          width: MediaQuery.of(context).size.width * 0.7,
          //height: MediaQuery.of(context).size.height * 0.05,
          child: ElevatedButton(
            onPressed: () {},
            child: Text('Order Now!'),
          )),
    );
  }
}
