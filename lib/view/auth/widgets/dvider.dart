import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Dvider extends StatelessWidget {
  Dvider({super.key, required this.content});
  String content;

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Expanded(
          child: Container(
            margin: EdgeInsets.only(left: width / 20),
            height: 1,
            color: Colors.grey,
          ),
        ),
        const SizedBox(
          width: 10,
        ),
        Text(
          content,
          style: GoogleFonts.urbanist(
              fontSize: 16,
              color: Colors.grey[700],
              fontWeight: FontWeight.w500),
        ),
        const SizedBox(
          width: 10,
        ),
        Expanded(
          child: Container(
            margin: EdgeInsets.only(right: width / 20),
            height: 1,
            color: Colors.grey,
          ),
        ),
      ],
    );
  }
}
