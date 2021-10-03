import 'package:flutter/cupertino.dart';
import 'package:web_shop_app/providers/product_items_provider.dart';
import 'package:web_shop_app/widgets/product_item.dart';
import 'package:provider/provider.dart';

class ProductGrid extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    //direct channel to instance of the provider class
    //
    //
    final productData = Provider.of<ProductItemProvider>(context);
    final items = productData.items;

    return GridView.builder(
      padding: const EdgeInsets.all(10),


      //*.value is used when context is not needed and only the value gets passed through
      //otherwise the standard create is implemented
      //.value means that provider works even though data changes
      //it's best used when flutter builds more widgets that get recycled i.e. lists that go beyond the screen
      //

      itemBuilder: (ctx, i) => ChangeNotifierProvider.value(
        // create: (c) {
        //   return items[i];
        // },
        value: items[i],
        child: ProductItem(),
      ),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 3 / 2,
        crossAxisSpacing: 10,
        mainAxisSpacing: 10,
      ),
      itemCount: items.length,
    );
  }
}
