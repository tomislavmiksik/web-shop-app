import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:web_shop_app/providers/product_item_provider.dart';
import 'package:web_shop_app/providers/product_provider.dart';

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

    ProductProvider product;
/* 
    if (Provider.of<ProductItemProvider>(context, listen: false)
            .findById(id!) ==
        false) {
      product = ProductProvider(
          id: id, description: '', imageUrl: '', price: 0, title: 'gas');
    } else {
      product =
          Provider.of<ProductItemProvider>(context, listen: false).findById(id);
    } */

    product = Provider.of<ProductItemProvider>(context).findById(id!);
    //final product = Provider.of<ProductItemProvider>(context, listen: false).findById(id!);

    //form za unos slike sa malim preview-om, isto vrijedi za ostale elemente
    //
    return Scaffold(
      backgroundColor: const Color(0x111213ff),
      appBar: AppBar(),
      body: Form(
        child: ListView(
          children: [
/*             Padding(
              padding: const EdgeInsets.all(8),
              child: Text(product.id),
            ), */
            Container(
              decoration: const BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(6))),
              padding: const EdgeInsets.only(right: 50, left: 50),
              clipBehavior: Clip.hardEdge,
              child: product.imageUrl == ""
                  ? Image.asset("assets/images/placeholder1.png")
                  : Image.network(
                      product.imageUrl,
                      fit: BoxFit.cover,
                    ),
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: TextFormField(
                initialValue: product.title,
                autocorrect: true,
                decoration: const InputDecoration(
                  enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.white70),
                  ),
                  labelText: 'Title',
                  labelStyle: TextStyle(
                    color: Colors.white70,
                  ),
                ),
                textInputAction: TextInputAction.next,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: TextFormField(
                initialValue: product.description,
                autocorrect: true,
                decoration: const InputDecoration(
                  enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.white70),
                  ),
                  labelText: 'Description',
                  labelStyle: TextStyle(
                    color: Colors.white70,
                  ),
                ),
                textInputAction: TextInputAction.next,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: TextFormField(
                initialValue: '\$${product.price.toStringAsFixed(2)}',
                inputFormatters: [
                  FilteringTextInputFormatter.allow(
                    RegExp(r'^(\d+)?\.?\d{0,2}'),
                  ),
                ],
                autocorrect: true,
                decoration: const InputDecoration(
                  enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.white70),
                  ),
                  labelText: 'Price',
                  labelStyle: TextStyle(
                    color: Colors.white70,
                  ),
                ),
                keyboardType: TextInputType.number,
                textInputAction: TextInputAction.next,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: TextFormField(
                initialValue: product.imageUrl,
                autocorrect: true,
                decoration: const InputDecoration(
                  enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.white70),
                  ),
                  labelText: 'Product image URL',
                  labelStyle: TextStyle(
                    color: Colors.white70,
                  ),
                ),
                textInputAction: TextInputAction.next,
                onFieldSubmitted: (string) {},
              ),
            ),
          ],
        ),
      ),
    );
  }
}
