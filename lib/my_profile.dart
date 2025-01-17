import 'package:flutter/material.dart';
import 'edit_profile.dart'; // Import the EditPage
import 'dart:io';

class MyProfile extends StatefulWidget {
  @override
  _MyProfileState createState() => _MyProfileState();
}
//TOAST
class _MyProfileState extends State<MyProfile> {
  String _name = 'Name Surname';
  int _numberOfDonations = 10;
  String _phoneNumber = '123-456-7890';
  String _email = 'email@example.com';
  String _dob = '01/01/1990';
  String _address = '1234 Street Name, City, Country';
  String _avatarUrl = 'https://via.placeholder.com/150';
  File? _avatarFile;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red, // Change AppBar color to red
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: Center(
          child: Text('My Profile'),
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.edit),
            onPressed: () async {
              // Navigate to the EditPage and wait for result
              final Map<String, dynamic>? result = await Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => EditPage(
                    name: _name,
                    numberOfDonations: _numberOfDonations,
                    phoneNumber: _phoneNumber,
                    email: _email,
                    dob: _dob,
                    address: _address,
                    avatarUrl: _avatarUrl,
                  ),
                ),
              );

              // Update state with edited data if result is not null
              if (result != null) {
                setState(() {
                  _name = result['name'];
                  _numberOfDonations = result['numberOfDonations'];
                  _phoneNumber = result['phoneNumber'];
                  _email = result['email'];
                  _dob = result['dob'];
                  _address = result['address'];
                  _avatarFile = result['avatarFile'];
                });
              }
            },
          ),
        ],
      ),
      body: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/Frame 11.png'),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                Center(
                  child: CircleAvatar(
                    radius: 50,
                    backgroundImage: _avatarFile != null
                        ? FileImage(_avatarFile!)
                        : NetworkImage(_avatarUrl) as ImageProvider,
                  ),
                ),
                SizedBox(height: 16),
                Text(
                  _name,
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                ),
                Text(
                  'Number of Donations: $_numberOfDonations',
                  style: TextStyle(fontSize: 18, color: Colors.grey),
                ),
                SizedBox(height: 16),
                Row(
                  children: [
                    Icon(Icons.phone),
                    SizedBox(width: 8),
                    Text(_phoneNumber),
                  ],
                ),
                SizedBox(height: 16),
                Row(
                  children: [
                    Icon(Icons.email),
                    SizedBox(width: 8),
                    Text(_email),
                  ],
                ),
                SizedBox(height: 16),
                Row(
                  children: [
                    Icon(Icons.calendar_today),
                    SizedBox(width: 8),
                    Text(_dob),
                  ],
                ),
                SizedBox(height: 16),
                Row(
                  children: [
                    Icon(Icons.home),
                    SizedBox(width: 8),
                    Text(_address),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
