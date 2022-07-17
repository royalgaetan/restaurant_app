import 'package:flutter/material.dart';
import 'package:restaurant_app/core/foodList.dart';
import 'package:restaurant_app/utils/item_model.dart';

import '../components/itemCard.dart';

class HomePage extends StatefulWidget {
  HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Widget> getFavoriteOrder() {
    List<Widget> Orders = [];

    for (int i = 0; i < 5; i++) {
      var Order = ItemCard(
        id: foodList[i].id,
        imgPath: foodList[i].imgPath,
        caption: foodList[i].title,
        price: foodList[i].price,
      );
      Orders.add(Order);
    }

    return Orders;
  }

  List<Widget> getPopularOrder() {
    List<Widget> Orders = [];

    for (int i = 5; i < 10; i++) {
      var Order = ItemCard(
        id: foodList[i].id,
        imgPath: foodList[i].imgPath,
        caption: foodList[i].title,
        price: foodList[i].price,
      );
      Orders.add(Order);
    }

    return Orders;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(
          height: 10,
        ),
        // Search Box & Settings Icon
        Row(
          children: [
            Expanded(
              child: Container(
                margin: const EdgeInsets.only(left: 10),
                padding: const EdgeInsets.only(right: 10),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.grey.shade700,
                ),
                child: Row(
                  children: [
                    // Search Bar
                    Expanded(
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.transparent,
                        ),
                        padding: const EdgeInsets.symmetric(
                            horizontal: 10, vertical: 0),
                        child: TextField(
                          cursorColor: Colors.grey.shade300,
                          decoration: const InputDecoration(
                              border: InputBorder.none,
                              hintText: 'Search food, drink, dessert...'),
                          style: TextStyle(
                              color: Colors.grey.shade300,
                              fontStyle: FontStyle.italic),
                        ),
                      ),
                    ),

                    // Search Badge
                    Container(
                      padding: const EdgeInsets.all(3),
                      height: 20,
                      width: 20,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(50),
                        color: const Color(0xFF22262A),
                      ),
                      child: const Text(
                        '6',
                        textAlign: TextAlign.center,
                      ),
                    )
                  ],
                ),
              ),
            ),
            IconButton(
              onPressed: () {},
              icon: const Icon(Icons.settings_input_composite_rounded),
              color: const Color(0xFFF00202),
            ),
          ],
        ),
        const SizedBox(
          height: 10,
        ),

        // Places Row
        Padding(
          padding: const EdgeInsets.all(10.0),
          child: SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: [
                PlaceCard(
                  imgPath: 'assets/images/places/place 6.jpg',
                  caption: 'Wine Extra Lounge',
                  // isFavorite: true,
                  // isActive: true,
                ),
                PlaceCard(
                  imgPath: 'assets/images/places/place 5.jpg',
                  caption: 'Beach View Cocoo Chill',
                  // isFavorite: true,
                  // isActive: true,
                ),
                PlaceCard(
                  imgPath: 'assets/images/places/place 9.jpg',
                  caption: 'Cocktail Smooth bar qatar',
                  // isFavorite: true,
                  // isActive: true,
                ),
                PlaceCard(
                  imgPath: 'assets/images/places/place 8.jpg',
                  caption: 'Fries - Mama loboko',
                  // isFavorite: true,
                  // isActive: true,
                ),
              ],
            ),
          ),
        )

        // Order again Row
        ,
        Row(
          children: [
            Container(
              padding: const EdgeInsets.fromLTRB(15, 15, 0, 0),
              child: Text('Order again',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.w700)),
            ),
          ],
        ),
        Padding(
          padding: const EdgeInsets.all(10.0),
          child: SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: getFavoriteOrder(),
            ),
          ),
        ),

        // Popular dishes Row
        Row(
          children: [
            Container(
              padding: const EdgeInsets.fromLTRB(15, 15, 0, 0),
              child: Text('Popular dishes',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.w700)),
            ),
          ],
        ),
        Padding(
          padding: const EdgeInsets.all(10.0),
          child: SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: getPopularOrder(),
            ),
          ),
        ),
      ],
    );
  }
}

// Place Card
class PlaceCard extends StatelessWidget {
  PlaceCard({
    required this.imgPath,
    required this.caption,
    // required this.isFavorite,
    // required this.isActive
  });

  final String imgPath;
  final String caption;
  // final Bool isFavorite;
  // final Bool isActive;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.fromLTRB(0, 0, 10, 20),
      height: 210,
      width: 230,
      decoration: BoxDecoration(
          // boxShadow: [
          //   BoxShadow(
          //     blurRadius: 10,
          //     blurStyle: BlurStyle.solid,
          //     spreadRadius: 5,
          //     offset: Offset(0, 7),
          //     color: Color(0xFF222629).withOpacity(0.1),
          //   ),
          // ],
          ),
      child: Column(
        children: [
          Expanded(
            child: Container(
              height: 170,
              width: 230,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(10),
                  topRight: Radius.circular(10),
                ),
                image: DecorationImage(
                  image: AssetImage(imgPath),
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
          Container(
            height: 70,
            padding: const EdgeInsets.all(15),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(10),
                bottomRight: Radius.circular(10),
              ),
              color: const Color(0xFF222629),
            ),
            child: Row(
              children: [
                Expanded(
                  child: Text(
                    caption,
                    style: const TextStyle(
                        fontSize: 17, fontWeight: FontWeight.w700),
                  ),
                ),
                const SizedBox(
                  width: 10,
                ),
                GestureDetector(
                  onTap: () => print("Place loved !"),
                  child: Icon(Icons.favorite_border),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
