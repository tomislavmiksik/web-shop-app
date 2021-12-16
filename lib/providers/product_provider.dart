import 'package:flutter/material.dart';

class ProductProvider with ChangeNotifier {
  String id;
  String title;
  String description;
  double price;
  String imageUrl;
  bool isFavourite;

  ProductProvider(
      {required this.id,
      required this.title,
      required this.description,
      required this.price,
      required this.imageUrl,
      this.isFavourite = false});

  void toggleFavouriteStatus() {
    isFavourite = !isFavourite;
    notifyListeners();
  }

  void editProduct(ProductProvider item) {
    imageUrl = item.imageUrl;
    title = item.title;
    description = item.description;
    price = item.price;
    notifyListeners();
  }
}
