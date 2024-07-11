import 'package:flutter/material.dart';
import 'package:flutter_carousel_widget/flutter_carousel_widget.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({super.key});

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        bottomNavigationBar: BottomNavigationBar(
          backgroundColor: Colors.blue[400],
          elevation: 3.0,
          onTap: (int val){
            switch(val){
              case 0:
                Navigator.pushNamed(context, '/menu');
                break;
              case 1:
                Navigator.pushNamed(context, '/profile');
                break;
            }
          },
          currentIndex: 0,
          items: const[
            BottomNavigationBarItem(
                icon: Icon(Icons.fastfood, color: Colors.black),
                label: 'Menu'
            ),
            BottomNavigationBarItem(
                icon: Icon(Icons.person, color: Colors.black),
                label: 'Profile'
            ),
          ],
        ),
        appBar: AppBar(
          backgroundColor: Colors.blue[400],
          title: Text(
            'Dashboard',
            style: TextStyle(
              letterSpacing: 2.0,
              fontWeight: FontWeight.bold,
            ),
          ),
          centerTitle: true,
        ),
        backgroundColor: Colors.cyan[100],
        body: Container(
          child: SafeArea(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                FlutterCarousel(
                  options: CarouselOptions(
                    height: 500.0,
                    autoPlay: true,
                    autoPlayAnimationDuration: Duration(seconds: 5),
                    showIndicator: true,
                    slideIndicator: CircularSlideIndicator(),
                  ),
                  items: [
                    'assets/Graham.jpg',
                    'assets/Halohalo.webp',
                    'assets/Icecream.jpg',
                    'assets/MaisConYelo.webp',
                  ].map((String imagePath) {
                    return Builder(
                      builder: (BuildContext context) {
                        return Container(
                          width: MediaQuery.of(context).size.width,
                          margin: EdgeInsets.symmetric(horizontal: 10.0),
                          decoration: BoxDecoration(
                            color: Colors.blue[400],
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(10.0),
                            child: Image.asset(
                              imagePath,
                              fit: BoxFit.cover,
                            ),
                          ),
                        );
                      },
                    );
                  }).toList(),
                ),
                  ]
                ),
            ),
          ),

    );
  }
}