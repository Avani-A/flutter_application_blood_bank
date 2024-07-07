import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';

class EditPage extends StatefulWidget {
  final String name;
  final int numberOfDonations;
  final String phoneNumber;
  final String email;
  final String dob;
  final String address;
  final String avatarUrl;

  EditPage({
    required this.name,
    required this.numberOfDonations,
    required this.phoneNumber,
    required this.email,
    required this.dob,
    required this.address,
    required this.avatarUrl,
  });

  @override
  _EditPageState createState() => _EditPageState();
}

class _EditPageState extends State<EditPage> {
  TextEditingController _nameController = TextEditingController();
  TextEditingController _donationsController = TextEditingController();
  TextEditingController _phoneController = TextEditingController();
  TextEditingController _emailController = TextEditingController();
  TextEditingController _dobController = TextEditingController();
  TextEditingController _addressController = TextEditingController();
  File? _avatarFile;

  @override
  void initState() {
    super.initState();
    _nameController.text = widget.name;
    _donationsController.text = widget.numberOfDonations.toString();
    _phoneController.text = widget.phoneNumber;
    _emailController.text = widget.email;
    _dobController.text = widget.dob;
    _addressController.text = widget.address;
  }

  @override
  void dispose() {
    _nameController.dispose();
    _donationsController.dispose();
    _phoneController.dispose();
    _emailController.dispose();
    _dobController.dispose();
    _addressController.dispose();
    super.dispose();
  }
//function
  Future<void> _pickImage() async {
    final pickedFile = await ImagePicker().getImage(source: ImageSource.gallery);

    if (pickedFile != null) {
      setState(() {
        _avatarFile = File(pickedFile.path);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Edit Profile'),
        actions: [
          IconButton(
            icon: Icon(Icons.save),
            onPressed: () {
              // Pass edited data back to MyProfile page
              Navigator.pop(context, {
                'name': _nameController.text,
                'numberOfDonations': int.tryParse(_donationsController.text) ?? 0,
                'phoneNumber': _phoneController.text,
                'email': _emailController.text,
                'dob': _dobController.text,
                'address': _addressController.text,
                'avatarFile': _avatarFile,
              });
            },
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: [
            Center(
              child: GestureDetector(
                onTap: _pickImage,
                child: CircleAvatar(
                  radius: 50,
                  backgroundImage: _avatarFile != null
                      ? FileImage(_avatarFile!)
                      : NetworkImage(widget.avatarUrl) as ImageProvider,
                ),
              ),
            ),
            SizedBox(height: 16),
            TextFormField(
              controller: _nameController,
              decoration: InputDecoration(labelText: 'Name'),
            ),
            TextFormField(
              controller: _donationsController,
              decoration: InputDecoration(labelText: 'Number of Donations'),
              keyboardType: TextInputType.number,
            ),
            TextFormField(
              controller: _phoneController,
              decoration: InputDecoration(labelText: 'Phone Number'),
              keyboardType: TextInputType.phone,
            ),
            TextFormField(
              controller: _emailController,
              decoration: InputDecoration(labelText: 'Email'),
              keyboardType: TextInputType.emailAddress,
            ),
            TextFormField(
              controller: _dobController,
              decoration: InputDecoration(labelText: 'Date of Birth'),
              keyboardType: TextInputType.datetime,
            ),
            TextFormField(
              controller: _addressController,
              decoration: InputDecoration(labelText: 'Address'),
            ),
          ],
        ),
      ),
    );
  }
}
