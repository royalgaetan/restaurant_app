import 'package:flutter/material.dart';

class AddItemButton extends StatelessWidget {
  AddItemButton({required this.buttonLabel});

  final String buttonLabel;

  @override
  Widget build(BuildContext context) {
    return Stack(alignment: Alignment.center, children: [
      Container(
        height: 20,
        width: 20,
        margin: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
        padding: EdgeInsets.all(5),
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
                color: Colors.black54,
                offset: Offset(0, 2),
                blurRadius: 2,
                spreadRadius: 1),
          ],
          color: Color(0xFF33373C),
          borderRadius: BorderRadius.circular(50),
        ),
      ),
      Text(
        buttonLabel,
        style: TextStyle(fontWeight: FontWeight.bold),
        textAlign: TextAlign.center,
      ),
    ]);
  }
}
