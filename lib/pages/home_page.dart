import 'package:flutter/material.dart';
import 'package:shopping_flutter/pages/cart_page.dart';
import 'package:shopping_flutter/pages/product_list_screen.dart';
import 'package:shopping_flutter/pages/profile_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;

  // List of pages for navigation
  final List<Widget> _pages = [
    ProductListScreen(), // Your main product list
    CartPage(), // Placeholder for Cart Page
    ProfilePage(), // Placeholder for Profile Page
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: const Text(
            'Shoppy App',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
        ),
      ),
      body: _pages[_selectedIndex], // Display the selected page
      bottomNavigationBar: NavigationBar(
        selectedIndex: _selectedIndex,
        onDestinationSelected: (index) {
          setState(() {
            _selectedIndex = index;
          });
        },
        destinations: const [
          NavigationDestination(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          NavigationDestination(
            icon: Icon(Icons.shopping_cart),
            label: 'Cart',
          ),
          NavigationDestination(
            icon: Icon(Icons.person),
            label: 'Profile',
          ),
        ],
      ),
    );
  }
}
