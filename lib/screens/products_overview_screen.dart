import 'package:flutter/material.dart';
import 'package:web_shop_app/widgets/product_grid.dart';

class ProductsOverviewScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF264653),
      appBar: AppBar(
        title: const Text('Web Shop'),
      ),
      body: ProductGrid(),
    );
  }
}

