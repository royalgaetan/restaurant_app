import 'package:flutter/material.dart';
import 'package:restaurant_app/pages/deliver.dart';
import 'package:restaurant_app/pages/favorites.dart';
import 'package:restaurant_app/pages/home.dart';
import 'package:restaurant_app/pages/map.dart';
import 'package:restaurant_app/pages/profile.dart';

class Screen0Page extends StatefulWidget {
  Screen0Page({Key? key}) : super(key: key);

  @override
  State<Screen0Page> createState() => _HomePageState();
}

class _HomePageState extends State<Screen0Page> {
  final List _Pages = [
    HomePage(),
    FavouritesPage(),
    MapPage(),
    DeliverPage(),
    ProfilePage(),
  ];

  late int initialPageIndex = 0;

  void bottomNavigationHandler(index) {
    setState(() {
      initialPageIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        toolbarHeight: 70,
        backgroundColor: Color(0xFF2F3337),
        leading: IconButton(
          icon: Icon(Icons.menu),
          onPressed: () {},
        ),
        centerTitle: true,
        title: Text(
          'Restaurant App',
          style: TextStyle(fontSize: 19, fontWeight: FontWeight.bold),
        ),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.pushNamed(context, '/checkout');
            },
            icon: const Icon(
              Icons.shopping_bag_outlined,
              size: 30,
            ),
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
          currentIndex: initialPageIndex,
          onTap: (index) => bottomNavigationHandler(index),
          showSelectedLabels: false,
          showUnselectedLabels: false,
          selectedItemColor: Color(0xFFF00202),
          unselectedItemColor: Colors.grey.shade600,
          type: BottomNavigationBarType.fixed,
          items: [
            BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
            BottomNavigationBarItem(
                icon: Icon(Icons.favorite), label: 'Favorites'),
            BottomNavigationBarItem(
                icon: Icon(Icons.place_rounded), label: 'Map'),
            BottomNavigationBarItem(
                icon: Icon(Icons.airport_shuttle_sharp), label: 'Deliver'),
            BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profile'),
          ]),
      backgroundColor: Color(0xFF2F3337),
      body: SingleChildScrollView(
        child: Column(
          children: [
            // Page Section
            Container(
              child: _Pages[initialPageIndex],
            )
          ],
        ),
      ),
    );
  }
}
