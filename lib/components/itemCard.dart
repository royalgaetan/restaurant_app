import 'package:flutter/material.dart';
import 'package:restaurant_app/pages/item.dart';

// Item Card
class ItemCard extends StatelessWidget {
  ItemCard(
      {required this.id,
      required this.imgPath,
      required this.caption,
      required this.price});

  final int id;
  final String imgPath;
  final String caption;
  final int price;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: ((context) => ItemPage(id: id)),
          ),
        );
      },
      child: Container(
        width: 140,
        height: 180,
        margin: EdgeInsets.fromLTRB(0, 45, 15, 20),
        padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: Color(
            0xFF222629,
          ),
          // boxShadow: [
          //   BoxShadow(
          //     blurRadius: 13,
          //     blurStyle: BlurStyle.solid,
          //     spreadRadius: 3,
          //     offset: Offset(2, 8),
          //     color: Color(0xFF101214).withOpacity(0.1),
          //   ),
          // ],
        ),
        child: Transform.translate(
          offset: Offset(0, 0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Circle Image
              Transform.translate(
                offset: Offset(0, -20),
                child: Hero(
                  tag: caption,
                  child: Container(
                    height: 120,
                    width: 120,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(50),
                      boxShadow: const [
                        BoxShadow(
                          offset: Offset(0, 5),
                          spreadRadius: -5,
                          blurRadius: 7,
                          color: Color(0xFF171A1D),
                        ),
                      ],
                    ),
                    child: CircleAvatar(
                      backgroundImage: AssetImage(imgPath),
                    ),
                  ),
                ),
              ),

              // Food Captions
              Text(caption,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  textAlign: TextAlign.left,
                  style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.w600,
                      color: Colors.white70)),
              SizedBox(
                height: 7,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    '€ $price',
                    style: TextStyle(fontSize: 19),
                  ),
                  Icon(Icons.favorite_sharp)
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
