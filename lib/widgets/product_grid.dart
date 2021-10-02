import 'package:flutter/cupertino.dart';
import 'package:web_shop_app/providers/product_provider.dart';
import 'package:web_shop_app/widgets/product_item.dart';
import 'package:provider/provider.dart';
class ProductGrid extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    //direct channel to instance of the provider class
    //
    //
    final productData = Provider.of<ProductProvider>(context);
    final items = productData.items;

    return GridView.builder(
      padding: const EdgeInsets.all(10),
      itemBuilder: (ctx, i) => ProductItem(items[i].id, items[i].title,items[i].imageUrl, items[i].price),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 3/2,
        crossAxisSpacing: 10,
        mainAxisSpacing: 10,
      ),
      itemCount: items.length,
    );
  }
}