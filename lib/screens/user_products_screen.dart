import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:web_shop_app/providers/product_item_provider.dart';
import 'package:web_shop_app/screens/edit_product_screen.dart';
import 'package:web_shop_app/widgets/product_item.dart';
import 'package:web_shop_app/widgets/user_product_item.dart';

class UserProductsScreen extends StatelessWidget {
  const UserProductsScreen({Key? key}) : super(key: key);

  static const routePath = 'user-products-screen';

  @override
  Widget build(BuildContext context) {
    final productData = Provider.of<ProductItemProvider>(context);
    final productDataLenght = productData.items.length;
    return Scaffold(
      backgroundColor: const Color(0x111213ff),
      appBar: AppBar(
        title: const Text('Product overview'),
        actions: [
          IconButton(
            onPressed: () {
              //print('p' + (productDataLenght + 1).toString());
              Navigator.of(context)
                  .pushNamed(EditProductScreen.routePath, arguments: {
                'id': '',
              });
            },
            icon: const Icon(Icons.add),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(8),
        child: ListView.builder(
          itemBuilder: (ctx, i) => Column(
            children: [
              UserProductItem(product: productData.items[i]),
              const Divider(
                color: Colors.white,
                thickness: 1,
              )
            ],
          ),
          itemCount: productData.items.length,
        ),
      ),
    );
  }
}
