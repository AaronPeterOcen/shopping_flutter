import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:shopping_flutter/pages/home_page.dart';
// import 'package:shopping_flutter/pages/my_home_page.dart';
import 'package:shopping_flutter/providers/cart_provider.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (context) => CartProvider(),
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Shoppy App',
      theme: ThemeData(
        textTheme: GoogleFonts.ubuntuTextTheme(textTheme).copyWith(
          bodyMedium: GoogleFonts.aBeeZee(textStyle: textTheme.bodyMedium),
        ),
      ),
      home: HomePage(),
    );
  }
}
