import 'package:flutter/material.dart';
import 'package:web_shop_app/screens/orders_screen.dart';
import 'package:web_shop_app/screens/products_overview_screen.dart';
import 'package:web_shop_app/screens/user_products_screen.dart';
import 'package:web_shop_app/widgets/product_item.dart';

class TabsScreen extends StatefulWidget {
  @override
  _TabScreenState createState() => _TabScreenState();
}

class _TabScreenState extends State<TabsScreen> {
  late List<dynamic> pages;
  int _selectedPageIndex = 1;

  initState() {
    pages = [
      OrdersScreen(),
      ProductsOverviewScreen(),
      UserProductsScreen(),
    ];
    super.initState();
  }

  void _selectPage(int index) {
    setState(() {
      _selectedPageIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    //second way of making a navbar using the bottomNavBar widget, requires stateful widget
    //
    //
    return Scaffold(
      
      backgroundColor: Colors.transparent,
      body: pages[_selectedPageIndex],
      bottomNavigationBar: Container(
        decoration: const BoxDecoration(borderRadius: BorderRadius.only(topLeft: Radius.circular(20), topRight: Radius.circular(20))),
        
        clipBehavior: Clip.hardEdge,
        child: BottomNavigationBar(
          
          onTap: _selectPage,
          currentIndex: _selectedPageIndex,
          unselectedLabelStyle: const TextStyle(color: Color(0xFF52ADD1)),
          selectedItemColor: const Color(0xFF52ADD1),
          unselectedItemColor: Colors.white,
          backgroundColor: const Color(0xFF082032),
          type: BottomNavigationBarType.fixed,

          items: const [
            BottomNavigationBarItem(
              icon: Icon(
                Icons.list,
              ),
              label: 'Orders',
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.shopping_bag,
              ),
              label: 'Products',
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.add_chart,
              ),
              label: 'Product overview',
            ),
          ],
        ),
      ),
    );
  }
}
