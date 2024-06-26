import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int year = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.cyan[100],
        appBar: AppBar(
          title: Text('User Profile'),
          backgroundColor: Colors.blue[400],
          centerTitle: true,
        ),
        body: Padding(
            padding: EdgeInsets.all(20.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[

                Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Center(
                        child: CircleAvatar(
                            backgroundImage: AssetImage('assets/girl.png'),
                          radius: 70.0
                        ),
                      ),
                      Divider(height: 60.0, color: Colors.blue[300], thickness: 5.0),
                      Row(
                        children: [
                          Icon(
                            Icons.person_2,
                                color: Colors.deepPurple[900],
                          ),
                          SizedBox(width: 3.0),
                          Text(
                            'NAME',
                            style: TextStyle(
                              fontSize: 16.0,
                              letterSpacing: 2.0,
                            ),
                          ),
                        ],
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
                      Row(
                        children: [
                          Icon(
                            Icons.calendar_month_sharp,
                            color: Colors.deepPurple[900],
                          ),
                          Text(
                            'YEAR',
                            style: TextStyle(
                              fontSize: 16.0,
                              letterSpacing: 2.0,
                            ),
                          ),
                        ],
                      ),
                      Text(
                        '$year Year',
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                            fontSize: 30.0
                        ),
                      ),
                      SizedBox(height: 30.0,),
                      Row(
                        children: [
                          Icon(
                            Icons.email,
                            color: Colors.deepPurple[900],
                          ),
                          Text(
                            'EMAIL',
                            style: TextStyle(
                              fontSize: 16.0,
                              letterSpacing: 2.0,
                            ),
                          ),
                        ],
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
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    ElevatedButton(
                        onPressed: (){
                          setState(() {
                            year += 1;
                            });
                        },
                        child: Text('Add Year',
                        style: TextStyle(
                          fontSize: 20.0,
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                        ),
                        ),
                      style: const ButtonStyle(
                        backgroundColor: WidgetStatePropertyAll(Colors.blue),
                      )
                    ),
                  ],
                ),
              ],
            ),
        ),
    );
  }
}
