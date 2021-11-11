import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:web_shop_app/providers/cart_provider.dart';
import 'package:web_shop_app/providers/product_item_provider.dart';
import 'package:web_shop_app/screens/orders_screen.dart';
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
      backgroundColor: const Color(0x111213ff),
      appBar: AppBar(
        title: const Text('Web Shop'),
        actions: [
          PopupMenuButton(
            color: const Color(0xFF1f306e),
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
              const PopupMenuItem(
                child: Text('Only Favourites'),
                value: FilterOptions.Favourites,
              ),
              const PopupMenuItem(
                child: Text('Show All'),
                value: FilterOptions.All,
              )
            ],
            icon: const Icon(Icons.more_vert),
          ),
          Consumer<Cart>(
            builder: (_, cartData, ch) => Badge(
              value: cartData.itemCount.toString(),
              color: const Color(0xFF52ADD1),
              child: ch!,
            ),
            child: IconButton(
              icon: const Icon(Icons.shopping_cart),
              onPressed: () {
                Navigator.of(context).pushNamed(CartScreen.routePath);
              },
              splashColor: const Color(0xFF52ADD1),
            ),
          ),
        ],
      ),
      body: ProductGrid(_showOnlyFavourites),
    );
  }
}
