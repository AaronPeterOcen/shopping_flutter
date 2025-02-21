import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:shopping_flutter/pages/home_page.dart';
import 'package:shopping_flutter/providers/cart_provider.dart';
import 'package:shopping_flutter/providers/theme_provider.dart'; // Import the ThemeProvider

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => CartProvider()),
        ChangeNotifierProvider(create: (context) => ThemeProvider()),
      ],
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final themeProvider = Provider.of<ThemeProvider>(context);

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Shoppy App',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color.fromARGB(255, 54, 210, 213),
          brightness: Brightness.light,
        ),
        textTheme: GoogleFonts.ubuntuTextTheme(textTheme).copyWith(
          bodyMedium: GoogleFonts.aBeeZee(textStyle: textTheme.bodyMedium),
        ),
      ),
      darkTheme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color.fromARGB(255, 54, 210, 213),
          brightness: Brightness.dark,
        ),
        textTheme: GoogleFonts.ubuntuTextTheme(textTheme).copyWith(
          bodyMedium: GoogleFonts.aBeeZee(textStyle: textTheme.bodyMedium),
        ),
      ),
      themeMode:
          themeProvider.themeMode, // Use the theme mode from ThemeProvider
      home: HomePage(),
    );
  }
}
