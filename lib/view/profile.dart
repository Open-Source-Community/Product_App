import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:iconsax/iconsax.dart';
import 'package:product_app/dark_theme.dart';

class Profile extends StatelessWidget {
  const Profile({super.key});

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Scaffold(
        body: SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: AnimationConfiguration.toStaggeredList(
          duration: const Duration(milliseconds: 170),
          childAnimationBuilder: (widget) => SlideAnimation(
            horizontalOffset: 50,
            child: FadeInAnimation(
              child: widget,
            ),
          ),
          children: [
            SizedBox(height: height / 9),
            Align(
              alignment: Alignment.center,
              child: CircleAvatar(
                backgroundColor: Colors.grey[200],
                radius: width / 6,
                child: Icon(
                  Icons.person,
                  size: width / 5,
                  color: Colors.black,
                ),
              ),
            ),
            SizedBox(
              height: height / 40,
            ),
            Text(
              FirebaseAuth.instance.currentUser!.email!,
              style: GoogleFonts.urbanist(
                  color: Colors.black,
                  fontSize: 22,
                  fontWeight: FontWeight.w500),
            ),
            SizedBox(
              height: height / 40,
            ),
            InkWell(
                onTap: () async {
                  await FirebaseAuth.instance.signOut();
                  Navigator.pushReplacementNamed(context, "login");
                },
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: width / 30),
                  height: height / 14.5,
                  width: width / 1.1,
                  decoration: BoxDecoration(
                    color: Colors.grey[200],
                    border: Border.all(color: Colors.white12),
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: Row(
                    children: [
                      Text("LogOut",
                          style: GoogleFonts.urbanist(
                              color: Colors.black,
                              fontSize: 20,
                              fontWeight: FontWeight.w700)),
                      const Spacer(),
                      Icon(
                        Iconsax.arrow_right_3,
                        color: Colors.black,
                        size: width / 15,
                      ),
                    ],
                  ),
                )),
          ],
        ),
      ),
    ));
  }
}
//const LetsOption(icon: "assets/sign-out .png", title: "LogOut")),