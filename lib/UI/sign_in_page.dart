import 'package:flutter/material.dart';

class SignInPage extends StatefulWidget {
  @override
  _SignInPageState createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/sign_in_page.png'), // Use your asset image for background
            fit: BoxFit.cover,
          ),
        ),
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                SizedBox(height: 100),
                TextField(
                  controller: _emailController,
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: Color(0xFFFFFDD0).withOpacity(0.8), // Cream white color
                    hintText: 'Email',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                  ),
                  keyboardType: TextInputType.emailAddress,
                ),
                SizedBox(height: 16.0),
                TextField(
                  controller: _passwordController,
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: Color(0xFFFFFDD0).withOpacity(0.8), // Cream white color
                    hintText: 'Password',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                  ),
                  obscureText: true,
                ),
                SizedBox(height: 60.0),
                GestureDetector(
                  onTap: () {
                    // Handle sign-in logic
                    String email = _emailController.text;
                    String password = _passwordController.text;
                    print('Email: $email');
                    print('Password: $password');
                    // Add your sign-in logic here (e.g., API call)
                  },
                  child: Container(
                    width: 250, // Adjust width as needed
                    height: 100, // Adjust height as needed
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage('assets/sign_in_button.png'), // Use your button image asset
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),

                //more buttons



              ],
            ),
          ),
        ),
      ),
    );
  }
}
