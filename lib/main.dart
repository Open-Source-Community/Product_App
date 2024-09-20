import 'package:device_preview/device_preview.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:product_app/firebase_options.dart';
import 'package:product_app/view/auth/log_in.dart';
import 'package:product_app/view/home/home_view.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(
   const MyApp(), 
    
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
     
      debugShowCheckedModeBanner: false,
      home: FirebaseAuth.instance.currentUser == null ? LogIn() : Home(),
      routes: {
        "home": (BuildContext context) => Home(),
        "login": (BuildContext context) => LogIn()
      },
    );
  }
}
