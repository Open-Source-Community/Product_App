import 'package:flutter/material.dart';

class ContinueWith extends StatelessWidget {
  ContinueWith({super.key, required this.name});
  String name;
  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Container(
      height: height / 17,
      width: width / 5,
      alignment: Alignment.center,
      decoration: BoxDecoration(
          color: Colors.grey[200],
          borderRadius: BorderRadius.circular(10),
          border: Border.all(color: Colors.grey[300]!, width: 1)),
      child: Image.asset(
        name,
        height: width / 5,
        width: width / 5,
      ),
    );
  }
}
