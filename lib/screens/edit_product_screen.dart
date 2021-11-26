import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:web_shop_app/providers/product_item_provider.dart';

class EditProductScreen extends StatefulWidget {
  const EditProductScreen({Key? key}) : super(key: key);

  static const routePath = 'edit-prouduct-screen';

  @override
  State<EditProductScreen> createState() => _EditProductScreenState();
}

class _EditProductScreenState extends State<EditProductScreen> {
  @override
  Widget build(BuildContext context) {
    final routeArgs =
        ModalRoute.of(context)!.settings.arguments as Map<String, String>;
    final id = routeArgs['id'];


     final product =
        Provider.of<ProductItemProvider>(context, listen: false).findById(id!);
    return Scaffold(
      backgroundColor: const Color(0x111213ff),
      appBar: AppBar(),
      body: Container(),
    );
  }
}
