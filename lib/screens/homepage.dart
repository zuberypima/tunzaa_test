import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tunzaatest/models/product_model.dart';
import 'package:tunzaatest/screens/cartpage.dart';
import 'package:tunzaatest/screens/searchpage.dart';
import 'package:tunzaatest/screens/singleProductPage.dart';
import 'package:tunzaatest/services/apiService.dart';
import 'package:tunzaatest/services/cartservice.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    final  provider= Provider.of<CartProvider>(context);
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        elevation: 0,
        title: Center(child: Text('MyShop')),
        actions: [
          IconButton(
              onPressed: (() {
               Navigator.push(context,
                     MaterialPageRoute(builder: ((context) => CartPage())));
              
              }),
              icon: Icon(Icons.shopping_cart)),
          IconButton(
              onPressed: (() {
                Navigator.push(context,
                    MaterialPageRoute(builder: ((context) => SearchPage())));
              }),
              icon: Icon(Icons.search))
        ],
      ),
      body: FutureBuilder(
        future: ShopApiService().getAllProducts(),
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          if (snapshot.hasData) {
            return GridView.builder(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
              ),
              itemCount: snapshot.data.length,
              itemBuilder: (BuildContext context, int index) {
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: InkWell(
                    onTap: () {
                     int id =snapshot.data[index]['id'];

                     Navigator.push(
                           context,
                           MaterialPageRoute(
                             builder: (context) =>
                                  SingelProduct(id)));
                      // _confirmBox(context,id);
                    },
                     onDoubleTap: () {
                            provider.addCartPtoductList(Products());
                          },
                    child: Container(
                      height: 600,
                      width: 200,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          border: Border.all(color: Colors.white),
                          borderRadius: BorderRadius.circular(10)),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          children: [
                            Container(
                              height: 100,
                              width: 100,
                              child: Image.network(
                                snapshot.data[index]['image'],
                              ),
                            ),
                            SizedBox(
                              height: 3,
                            ),
                            Text(
                              snapshot.data[index]['title'],
                              style: TextStyle(fontSize: 9),
                            ),
                            SizedBox(
                              height: 3,
                            ),
                            Text(snapshot.data[index]['price'].toString()),
                          ],
                        ),
                      ),
                    ),
                  ),
                );
              },
            );
          }
          return Center(
            child: CircularProgressIndicator(),
          );
        },
      ),
    );
  }

// pup up to confirm
 Future<void> _confirmBox(BuildContext context, int productId,) {
    // final  provider= Provider.of<CartProvider>(context);
    return showDialog<void>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          content: const Text('Select your option.'),
          actions: <Widget>[
            TextButton(
              style: TextButton.styleFrom(
                textStyle: Theme.of(context).textTheme.labelLarge,
              ),
              child: const Text('View'),
              onPressed: () {
                          Navigator.push(
                           context,
                           MaterialPageRoute(
                             builder: (context) =>
                                  SingelProduct(productId)));
              },
            ),
            TextButton(
              style: TextButton.styleFrom(
                textStyle: Theme.of(context).textTheme.labelLarge,
              ),
              child: const Text('Add to Cart'),
              onPressed: () {
                //  ShopApiService().addItem(Products());
                // provider.addCartPtoductList(provider.cartProduct);
                
              },
            ),
          ],
        );
      },
    );
  }
}
