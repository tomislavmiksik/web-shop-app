import 'package:flutter/material.dart';
import 'screens/products_overview_screen.dart';
import 'screens/product_detail_screen.dart';
import 'package:provider/provider.dart';
import 'package:web_shop_app/providers/product_provider.dart';
void main() => runApp(MyApp());

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = ThemeData(fontFamily: 'Lato');
    //provider widget that alerts select listeners
    //
    //
    return ChangeNotifierProvider(
      create: (context) => ProductProvider(),
      child: MaterialApp(
        title: 'MyShop',
        theme: theme.copyWith(
          colorScheme: theme.colorScheme.copyWith(primary: Color(0xFF2A9D8F),secondary: Color(0xFFE76F51)),
          backgroundColor: Color(0xFF264653),
          appBarTheme: AppBarTheme(
            color: Colors.transparent,
            shadowColor: Colors.transparent,
          ),
        ),
        home: ProductsOverviewScreen(),
        routes: {
          ProductDetailScreen.routePath : (ctx) => ProductDetailScreen(),
        },
      ),
    );
  }
}

