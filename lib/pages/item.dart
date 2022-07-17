import 'dart:math';

import 'package:flutter/material.dart';
import 'package:restaurant_app/core/foodList.dart';

import '../components/addItemAmount.dart';
import '../components/itemCard.dart';

class ItemPage extends StatefulWidget {
  ItemPage({required this.id});

  final int id;

  @override
  State<ItemPage> createState() => _ItemPageState();
}

class _ItemPageState extends State<ItemPage> {
  void decreasedOrderAmount() {
    if (OrderAmount > 1) {
      setState(() {
        OrderAmount--;
      });
    } else {
      setState(() {
        OrderAmount = 1;
      });
    }
  }

  void increasedOrderAmount() {
    setState(() {
      OrderAmount++;
    });
  }

  int OrderAmount = 1;
  List<Widget> getOtherCheckoutOrder() {
    List<Widget> Orders = [];

    for (int i = 0; i < foodList.length; i++) {
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
    return Scaffold(
      backgroundColor: Color(0xFF2F3337),
      appBar: AppBar(
        elevation: 0,
        toolbarHeight: 70,
        backgroundColor: Color(0xFF222629),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        centerTitle: true,
        title: Text(
          foodList[widget.id].title,
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
      extendBody: true,
      body: Column(
        children: [
          Expanded(
              child: SingleChildScrollView(
            child: Column(
              children: [
                // Background Rounded
                Transform.translate(
                  offset: Offset(0, 0),
                  child: Container(
                    height: 120,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: Color(0xFF222629),
                      borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(120),
                        bottomRight: Radius.circular(120),
                      ),
                    ),
                  ),
                ),

                // Second Page Section
                Transform.translate(
                  offset: Offset(0, -120),
                  child: Column(
                    children: [
                      // Dish Section
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Column(
                            children: [
                              // Dish Badge
                              Container(
                                padding: EdgeInsets.all(10),
                                decoration: BoxDecoration(
                                  color: Color(0xFF34383F),
                                  borderRadius: BorderRadius.circular(20),
                                ),
                                child: Text('€ ${foodList[widget.id].price}'),
                              ),
                              const SizedBox(
                                height: 20,
                              ),

                              // Dish Image
                              Hero(
                                tag: foodList[widget.id].title,
                                child: Container(
                                  height: 170,
                                  width: 170,
                                  child: CircleAvatar(
                                    backgroundImage:
                                        AssetImage(foodList[widget.id].imgPath),
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: 10,
                              ),

                              // Order number Section
                              Row(
                                children: [
                                  GestureDetector(
                                    onTap: () => decreasedOrderAmount(),
                                    child: AddItemButton(buttonLabel: '-'),
                                  ),
                                  Text(
                                    OrderAmount.toString(),
                                    style:
                                        TextStyle(fontWeight: FontWeight.bold),
                                  ),
                                  GestureDetector(
                                    onTap: () => increasedOrderAmount(),
                                    child: AddItemButton(buttonLabel: '+'),
                                  ),
                                ],
                              ),

                              // Order Info
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  OfferInfo(
                                    icon: Icons.timer_outlined,
                                    label:
                                        '${foodList[widget.id].cookTime} min',
                                  ),
                                  OfferInfo(
                                    icon: Icons.av_timer_outlined,
                                    label:
                                        '${foodList[widget.id].calories} calories',
                                  ),
                                  OfferInfo(
                                    icon: Icons.fastfood_outlined,
                                    label:
                                        '${foodList[widget.id].grammes} grammes',
                                  ),
                                ],
                              ),

                              // Order Description
                              Row(
                                children: [
                                  Container(
                                    padding: EdgeInsets.symmetric(
                                        horizontal: 35, vertical: 10),
                                    width: MediaQuery.of(context).size.width,
                                    child: Text(
                                      style: TextStyle(
                                          fontWeight: FontWeight.w400),
                                      maxLines: 3,
                                      textAlign: TextAlign.center,
                                      overflow: TextOverflow.ellipsis,
                                      foodList[widget.id].description,
                                    ),
                                  ),
                                ],
                              ),

                              // With this Order
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Container(
                                    margin: EdgeInsets.symmetric(
                                        horizontal: 10, vertical: 18),
                                    child: Text(
                                      'With this order',
                                      style: TextStyle(
                                          fontWeight: FontWeight.w700,
                                          fontSize: 16),
                                    ),
                                  ),
                                ],
                              ),
                              Container(
                                width: MediaQuery.of(context).size.width,
                                child: SingleChildScrollView(
                                  scrollDirection: Axis.horizontal,
                                  child: Row(
                                    children: getOtherCheckoutOrder(),
                                  ),
                                ),
                              )
                            ],
                          )
                        ],
                      )
                    ],
                  ),
                ),
              ],
            ),
          )),
          //  Footer Button
        ],
      ),
      bottomNavigationBar: Stack(
        alignment: Alignment.center,
        children: [
          Container(
            height: 100,
            width: double.infinity,
            decoration: BoxDecoration(
              gradient: LinearGradient(begin: Alignment.bottomRight, colors: [
                Colors.black.withOpacity(0.6),
                Colors.black.withOpacity(0.5),
                Colors.black.withOpacity(0.4),
                Colors.black.withOpacity(0.3),
                Colors.transparent,
              ]),
            ),
          ),
          Container(
            width: MediaQuery.of(context).size.width,
            padding: EdgeInsets.symmetric(horizontal: 30, vertical: 15),
            margin: EdgeInsets.symmetric(horizontal: 30),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(40),
              gradient: LinearGradient(colors: [
                Color(0xFFFD5A1D),
                Color(0xFFF52C15),
              ]),
            ),
            child: Text(
              'Add to order',
              textAlign: TextAlign.center,
              style: TextStyle(fontWeight: FontWeight.w500, fontSize: 15),
            ),
          )
        ],
      ),
    );
  }
}

class OfferInfo extends StatelessWidget {
  const OfferInfo({required this.icon, required this.label});

  final IconData icon;
  final String label;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 10, vertical: 13),
      child: Row(
        children: [
          Icon(icon),
          SizedBox(
            width: 8,
          ),
          Text(
            label,
            style: TextStyle(fontWeight: FontWeight.w800),
          )
        ],
      ),
    );
  }
}
