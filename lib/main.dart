
import 'package:ecommerce_app/Cart_provider.dart';
import 'package:ecommerce_app/home_page.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';



void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return  ChangeNotifierProvider(
      create: (context) => CartProvider(),
      child: MaterialApp(
        title: 'Shopping App',
        theme: ThemeData(
          inputDecorationTheme: const InputDecorationTheme(
            prefixIconColor: Color.fromRGBO(119,119,119,1),
            
            hintStyle: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 16
            )
          ),
          textTheme: const TextTheme(
            titleLarge: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 30,
                        
                              ),
            titleMedium: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 20,
            ),
            bodySmall: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 16,
            )
          ),
          fontFamily: 'Lato',
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.yellow,
          primary: Colors.yellow),
          appBarTheme: const AppBarTheme(
            titleTextStyle: TextStyle(
              fontSize: 20,
              color: Colors.black,
            )
          ),
          useMaterial3: true,
        ),
        home: const HomePage(),
      ),
    );
  }
}
