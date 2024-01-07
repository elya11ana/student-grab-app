import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:stud_grab_app/models/DriverDetails.dart';

class OfferRidePage extends StatefulWidget {
  @override
  _OfferRidePageState createState() => _OfferRidePageState();
}

class _OfferRidePageState extends State<OfferRidePage> {
  late String name;
  late String gender;
  late String carPlate;
  late String phoneNumber;
  String? selectedGender;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.amber,
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 90, 42, 99),
        title: Text(
          'Offer a Ride',
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            TextFormField(
              decoration: InputDecoration(labelText: 'Name'),
              onChanged: (value) {
                setState(() {
                  name = value;
                });
              },
            ),
            SizedBox(height: 20),
            DropdownButtonFormField<String>(
              decoration: InputDecoration(labelText: 'Gender'),
              value: selectedGender,
              onChanged: (String? value) {
                setState(() {
                  selectedGender = value ?? '';
                });
              },
              items: ['Female', 'Male'].map((String gender) {
                return DropdownMenuItem<String>(
                  value: gender,
                  child: Text(gender),
                );
              }).toList(),
            ),
            SizedBox(height: 20),
            TextFormField(
              decoration: InputDecoration(labelText: 'Plate No'),
              onChanged: (value) {
                setState(() {
                  carPlate = value;
                });
              },
            ),
            SizedBox(height: 20),
            TextFormField(
              decoration: InputDecoration(labelText: 'Phone Number'),
              keyboardType: TextInputType.number,
              onChanged: (value) {
                setState(() {
                  phoneNumber = value;
                });
              },
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () async {
                // Check if all required fields are filled
                if (name.isNotEmpty &&
                    selectedGender != null &&
                    carPlate.isNotEmpty) {
                  
                  // Create an instance of DriverDetails with the entered details
                  DriverDetails driverDetails = DriverDetails(
                    name: name,
                    gender: selectedGender!,
                    carPlate: carPlate,
                    phoneNumber: phoneNumber,
                  );

                  // Navigate back to the HomePage with the entered details
                  Navigator.pop(
                    context,
                    {
                      'name': driverDetails.name,
                      'gender': driverDetails.gender,
                      'carPlate': driverDetails.carPlate,
                      'phoneNumber': driverDetails.phoneNumber,
                    },
                  );
                } else {
                  // An error message will be printed
                  print('Please fill in all fields.');
                }
              },
              child: Text('Offer Ride'),
            ),
          ],
        ),
      ),
    );
  }
}
