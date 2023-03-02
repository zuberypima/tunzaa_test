import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:tunzaatest/models/product_model.dart';

class ShopApiService {
  List  result=[];
  var searchedList=[];
  List<Products> _items = [];
  List<Products> get items => _items;
// Retive all products from the database
  Future getAllProducts() async {
    final allProducts = Uri.parse('https://fakestoreapi.com/products');
    final response = await http.get(allProducts);
    return json.decode(response.body);
  }

//  Retrieve onle one product by chacking the spcific id
  Future getSingleProduct(int id) async {
    final singleProduct = Uri.parse('https://fakestoreapi.com/products/$id');
    final response = await http.get(singleProduct);
    var body = json.decode(response.body);
    return Products.fromJson(body);
  }

//Retrive data by considering the category

  Future searchProduct(String query) async {
    final singleProduct = Uri.parse('https://fakestoreapi.com/products?title=$query');
    final response = await http.get(singleProduct);
    //  if(response.statusCode ==200){
    //    List<dynamic> data = jsonDecode(response.body);

    //    data.forEach((element) { });
    //  }
    return json.decode(response.body);
  }

// Retrive cartproducts acording to user Id
  Future getCart(String userId) async {
    final cartProducts =
        Uri.parse('https://fakestoreapi.com/products/carts/user/$userId');
    final response = await http.get(cartProducts);
    return json.decode(response.body);
  }


  // Shopping Cart functionality
  void addToCart(int productId) async {
  final response = await http.post(Uri.parse("https://fakestoreapi.com/carts"), body: {
    "userId": "1",
    "productId": "$productId",
    "quantity": "1"
  });
  
  if (response.statusCode == 200) {
    Map<String, dynamic> data = jsonDecode(response.body);
    
    print("Product added to cart: ${data['productId']}");
  } else {
    print("Error: ${response.statusCode}");
  }
}


void removeFromCart(int cartId) async {
  final response = await http.delete(Uri.parse("https://fakestoreapi.com/carts/$cartId"));
  
  if (response.statusCode == 200) {
    Map<String, dynamic> data = jsonDecode(response.body);
    
    print("Product removed from cart: ${data['productId']}");
  } else {
    print("Error: ${response.statusCode}");
  }
}

  void addItem(Products item) {
    for (Products existingItem in _items) {
      if (existingItem.id == item.id) {
        existingItem.id = (existingItem.id! + item.id!);
        print(existingItem);
        return ;
      }
    }
    
    _items.add(item);
    print(_items);
  }
}
