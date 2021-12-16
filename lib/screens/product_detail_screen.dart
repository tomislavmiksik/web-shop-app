import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:web_shop_app/providers/cart_provider.dart';
import 'package:web_shop_app/providers/product_item_provider.dart';
import 'package:web_shop_app/providers/product_provider.dart';

class ProductDetailScreen extends StatelessWidget {
  static const routePath = 'product-detail';

  @override
  Widget build(BuildContext context) {
    final routeArgs =
        ModalRoute.of(context)!.settings.arguments as Map<String, String>;
    final id = routeArgs['id'];

    //listener that doesn't rerun build jsut taps into data
    //
    //
    final item =
        Provider.of<ProductItemProvider>(context, listen: false).findById(id!);

    final cart = Provider.of<Cart>(context, listen: false);

    return Scaffold(
      backgroundColor: const Color(0x111213ff),
      //extendBodyBehindAppBar: true,
      appBar: AppBar(
        iconTheme: const IconThemeData(
          color: Color(0xFF52ADD1),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add_shopping_cart),
        onPressed: () {
          cart.addItem(item.id, item.title, item.price, item.imageUrl);
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              backgroundColor: const Color(0xFF082032),
              content: const Text('Item added to cart'),
              action: SnackBarAction(
                label: 'Undo',
                textColor: const Color(0xFF52ADD1),
                onPressed: () {
                  //cart.undoAddItem(product.title);
                  cart.undoAddItem(cart.items[item.title] as CartItem);
                },
              ),
              duration: const Duration(seconds: 2),
            ),
          );
        },
        backgroundColor: const Color(0xFF52ADD1),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.only(right: 50, left: 50),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(bottom: 20),
              child: ClipRRect(
                clipBehavior: Clip.hardEdge,
                borderRadius: BorderRadius.circular(12),
                child: SizedBox(
                  child: Image.network(
                    item.imageUrl,
                    fit: BoxFit.cover,
                  ),
                  height: 300,
                  width: double.infinity,
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    item.title,
                    style: const TextStyle(color: Colors.white),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(10),
                  child: Text(
                    '\$${item.price.toString()}',
                    style: const TextStyle(
                        color: Colors.white, fontWeight: FontWeight.bold),
                  ),
                )
              ],
            ),
            Text(
              item.description,
              style: const TextStyle(
                color: Colors.white60,
                fontSize: 18,
              ),
              textAlign: TextAlign.left,
            )
          ],
        ),
      ),
    );
  }
}
