import 'package:flutter/material.dart';

void main() {
  runApp(BloodSyncApp());
}

class BloodSyncApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'BloodSync',
      theme: ThemeData(
        primarySwatch: Colors.red,
      ),
      home: BloodSyncHomePage(),
    );
  }
}

class BloodSyncHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BloodSync'),
        centerTitle: true,
      ),
      drawer: BloodSyncDrawer(), // Add drawer here
      body: Center(
        child: Text('Home Screen Content'),
      ),
    );
  }
}

class BloodSyncDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          DrawerHeader(
            decoration: BoxDecoration(
              color: Colors.red,
            ),
            child: Text(
              'BloodSync',
              style: TextStyle(
                color: Colors.white,
                fontSize: 24,
              ),
            ),
          ),
          ListTile(
            title: Text('Request Form'),
            onTap: () {
              // Navigate to request form page
              Navigator.pop(context); // Close the drawer
              // Add your navigation logic here
            },
          ),
          ListTile(
            title: Text('Donation Form'),
            onTap: () {
              // Navigate to donation form page
              Navigator.pop(context); // Close the drawer
              // Add your navigation logic here
            },
          ),
          Divider(),
          ListTile(
            title: Text('Terms and Conditions'),
            onTap: () {
              // Show terms and conditions dialog or navigate to a new page
              Navigator.pop(context); // Close the drawer
              showDialog(
                context: context,
                builder: (BuildContext context) {
                  return AlertDialog(
                    title: Text('Terms and Conditions'),
                    content: SingleChildScrollView(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(
                            // Insert your detailed terms and conditions here
                            '''Welcome to BloodSync, a platform dedicated to blood donation and transfusion management. These terms and conditions outline the rules and regulations for the use of the BloodSync mobile application.

                            1. Acceptance of Terms
                            By downloading, installing, or using the BloodSync mobile application, you agree to be bound by these terms and conditions. If you do not agree with any part of these terms, you may not access the application.

                            2. Use of the Application
                            - Registration: Users must register and create an account to access certain features of the application.
                            - Accuracy of Information: Users are responsible for providing accurate and up-to-date information.
                            - Use of Data: User data, including personal and medical information, will be handled according to our Privacy Policy.

                            3. User Responsibilities
                            - Donor Eligibility: Users must meet the eligibility requirements to donate blood as per local regulations.
                            - Accurate Information: Users must provide truthful and accurate information during registration and use of the application.
                            - Respect for Privacy: Users must respect the privacy and confidentiality of other users and refrain from sharing sensitive information without consent.

                            4. Donation Process
                            - Appointment Booking: Users can schedule blood donation appointments through the application.
                            - Health Screening: Users must undergo health screenings to determine eligibility for blood donation.
                            - Post-Donation Care: Users will receive guidelines on post-donation care and follow-up.

                            5. Content and Services
                            - Accuracy of Information: BloodSync strives to provide accurate and reliable information but does not guarantee the accuracy, completeness, or reliability of any content.
                            - Service Availability: BloodSync may suspend or terminate services temporarily or permanently without notice.

                            6. Prohibited Activities
                            Users are prohibited from:
                            - Violating any local, state, national, or international laws.
                            - Engaging in any fraudulent, abusive, or unlawful activities.
                            - Attempting to access data or information not intended for the user.

                            7. Limitation of Liability
                            BloodSync and its affiliates shall not be liable for any direct, indirect, incidental, special, or consequential damages arising from the use or inability to use the application or services.

                            8. Amendments
                            BloodSync reserves the right to modify or replace these terms and conditions at any time. Changes will be effective immediately upon posting on the application.

                            9. Governing Law
                            These terms and conditions shall be governed by and construed in accordance with the laws of [Your Jurisdiction], without regard to its conflict of law provisions.

                            10. Contact Us
                            If you have any questions or concerns about these terms and conditions, please contact us at [contact email or phone number].
                            ''',
                            style: TextStyle(fontSize: 16),
                          ),
                        ],
                      ),
                    ),
                    actions: <Widget>[
                      TextButton(
                        child: Text('Close'),
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                      ),
                    ],
                  );
                },
              );
            },
          ),
          ListTile(
            title: Text('Licenses'),
            onTap: () {
              // Navigate to licenses page
              Navigator.pop(context); // Close the drawer
              // Add your navigation logic here
            },
          ),
          ListTile(
            title: Text('Contact Information'),
            onTap: () {
              // Navigate to contact information page
              Navigator.pop(context); // Close the drawer
              // Add your navigation logic here
            },
          ),
          Divider(),
          ListTile(
            title: Text('Help & Support'),
            onTap: () {
              // Navigate to help & support page
              Navigator.pop(context); // Close the drawer
              // Add your navigation logic here
            },
          ),
          ListTile(
            title: Text('Privacy Policy'),
            onTap: () {
              // Navigate to privacy policy page
              Navigator.pop(context); // Close the drawer
              // Add your navigation logic here
            },
          ),
          ListTile(
            title: Text('Terms of Use'),
            onTap: () {
              // Navigate to terms of use page
              Navigator.pop(context); // Close the drawer
              // Add your navigation logic here
            },
          ),
          ListTile(
            title: Text('Donor Eligibility Criteria'),
            onTap: () {
              // Navigate to donor eligibility criteria page
              Navigator.pop(context); // Close the drawer
              // Add your navigation logic here
            },
          ),
          ListTile(
            title: Text('FAQs'),
            onTap: () {
              // Navigate to FAQs page
              Navigator.pop(context); // Close the drawer
              // Add your navigation logic here
            },
          ),
          ListTile(
            title: Text('Invite Friends'),
            onTap: () {
              // Implement invite friends functionality
              Navigator.pop(context); // Close the drawer
              // Add your navigation logic here
            },
          ),
          ListTile(
            title: Text('App Version and Updates'),
            onTap: () {
              // Navigate to app version and updates page
              Navigator.pop(context); // Close the drawer
              // Add your navigation logic here
            },
          ),
        ],
      ),
    );
  }
}
