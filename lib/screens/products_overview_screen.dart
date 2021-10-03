import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:web_shop_app/providers/cart_provider.dart';
import 'package:web_shop_app/providers/product_item_provider.dart';
import 'package:web_shop_app/widgets/product_grid.dart';
import 'package:web_shop_app/widgets/badge.dart';

import 'cart_screen.dart';

enum FilterOptions {
  Favourites,
  All,
}

class ProductsOverviewScreen extends StatefulWidget {
  @override
  State<ProductsOverviewScreen> createState() => _ProductsOverviewScreenState();
}

class _ProductsOverviewScreenState extends State<ProductsOverviewScreen> {
  var _showOnlyFavourites = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF1f306e),
      appBar: AppBar(
        title: const Text('Web Shop'),
        actions: [
          PopupMenuButton(
            color: Color(0xFF1f306e),
            onSelected: (selectedValue) {
              setState(() {
                if (selectedValue == FilterOptions.Favourites) {
                  _showOnlyFavourites = true;
                } else {
                  _showOnlyFavourites = false;
                }
              });
            },
            itemBuilder: (_) => [
              PopupMenuItem(
                child: Text('Only Favourites'),
                value: FilterOptions.Favourites,
              ),
              PopupMenuItem(
                child: Text('Show All'),
                value: FilterOptions.All,
              )
            ],
            icon: Icon(Icons.more_vert),
          ),
          Consumer<Cart>(
            builder: (_, cartData, ch) => Badge(
              value: cartData.itemCount.toString(),
              color: Color(0xFFf5487f),
              child: ch!,
            ),
            child: IconButton(
              icon: Icon(Icons.shopping_cart),
              onPressed: () {
                Navigator.of(context).pushNamed(CartScreen.routePath);
              },
              splashColor: Color(0xFFf5487f),
            ),
          ),
        ],
      ),
      body: ProductGrid(_showOnlyFavourites),
    );
  }
}
