import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    home:Scaffold(
      appBar: AppBar(
        title:Center(
          child:Text('OrderJoy App'),
        ),
        backgroundColor: Colors.lightBlue[200],
      ),
      body: Center(
        child: Image.network('https://assets.unileversolutions.com/v1/84326391.jpg?im=AspectCrop=(1440,600);Resize=(1440,600)')
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
          backgroundColor: Colors.blue[200],
        child: Icon(
          Icons.add,
          color: Colors.deepPurple[900],
        )
      ),
    ),
  ));
}


