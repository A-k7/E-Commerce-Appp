import 'package:flutter/material.dart';

class CartProvider extends ChangeNotifier{
  final List<Map<String,dynamic>> cart =[];

  void Addtocart(Map<String,dynamic> product){
    cart.add(product);
    notifyListeners();
  }

  void Removeformcart(Map<String,dynamic> product){
    cart.remove(product);
    notifyListeners();
  }



}