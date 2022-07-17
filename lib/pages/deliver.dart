import 'package:flutter/material.dart';

class DeliverPage extends StatefulWidget {
  DeliverPage({Key? key}) : super(key: key);

  @override
  State<DeliverPage> createState() => _MenuPageState();
}

class _MenuPageState extends State<DeliverPage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 800,
      width: double.infinity,
      color: Colors.grey.shade400,
    );
  }
}
