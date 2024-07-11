import 'package:flutter/material.dart';
import 'package:untitled2/services/product.dart';


class SelectedProduct extends StatefulWidget {
  final Product product;
  const SelectedProduct ({super.key, required this.product});

  @override
  State<SelectedProduct> createState() => _SelectedProductState(product: product);
}

class _SelectedProductState extends State<SelectedProduct> {
  final Product product;
  late double totalAmount;
  int numberOfOrders = 1;

  _SelectedProductState({required this.product});


  @override
  void initState(){
    super.initState();
    totalAmount = product.price;
  }


  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.cyan[100],
      appBar: AppBar(
        title: Text('Order'),
        backgroundColor: Colors.blue[400],
        centerTitle: true,
      ),

      body: Center(
        child: SizedBox(
          width: 400,
          height: 700,
          child: Card(
            color: Colors.blue[400],
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    children: [
                      Text(
                        product.productName,
                        style: TextStyle(
                          fontSize: 30.0,
                          color: Colors.black,
                          fontWeight: FontWeight.bold
                        ),
                      ),
                      Text(
                        product.description,
                        style: TextStyle(
                          color: Colors.black,
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        '₱ ${totalAmount.toStringAsFixed(2)}',
                        style: TextStyle(
                          fontSize: 20.0,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                      ),
                      Row(
                        children: [
                          IconButton(
                            onPressed: () {
                              numberOfOrders -= 1;
                              totalAmount = product.price * numberOfOrders;
                            },
                            icon: Icon(Icons.remove),
                            style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.white,
                                foregroundColor: Colors.black),
                          ),
                          Text(
                            '1',
                            style: TextStyle(
                              fontSize: 20.0,
                              color: Colors.black, // Text color
                            ),
                          ),
                          IconButton(
                            onPressed: () {
                              setState(() {
                                numberOfOrders += 1;
                                totalAmount = product.price * numberOfOrders;
                              });
                            },
                            icon: Icon(Icons.add),
                            style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.white,
                                foregroundColor: Colors.black),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: ElevatedButton.icon(
                    onPressed: (){
                      Navigator.pushNamed(context, '/checkout');
                    },
                    icon: Icon(Icons.shopping_cart),
                    label: Text('Check Out'),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.cyan[100],
                      foregroundColor: Colors.black,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}