import 'package:flutter/material.dart';

import '../components/addItemAmount.dart';

class CheckoutPage extends StatefulWidget {
  CheckoutPage({Key? key}) : super(key: key);

  @override
  State<CheckoutPage> createState() => _CheckoutPageState();
}

class _CheckoutPageState extends State<CheckoutPage> {
  late int totalAmount = 99;

  List<SingleCheckoutOrder> Orders = [
    SingleCheckoutOrder(
      imgPath: 'assets/images/food/dish 3.png',
      orderTitle: 'Soup shrimp',
      price: 20,
    ),
    SingleCheckoutOrder(
      imgPath: 'assets/images/food/dish 4.png',
      orderTitle: 'Carots pane',
      price: 45,
    ),
    SingleCheckoutOrder(
      imgPath: 'assets/images/food/dish 5.png',
      orderTitle: 'Salad Cesar',
      price: 34,
    ),
  ];

  void cleanOrders() {
    setState(() {
      Orders = [];
      totalAmount = 0;
    });
  }

  getOrders() {
    for (int i = 0; i > Orders.length; i++) {
      var order = Orders[i];
      Orders.add(order);
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
        backgroundColor: Color(0xFF2F3337),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        centerTitle: true,
        title: const Text(
          'Checkout order',
          style: TextStyle(fontSize: 19, fontWeight: FontWeight.bold),
        ),
        actions: [
          Stack(
            alignment: Alignment.center,
            children: [
              Container(
                height: 30,
                width: 30,
                margin: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                padding: EdgeInsets.all(5),
                decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                      color: Color(0xFF0E1013).withOpacity(0.9),
                      offset: Offset(0, 5),
                      blurRadius: 5,
                    ),
                  ],
                  color: Color(0xFF33373C),
                  borderRadius: BorderRadius.circular(50),
                ),
              ),
              GestureDetector(
                onTap: () {
                  cleanOrders();
                },
                child: Icon(
                  Icons.close_outlined,
                  size: 20,
                ),
              ),
            ],
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
                // Checkout Order List
                Orders.length > 1
                    ? Container(
                        child: Column(children: getOrders()),
                      )
                    : Container(
                        width: MediaQuery.of(context).size.width,
                        padding:
                            EdgeInsets.symmetric(horizontal: 30, vertical: 15),
                        margin:
                            EdgeInsets.symmetric(horizontal: 30, vertical: 150),
                        child: Text(
                          'No orders !',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              fontWeight: FontWeight.w500,
                              fontSize: 20,
                              color: Colors.grey.shade600),
                        ),
                      ),

                // Divider
                Container(
                  height: 10,
                  width: double.infinity,
                  margin: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
                  child: Divider(
                    height: 2,
                    thickness: 2,
                  ),
                ),

                //Delay Section
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 7),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'To time',
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.bold),
                      ),
                      SizedBox(
                        height: 12,
                      ),
                      Row(
                        children: [
                          Stack(
                            alignment: Alignment.center,
                            children: [
                              Container(
                                height: 40,
                                width: 160,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    boxShadow: [
                                      BoxShadow(
                                        color: Colors.black.withOpacity(0.4),
                                        blurStyle: BlurStyle.inner,
                                        blurRadius: 4,
                                        spreadRadius: 1,
                                        offset: Offset(0, -3),
                                      )
                                    ],
                                    gradient: LinearGradient(
                                        begin: Alignment.centerLeft,
                                        colors: [
                                          Color(0xFF1D2127),
                                          Color.fromARGB(255, 60, 65, 70),
                                        ])),
                              ),
                              Text('6:45 PM')
                            ],
                          ),
                        ],
                      )
                    ],
                  ),
                ),
                SizedBox(
                  height: 30,
                ),

                // Total Amount
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 7),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Total Amount',
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.bold),
                      ),
                      Text(
                        '€ ${totalAmount.toStringAsFixed(2)}',
                        style: TextStyle(
                            color: Color(0xFFF52C15),
                            fontSize: 19,
                            fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                )
              ],
            ),
          )),
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
              'Checkout Now',
              textAlign: TextAlign.center,
              style: TextStyle(fontWeight: FontWeight.w500, fontSize: 15),
            ),
          )
        ],
      ),
    );
    ;
  }
}

class SingleCheckoutOrder extends StatefulWidget {
  SingleCheckoutOrder(
      {required this.imgPath, required this.orderTitle, required this.price});

  final String imgPath;
  final String orderTitle;
  final int price;

  @override
  State<SingleCheckoutOrder> createState() => _SingleCheckoutOrderState();
}

class _SingleCheckoutOrderState extends State<SingleCheckoutOrder> {
  late int OrderAmount = 1;

  void increasedOrderAmount() {
    setState(() {
      OrderAmount++;
    });
  }

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

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.fromLTRB(50, 15, 30, 15),
      height: 80,
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
        color: Color(0XFF272A30),
        borderRadius: BorderRadius.circular(15),
      ),
      child: Row(children: [
        // Order Image
        Transform.scale(
          scale: 1.8,
          child: Container(
            width: 50,
            height: 50,
            margin: EdgeInsets.only(right: 5),
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage(widget.imgPath),
              ),
            ),
          ),
        ),

        // Order Info
        Expanded(
          child: Container(
            padding: EdgeInsets.all(10),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 15),
                  child: Text(
                    widget.orderTitle,
                    style: TextStyle(fontWeight: FontWeight.w500),
                  ),
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
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    GestureDetector(
                      onTap: () => increasedOrderAmount(),
                      child: AddItemButton(buttonLabel: '+'),
                    )
                  ],
                ),
              ],
            ),
          ),
        ),

        // Order Price
        Container(
          padding: EdgeInsets.all(20),
          child: Text(
            '€ ${widget.price.toStringAsFixed(2)}',
            style: TextStyle(fontWeight: FontWeight.w500, fontSize: 20),
          ),
        ),
      ]),
    );
  }
}
