import 'package:flutter/material.dart';
import 'dart:async';
import 'sign_in_page.dart'; // Import the sign-in page

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(Duration(seconds: 2), () {
      // Navigate to SignInPage after 3 seconds
      //if loggedIn== false , navigate to signin page
      //if loggedIn == true, navigate to homescreen
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(
          builder: (context) => SignInPage(),
        ),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/splash_screen.png'), // Use your asset image
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }
}
