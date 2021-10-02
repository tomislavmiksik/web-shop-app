import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
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
        Provider.of<ProductProvider>(context, listen: false).findById(id!);

    return Scaffold(
      backgroundColor: Color(0xFF264653),
      appBar: AppBar(
        title: Text(item.title),
      ),
    );
  }
}
