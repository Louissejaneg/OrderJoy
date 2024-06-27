import 'package:flutter/material.dart';
import 'package:untitled2/services/product.dart';
import 'package:untitled2/services/menuCard.dart';

class Menu extends StatefulWidget {
  const Menu({super.key});

  @override
  State<Menu> createState() => _MenuState();
}

class _MenuState extends State<Menu> {
  List products = <Product>[
    Product(productName: "Halo halo", price: 50.0),
    Product(productName: "Leche Plan", price: 60.0),
    Product(productName: "Mais Con Yelo", price: 70.0),
    Product(productName: "Graham", price: 80.0),
    Product(productName: "Ice Cream", price: 60.0),
];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.cyan[100],
      appBar: AppBar(
        title: Text('Menu'),
        backgroundColor: Colors.blue[400],
        centerTitle: true,
      ),
      body: Padding(
        padding: EdgeInsets.all(5.0),
        child: Column(
          children: products.map((product) => Menucard(product: product)).toList(),
        ),
      ),
    );
  }
}
