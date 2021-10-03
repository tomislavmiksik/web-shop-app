import 'package:flutter/material.dart';
import 'screens/products_overview_screen.dart';
import 'screens/product_detail_screen.dart';
import 'package:provider/provider.dart';
import 'package:web_shop_app/providers/product_items_provider.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final ThemeData theme = ThemeData(fontFamily: 'Lato');

    //provider widget that alerts select listeners
    //*.value is used when context is not needed and only the value gets passed through
    //otherwise the standard create is implemented
    //
    return ChangeNotifierProvider(
      create: (BuildContext context) {
        return ProductItemProvider();
      },
      child: MaterialApp(
        title: 'MyShop',
        theme: theme.copyWith(
          colorScheme: theme.colorScheme.copyWith(
              primary: Color(0xFFf5487f), secondary: Color(0xFF1f306e)),
          backgroundColor: Color(0xFF1f306e),
          appBarTheme: AppBarTheme(
            color: Colors.transparent,
            shadowColor: Colors.transparent,
          ),
          textTheme: TextTheme(
            bodyText2: TextStyle(
              fontSize: 20,
            ),
          ),
        ),
        home: ProductsOverviewScreen(),
        routes: {
          ProductDetailScreen.routePath: (ctx) => ProductDetailScreen(),
        },
      ),
    );
  }
}
