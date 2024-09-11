import 'package:ecommerce/views/home_page.dart';
import 'package:ecommerce/views/update_product_page.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: HomePage.routeName,
      routes: {
        UpdateProductPage.routeName: (context) => UpdateProductPage(),
        HomePage.routeName: (context) => HomePage(),
      },
    );
  }
}
