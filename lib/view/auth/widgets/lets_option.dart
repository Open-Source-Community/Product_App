import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class LetsOption extends StatelessWidget {
  LetsOption({required this.icon, required this.title});
  String icon;
  String title;

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return GestureDetector(
      onTap: () {
        
      },
      child: Container(
        margin:const EdgeInsets.only(bottom: 15),
        height: height / 14.5,
        width: width / 1.1,
        decoration: BoxDecoration(
            color: Color(0xFF1F222A),
            borderRadius: BorderRadius.circular(16),
            border: Border.all(color: Colors.transparent, width: 3)),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              height: 25,
              width: 25,
              child: Image.asset(icon),
            ),
            SizedBox(
              width: 10,
            ),
            Text(
              "Continue with $title",
              style: GoogleFonts.urbanist(
                  color: Colors.white, fontSize: 14, fontWeight: FontWeight.w600),
            )
          ],
        ),
      ),
    );
  }
}
