import 'dart:convert';
import 'package:http/http.dart' as http;

class ShopApiService {
  List  result=[];
  var searchedList=[];
//Retrive data by considering the category

  Future searchProduct(String query) async {
    final singleProduct = Uri.parse('https://fakestoreapi.com/products?title=$query');
    final response = await http.get(singleProduct);
     if(response.statusCode ==200){
       List<dynamic> data = jsonDecode(response.body);

       data.forEach((element) { });
     }
    return json.decode(response.body);
  }


 
}
