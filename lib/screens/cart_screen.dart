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
      backgroundColor: const Color(0x111213ff),
      appBar: AppBar(
        actions: [
          Card(
            color: Colors.transparent,
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
                  Container(
                    padding: EdgeInsets.all(8),
                    decoration: const BoxDecoration(borderRadius: BorderRadius.all(Radius.circular(5)), color: Color(0xFF52ADD1),),
                    child: Text(
                      '\$${cart.totalAmount.toStringAsFixed(2)}',
                      style: const TextStyle(
                          color: Colors.white, fontWeight: FontWeight.bold, fontSize: 15),
                    ),
                  ),
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
        ),
      ),
    );
  }
}
