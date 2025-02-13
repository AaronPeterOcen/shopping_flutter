// import 'package:animated_notch_bottom_bar/animated_notch_bottom_bar.dart';
import 'package:animated_notch_bottom_bar/animated_notch_bottom_bar/animated_notch_bottom_bar.dart';
import 'package:flutter/material.dart';
import 'package:shopping_flutter/pages/home_page.dart';
import 'package:shopping_flutter/pages/product_list_screen.dart';

class NavigationPage extends StatefulWidget {
  @override
  _NavigationPageState createState() => _NavigationPageState();
}

class _NavigationPageState extends State<NavigationPage> {
  final NotchBottomBarController _controller = NotchBottomBarController();
  int _selectedIndex = 0;

  final List<Widget> _pages = [
    HomePage(), // Your Home Page
    ProductListScreen(), // Product List Page
    Center(child: Text("Cart")), // Placeholder for Cart Page
    Center(child: Text("Profile")), // Placeholder for Profile Page
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_selectedIndex],
      bottomNavigationBar: AnimatedNotchBottomBar(
        notchBottomBarController: _controller,
        bottomBarItems: [
          BottomBarItem(
              inActiveItem: Icon(Icons.home, color: Colors.grey),
              activeItem: Icon(Icons.home, color: Colors.blue),
              itemLabel: "Home"),
          BottomBarItem(
              inActiveItem: Icon(Icons.list, color: Colors.grey),
              activeItem: Icon(Icons.list, color: Colors.blue),
              itemLabel: "Products"),
          BottomBarItem(
              inActiveItem: Icon(Icons.shopping_cart, color: Colors.grey),
              activeItem: Icon(Icons.shopping_cart, color: Colors.blue),
              itemLabel: "Cart"),
          BottomBarItem(
              inActiveItem: Icon(Icons.person, color: Colors.grey),
              activeItem: Icon(Icons.person, color: Colors.blue),
              itemLabel: "Profile"),
        ],
        onTap: (index) {
          setState(() {
            _selectedIndex = index;
          });
        },
        kBottomRadius: 12.0,
        kIconSize: 24.0,
      ),
    );
  }
}
