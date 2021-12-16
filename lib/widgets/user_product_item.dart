import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:web_shop_app/providers/product_items_provider.dart';
import 'package:web_shop_app/providers/product_provider.dart';
import 'package:web_shop_app/screens/edit_product_screen.dart';

class UserProductItem extends StatelessWidget {
  final ProductProvider product;

  UserProductItem({required this.product});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ListTile(
        /* leading: CircleAvatar(
          backgroundImage: NetworkImage(product.imageUrl),
        ), */
        leading: Container(
          child: Image.network(product.imageUrl, fit: BoxFit.cover,),
          clipBehavior: Clip.hardEdge,
          decoration: const BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(4)),
          ),
          width: 50,
          height: 50,
        ),
        title: Text(
          product.title,
          style: const TextStyle(fontWeight: FontWeight.bold),
        ),
        trailing: Row(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            //edit button
            //
            IconButton(
              onPressed: () {
                Navigator.of(context)
                    .pushNamed(EditProductScreen.routePath, arguments: {
                  'id': product.id,
                });
              },
              icon: const Icon(Icons.edit),
              color: const Color(0xFF66C1E6),
            ),

            //delete button
            //
            IconButton(
              onPressed: () {},
              icon: const Icon(Icons.delete),
              color: const Color(0xFFDF6464),
              splashColor: const Color(0xFFDF6464),
            )
          ],
        ),
      ),
    );
  }
}
