import 'package:flutter/material.dart';
import 'package:web_shop_app/widgets/product_grid.dart';

class ProductsOverviewScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF1f306e),
      appBar: AppBar(
        title: const Text('Web Shop'),
        actions: [
          PopupMenuButton(
            onSelected: (selectedValue){
              print(selectedValue);
            },
            itemBuilder: (_) => [
              PopupMenuItem(
                child: Text('Only Favourites'),
                value: 0,
              ),
              PopupMenuItem(
                child: Text('Show All'),
                value: 0,
              )
            ],
            icon: Icon(Icons.more_vert),
          )
        ],
      ),
      body: ProductGrid(),
    );
  }
}
