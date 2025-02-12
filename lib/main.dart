import 'package:flutter/material.dart';
import 'package:shopping_flutter/pages/my_home_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Ecommerce App',
      home: MyHomePage(),
    );
  }
}
