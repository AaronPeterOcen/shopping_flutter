import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shopping_flutter/api_services.dart';
import '../product.dart';
import '../providers/cart_provider.dart';

class ProductListScreen extends StatefulWidget {
  const ProductListScreen({super.key});

  @override
  _ProductListScreenState createState() => _ProductListScreenState();
}

class _ProductListScreenState extends State<ProductListScreen> {
  final ApiService apiService = ApiService();
  late Future<List<Product>> futureProducts;
  String searchQuery = '';
  String selectedCategory = 'All';
  List<String> categories = ['All'];

  @override
  void initState() {
    super.initState();
    futureProducts = apiService.fetchProducts();
    _loadCategories();
  }

  // Extract unique categories from products
  void _loadCategories() async {
    List<Product> products = await apiService.fetchProducts();
    Set<String> categorySet = {'All'}; // Default category
    categorySet.addAll(products.map((p) => p.category));
    setState(() {
      categories = categorySet.toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    final cartProvider =
        Provider.of<CartProvider>(context); // Access CartProvider

    return Scaffold(
      appBar: AppBar(title: Text("Store Items")),
      body: Column(
        children: [
          // Search Bar
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              decoration: InputDecoration(
                hintText: "Search products...",
                prefixIcon: Icon(Icons.search),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              onChanged: (value) {
                setState(() {
                  searchQuery = value;
                });
              },
            ),
          ),

          // Category Filter
          SizedBox(
            height: 50,
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: categories.map((category) {
                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: ChoiceChip(
                    label: Text(category),
                    selected: selectedCategory == category,
                    onSelected: (bool selected) {
                      setState(() {
                        selectedCategory = category;
                      });
                    },
                  ),
                );
              }).toList(),
            ),
          ),

          // Product List
          Expanded(
            child: FutureBuilder<List<Product>>(
              future: futureProducts,
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return Center(child: CircularProgressIndicator());
                } else if (snapshot.hasError) {
                  return Center(child: Text("Error: ${snapshot.error}"));
                } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
                  return Center(child: Text("No products available"));
                } else {
                  List<Product> filteredProducts =
                      snapshot.data!.where((product) {
                    bool matchesSearch = product.title
                        .toLowerCase()
                        .contains(searchQuery.toLowerCase());
                    bool matchesCategory = selectedCategory == 'All' ||
                        product.category == selectedCategory;
                    return matchesSearch && matchesCategory;
                  }).toList();

                  return ListView.builder(
                    itemCount: filteredProducts.length,
                    itemBuilder: (context, index) {
                      Product product = filteredProducts[index];
                      return Card(
                        margin: EdgeInsets.all(10),
                        child: ListTile(
                          leading: Image.network(product.image,
                              width: 50, height: 50),
                          title: Text(product.title),
                          subtitle: Text("\$${product.price}"),
                          trailing: IconButton(
                            icon: Icon(Icons.add_shopping_cart),
                            onPressed: () {
                              cartProvider.addToCart(product); // Add to cart
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(
                                  content:
                                      Text("${product.title} added to cart"),
                                ),
                              );
                            },
                          ),
                        ),
                      );
                    },
                  );
                }
              },
            ),
          ),
        ],
      ),
    );
  }
}
