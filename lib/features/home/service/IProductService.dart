// ignore_for_file: file_names

import 'dart:convert';

import 'package:dio/dio.dart';

import '../model/home_model.dart';
import 'package:http/http.dart' as http;

abstract class IProductService {
  final Dio dio;

  IProductService(this.dio);

  Future<List<HomeModel>> fetchAllProducts();

   Future searchProduct(String query) async {
    final singleProduct = Uri.parse('https://fakestoreapi.com/products?title=$query');
    final response = await http.get(singleProduct);
    return json.decode(response.body);
  }
}
