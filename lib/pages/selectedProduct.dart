import 'package:flutter/material.dart';
import 'package:untitled2/services/product.dart';


class SelectedProduct extends StatefulWidget {
  final Product product;
  const SelectedProduct ({super.key, required this.product});

  @override
  State<SelectedProduct> createState() => _SelectedProductState();
}

class _SelectedProductState extends State<SelectedProduct> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Order'),
        backgroundColor: Colors.blue[400],
        centerTitle: true,
      ),
      body: Column(
        children: [
          Column(
            children: [
              Text(widget.product.productName),
              Text(widget.product.description),
            ],
          ),
      Row(
        children: [
          Text(widget.product.price.toString()),
          IconButton(onPressed: () {},
              icon:
          ),
        ],
      ),
    ],
    ),
    );
  }
}
