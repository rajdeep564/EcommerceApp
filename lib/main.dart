import 'package:ecommerce_app/home_page.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      title: 'Shopping App',
      theme: ThemeData(
        inputDecorationTheme: const InputDecorationTheme(
          prefixIconColor: Color.fromRGBO(119,119,119,1),
          hintStyle: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 16
          )
        ),
        fontFamily: 'Lato',
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.yellow),
      ),
      home: const HomePage(),
    );
  }
}
