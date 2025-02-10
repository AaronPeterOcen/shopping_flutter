import 'package:flutter/material.dart';
import 'package:shopping_flutter/screens/main_home_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Ebay2.0",
        ),
      ),
      body: MainHomeScreen(),
    );
  }
}
