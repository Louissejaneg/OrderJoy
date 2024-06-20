import 'package:flutter/material.dart';

void main() => runApp(MaterialApp(
  home: Scaffold(
    backgroundColor: Colors.cyan[100],
    appBar: AppBar(
      title: Text('User Profile'),
    backgroundColor: Colors.blue[400],
    centerTitle: true,
  ),
    body: Padding(
      padding: EdgeInsets.all(20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            'NAME',
           style: TextStyle(
             fontSize: 16.0,
             letterSpacing: 2.0,
           ),
          ),
          Text(
            'Louisse Jane Garcia',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              color: Colors.black,
              fontSize: 30.0
            ),
          ),
          SizedBox(height: 30.0,),
          Text(
            'YEAR',
            style: TextStyle(
              fontSize: 16.0,
              letterSpacing: 2.0,
            ),
          ),
          Text(
            '3rd Year',
            style: TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.black,
                fontSize: 30.0
            ),
          ),
          SizedBox(height: 30.0,),
          Text(
            'EMAIL',
            style: TextStyle(
              fontSize: 16.0,
              letterSpacing: 2.0,
            ),
          ),
          Text(
            'Louissegarcia7@gmail.com',
            style: TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.black,
                fontSize: 30.0
            ),
          ),
        ]
      )
    )
)
));
