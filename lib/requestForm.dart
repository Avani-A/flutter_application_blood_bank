import 'package:flutter/material.dart';

void main() {
  runApp(BloodRequestFormApp());
}

class BloodRequestFormApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Blood Request Form',
      theme: ThemeData(
        primarySwatch: Colors.red,
      ),
      home: BloodRequestForm(),
    );
  }
}

class BloodRequestForm extends StatefulWidget {
  @override
  _BloodRequestFormState createState() => _BloodRequestFormState();
}

class _BloodRequestFormState extends State<BloodRequestForm> {
  final _formKey = GlobalKey<FormState>();

  String _patientName = '';
  String _dateOfBirth = '';
  String _gender = '';
  String _patientID = '';
  String _bloodGroup = '';
  String _physicianName = '';
  String _department = '';
  String _physicianContact = '';
  String _hospitalName = '';
  String _hospitalAddress = '';
  String _hospitalContact = '';
  List<String> _bloodComponents = [];
  int _quantity = 1;
  String _urgency = '';
  String _dateTimeNeeded = '';
  String _diagnosis = '';
  String _surgeryDetails = '';
  String _previousTransfusions = '';
  String _specialRequirements = '';
  bool _consent = false;
  String _comments = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Blood Request Form',
          style: TextStyle(color: Colors.white), // Change text color to white
        ),
        centerTitle: true,
        backgroundColor: Colors.red, // Set background color to red
      ),
      body: Stack(
        children: [
          // Background Image
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/background.jpg'), // replace with your image path
                fit: BoxFit.cover,
              ),
            ),
          ),
          // Form Content
          SingleChildScrollView(
            padding: EdgeInsets.all(16.0),
            child: Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  // Patient Information Section
                  _buildSectionHeading('Patient Information'),
                  _buildTextField('Full Name', _patientName, (value) => _patientName = value),
                  _buildTextField('Date of Birth', _dateOfBirth, (value) => _dateOfBirth = value),
                  _buildTextField('Gender', _gender, (value) => _gender = value),
                  _buildTextField('Patient ID', _patientID, (value) => _patientID = value),
                  _buildTextField('Blood Group', _bloodGroup, (value) => _bloodGroup = value),

                  SizedBox(height: 20),

                  // Requesting Physician Information Section
                  _buildSectionHeading('Requesting Physician Information'),
                  _buildTextField('Physician Name', _physicianName, (value) => _physicianName = value),
                  _buildTextField('Department', _department, (value) => _department = value),
                  _buildTextField('Contact Information', _physicianContact, (value) => _physicianContact = value),

                  SizedBox(height: 20),

                  // Hospital/Clinic Information Section
                  _buildSectionHeading('Hospital/Clinic Information'),
                  _buildTextField('Hospital/Clinic Name', _hospitalName, (value) => _hospitalName = value),
                  _buildTextField('Address', _hospitalAddress, (value) => _hospitalAddress = value),
                  _buildTextField('Contact Information', _hospitalContact, (value) => _hospitalContact = value),

                  SizedBox(height: 20),

                  // Blood Requirement Details Section
                  _buildSectionHeading('Blood Requirement Details'),
                  _buildCheckboxList('Type of Blood Component', [
                    'Whole Blood',
                    'RBCs',
                    // Add more blood components as needed
                  ]),
                  _buildTextField('Quantity', _quantity.toString(), (value) => _quantity = int.tryParse(value) ?? 1),
                  _buildCheckboxList('Urgency', [
                    'Emergency',
                    'Scheduled/Planned',
                    'Routine',
                  ]),
                  _buildTextField('Date and Time Needed', _dateTimeNeeded, (value) => _dateTimeNeeded = value),

                  SizedBox(height: 20),

                  // Clinical Information Section
                  _buildSectionHeading('Clinical Information'),
                  _buildTextField('Diagnosis', _diagnosis, (value) => _diagnosis = value),
                  _buildTextField('Surgery Details (if applicable)', _surgeryDetails, (value) => _surgeryDetails = value),
                  _buildCheckboxWithText('Previous Transfusions', 'If Yes, Details', _previousTransfusions),
                  _buildCheckboxWithText('Special Requirements', 'If Yes, Details', _specialRequirements),

                  SizedBox(height: 20),

                  // Consent Section
                  _buildSectionHeading('Consent'),
                  CheckboxListTile(
                    title: Text('Informed consent has been obtained for the transfusion.'),
                    value: _consent,
                    onChanged: (newValue) {
                      setState(() {
                        _consent = newValue ?? false;
                      });
                    },
                    controlAffinity: ListTileControlAffinity.leading,
                  ),

                  SizedBox(height: 20),

                  // Additional Information Section
                  _buildSectionHeading('Additional Information'),
                  _buildTextField('Comments', _comments, (value) => _comments = value),

                  SizedBox(height: 20),

                  // Submit Button
                  Center(
                    child: ElevatedButton(
                      onPressed: () {
                        if (_formKey.currentState?.validate() ?? false) {
                          _formKey.currentState?.save();
                          // Handle form submission
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(content: Text('Form Submitted')),
                          );
                        }
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.red, // Change the color to red
                        foregroundColor: Colors.white, // Change the text color to white
                      ),
                      child: Text('Submit'),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSectionHeading(String title) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 10),
      child: Text(
        title,
        style: TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.bold,
          color: title == 'Blood Requirement Details' ? Colors.white : Colors.black,
        ),
      ),
    );
  }

  Widget _buildTextField(String label, String value, ValueChanged<String> onChanged) {
    return TextFormField(
      initialValue: value,
      decoration: InputDecoration(
        labelText: label,
        labelStyle: TextStyle(
          color: Colors.black,
        ),
      ),
      style: TextStyle(
        color: Colors.black,
      ),
      onChanged: onChanged,
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Please enter the $label';
        }
        return null;
      },
    );
  }

  Widget _buildCheckboxList(String title, List<String> options) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: title == 'Blood Requirement Details' ? Colors.white : Colors.black,
          ),
        ),
        ...options.map((option) => CheckboxListTile(
          title: Text(
            option,
            style: TextStyle(color: Colors.black),
          ),
          value: _bloodComponents.contains(option),
          onChanged: (checked) {
            setState(() {
              if (checked!) {
                _bloodComponents.add(option);
              } else {
                _bloodComponents.remove(option);
              }
            });
          },
        )),
      ],
    );
  }

  Widget _buildCheckboxWithText(String title, String textFieldLabel, String value) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Text(
              title,
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
            SizedBox(width: 10),
            Checkbox(
              value: value.isNotEmpty,
              onChanged: (checked) {
                setState(() {
                  value = checked! ? 'Yes' : '';
                });
              },
            ),
          ],
        ),
        TextFormField(
          decoration: InputDecoration(
            labelText: textFieldLabel,
            labelStyle: TextStyle(
              color: Colors.black,
            ),
          ),
          enabled: value.isNotEmpty,
          initialValue: value,
          onChanged: (text) {
            setState(() {
              value = text;
            });
          },
          style: TextStyle(
            color: Colors.black,
          ),
        ),
      ],
    );
  }
}

