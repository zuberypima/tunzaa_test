import 'package:flutter/material.dart';
import 'package:tunzaatest/models/product_model.dart';

class CartProvider extends ChangeNotifier{
  List <Products> _cartProduct =[];
  List<Products > get cartProduct =>_cartProduct;

void addCartPtoductList(Products cartProduct){
  final isExist =_cartProduct.contains(cartProduct);
  if(isExist){
    _cartProduct.remove(cartProduct);
  }
  else{
    _cartProduct.add(cartProduct);
    print(_cartProduct);
  }
  notifyListeners();
}  
bool isExist(Products cartProduct){
    final isExist =_cartProduct.contains(cartProduct);
  return isExist;
}
}