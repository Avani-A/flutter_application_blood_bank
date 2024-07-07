import 'package:flutter/material.dart';
import 'package:flutter_application_blood_bank/UI/my_profile.dart';
import 'package:flutter_application_blood_bank/UI/splash_screen.dart'; // Import your splash screen file

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Blood Bank',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      // home: SplashScreen(), // Set SplashScreen as the home screen
      home: MyProfile(), // Set SplashScreen as the home screen
      debugShowCheckedModeBanner: false, // Set to false to remove the debug banner
    );
  }
}


