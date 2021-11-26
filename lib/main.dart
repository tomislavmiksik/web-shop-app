import 'package:flutter/material.dart';
import 'package:web_shop_app/providers/cart_provider.dart';
import 'package:web_shop_app/providers/orders_provider.dart';
import 'package:web_shop_app/screens/cart_screen.dart';
import 'package:web_shop_app/screens/orders_screen.dart';
import 'package:web_shop_app/screens/tabs_screen.dart';
import 'screens/product_detail_screen.dart';
import 'package:provider/provider.dart';
import 'package:web_shop_app/providers/product_item_provider.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {

  
  @override
  Widget build(BuildContext context) {
    final ThemeData theme = ThemeData(fontFamily: 'Lato');

    //provider widget that alerts select listeners
    //*.value is used when context is not needed and only the value gets passed through
    //otherwise the standard create is implemented
    //
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (ctx) => ProductItemProvider(),
        ),
        ChangeNotifierProvider(
          create: (ctx) => Cart(),
        ),
        ChangeNotifierProvider.value(
          value: Orders(),
        ),
      ],
      child: MaterialApp(
        title: 'MyShop',
        theme: theme.copyWith(
          colorScheme: theme.colorScheme.copyWith(
              primary: const Color(0xFF52ADD1), secondary: const Color(0xFF1f306e)),
          backgroundColor: const Color(0xFF264653),
          appBarTheme: const AppBarTheme(
            color: Colors.transparent,
            shadowColor: Colors.transparent,
          ),
          splashColor: const Color(0xFF52ADD1),
          textTheme: const TextTheme(
            bodyText2: TextStyle(
              fontSize: 20,
            ),
          ),
        ),
        initialRoute:'/',
        routes: {
          '/': (ctx) => TabsScreen(),
          ProductDetailScreen.routePath: (ctx) => ProductDetailScreen(),
          CartScreen.routePath: (ctx) => CartScreen(),
          OrdersScreen.routePath: (ctx) => OrdersScreen(),
        },
      ),
    );
  }
}
