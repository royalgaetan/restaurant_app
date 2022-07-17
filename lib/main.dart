import 'package:flutter/material.dart';
import 'package:restaurant_app/pages/checkout.dart';
import 'package:restaurant_app/pages/item.dart';
import 'package:restaurant_app/pages/menu.dart';
import 'package:restaurant_app/pages/screen0.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark(),
      home: Screen0Page(),
      routes: {
        '/menu': (context) => MenuPage(),
        '/checkout': (context) => CheckoutPage()
      },
    );
  }
}
