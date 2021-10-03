import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:web_shop_app/providers/product_provider.dart';
import 'package:web_shop_app/screens/product_detail_screen.dart';

class ProductItem extends StatelessWidget {
  // final String id;
  // final String title;
  // final String imgUrl;
  // final double price;

  //ProductItem(this.id, this.title, this.imgUrl, this.price);

  @override
  Widget build(BuildContext context) {
    //nested provider
    //
    //
    final product = Provider.of<ProductProvider>(context, listen: false);

    //Clip widget to round the borders of the widget
    //Consumer is used when wanting to rebuild only a part of the tree
    //
    return ClipRRect(
      borderRadius: BorderRadius.circular(12),
      //tile containing the info about the product
      //
      //
      child: GridTile(
        child: GestureDetector(
          onTap: () {
            Navigator.of(context)
                .pushNamed(ProductDetailScreen.routePath, arguments: {
              'id': product.id,
            });
          },
          //image of the product
          //
          child: Container(
            child: Image.network(
              product.imageUrl,
              fit: BoxFit.cover,
            ),
          ),
        ),
        footer: GridTileBar(
          //Consumer is used when wanting to rebuild only a part of the tree, even though the provider is set not to listen
          //add to favourites button
          //Consumer/Provider is useful when it matters to multiple widgets
          //
          leading: Material(
            color: Colors.transparent,
            borderRadius: BorderRadius.circular(4),
            child: IconButton(
              splashRadius: 25,
              splashColor: Color(0xFFf5487f),
              icon: Consumer<ProductProvider>(
                builder: (ctx, product, _) => Icon(
                  product.isFavourite ? Icons.favorite : Icons.favorite_border,
                  color: product.isFavourite ? Color(0xFFf5487f) : Colors.white,
                ),
                //child: Text('Never changes'),
              ),
              onPressed: () {
                product.toggleFavouriteStatus();
              },
            ),
          ),

          //add to cart button
          //
          //
          trailing: IconButton(
            icon: Icon(
              Icons.shopping_cart,
              color: Color(0xFFf5487f),
            ),
            onPressed: () {},
          ),

          //contains the title and price of the item
          //
          //
          title: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Text(
                product.title,
                textAlign: TextAlign.center,
              ),
              Text(
                '\$${product.price.toString()}',
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
