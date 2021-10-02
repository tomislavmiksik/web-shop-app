import 'package:flutter/material.dart';
import 'package:web_shop_app/screens/product_detail_screen.dart';

class ProductItem extends StatelessWidget {
  final String id;
  final String title;
  final String imgUrl;
  final double price;

  ProductItem(this.id, this.title, this.imgUrl, this.price);

  @override
  Widget build(BuildContext context) {
    //Clip widget to round the borders of the widget
    //
    //
    return ClipRRect(
      clipBehavior: Clip.hardEdge,
      borderRadius: BorderRadius.circular(12),
      child: GridTile(
        child: GestureDetector(
          onTap: () {
            Navigator.of(context).pushNamed(ProductDetailScreen.routePath, arguments: {
              'id':id,
            });
          },
          child: Image.network(
            imgUrl,
            fit: BoxFit.cover,
          ),
        ),
        footer: GridTileBar(
          leading: IconButton(
            icon: Icon(Icons.favorite),
            onPressed: () {},
          ),
          trailing: IconButton(
            icon: Icon(Icons.shopping_cart),
            onPressed: () {},
          ),
          title: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Text(
                title,
                textAlign: TextAlign.center,
              ),
              Text(
                '\$${price.toString()}',
                textAlign: TextAlign.center,
              )
            ],
          ),
          backgroundColor: Colors.black45,
        ),
      ),
    );
  }
}
