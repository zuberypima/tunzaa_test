import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tunzaatest/screens/homepage.dart';
import 'package:tunzaatest/services/cartservice.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(create: ((context) {
      return CartProvider();
    }),
    child: const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    ),
    );
  }
}
