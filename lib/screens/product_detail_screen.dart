import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:web_shop_app/providers/product_items_provider.dart';

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

    return Scaffold(
      backgroundColor: Color(0xFF1f306e),
      //extendBodyBehindAppBar: true,
      appBar: AppBar(
        iconTheme: IconThemeData(
          color: Color(0xFFf5487f),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add_shopping_cart),
        onPressed: () {},
        backgroundColor: Color(0xFFf5487f),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.only(right: 50, left: 50),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(bottom: 20),
              child: ClipRRect(
                clipBehavior: Clip.hardEdge,
                borderRadius: BorderRadius.circular(12),
                child: Container(child: Image.network(item.imageUrl)),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    item.title,
                    style: TextStyle(color: Colors.white),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(10),
                  child: Text(
                    '\$${item.price.toString()}',
                    style: TextStyle(
                        color: Colors.white, fontWeight: FontWeight.bold),
                  ),
                )
              ],
            ),
            Text(item.description, style: TextStyle(color: Colors.white60, fontSize: 18), textAlign: TextAlign.left,)
          ],
        ),
      ),
    );
  }
}
