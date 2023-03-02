import 'package:flutter/material.dart';
import 'package:tunzaatest/models/product_model.dart';
import 'package:tunzaatest/services/apiService.dart';


class SingelProduct extends StatelessWidget {
  final int id;
  SingelProduct(this.id);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      body: FutureBuilder(
        future: ShopApiService().getSingleProduct(id),
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          if (snapshot.hasData) {
            Products product = snapshot.data;
            return ListView(
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 10, right: 10, top: 25),
                  child: Container(
                    height: MediaQuery.of(context).size.height / 2.5,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Image.network(product.image.toString()),
                    ),
                  ),
                ),
                Center(child: Text(product.title.toString())),
                Center(child: Text(product.price.toString())),
                Center(child: Text(product.description.toString())),
                Center(
                  child: Chip(label: Text(product.category.toString())),
                )
              ],
            );
          }
          return Center(
            child: CircularProgressIndicator(),
          );
        },
      ),
    );
  }
}
