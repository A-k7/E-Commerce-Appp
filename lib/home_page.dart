import 'package:flutter/material.dart';
import 'package:shopping_app/cart_page.dart';

import 'package:shopping_app/product_list.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  int currentPage=0;
  
  List<Widget> pages=const [
    ProductList(),
    CartPage()
    ];

  @override
  Widget build(BuildContext context) {
    return   Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        selectedFontSize: 0,
        unselectedFontSize: 0,
        iconSize: 35,
        onTap: (value) {
          setState(() {
            currentPage=value;
          });
        },
        currentIndex: currentPage,
        items: const [BottomNavigationBarItem (label: '', icon:Icon(Icons.home)),
        BottomNavigationBarItem (label: '', icon:Icon(Icons.shopping_cart)),
      ]),
      body: IndexedStack(
        index: currentPage,
        children: pages,
      ),
    );
  }
}