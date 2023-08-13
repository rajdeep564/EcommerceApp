import 'package:ecommerce_app/Product_list.dart';
import 'package:flutter/material.dart';

import 'Cart_page.dart';
class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  
  
  int currentpage = 0;

  List<Widget> pages = const [ProductList(),CartPage()];
  @override
  Widget build(BuildContext context) {
    const border = OutlineInputBorder(
                  borderSide: BorderSide(
                    color: Color.fromRGBO(225, 225, 225, 1),
                  ),
                  borderRadius: BorderRadius.horizontal(left: Radius.circular(50))
                );
    return    Scaffold(
      body: IndexedStack(
        index: currentpage,
        children: pages,
      ),
      bottomNavigationBar: BottomNavigationBar(
        iconSize: 30,
        selectedFontSize: 0,
        unselectedFontSize: 0,
        currentIndex: currentpage,
        onTap: (value){
          setState(() {
            currentpage = value;
          });

        },
        items: const [
        BottomNavigationBarItem(icon: Icon(Icons.home),
        label: ''),
        BottomNavigationBarItem(icon: Icon(Icons.shopping_cart),
        label: ''),
      ]),
    );
  }
}