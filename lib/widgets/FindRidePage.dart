import 'package:flutter/material.dart';
import 'package:stud_grab_app/models/RideLocation.dart';

class FindRidePage extends StatefulWidget {
  final List<RideLocation> rideLocations;

  const FindRidePage({Key? key, required this.rideLocations}) : super(key: key);

  @override
  _FindRidePageState createState() => _FindRidePageState();
}

class _FindRidePageState extends State<FindRidePage> {
  String? selectedDestination;
  late String name;
  late String phoneNumber;
  late String from;

  @override
  Widget build(BuildContext context) {
    return Scaffold(      
      backgroundColor: Colors.amber,
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 90, 42, 99),
        title: const Text('Find a Ride', style: TextStyle(color: Colors.white)),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            DropdownButton<String>(
              hint: const Text('Select Destination'),
              value: selectedDestination,
              onChanged: (String? value) {
                setState(() {
                  selectedDestination = value;
                });
              },
              items: [
                ...widget.rideLocations.map((location) {
                  return DropdownMenuItem<String>(
                    value: location.name,
                    child: Text(location.name),
                  );
                }),
              ],
            ),
            SizedBox(height: 20),
            TextFormField(
              decoration: InputDecoration(labelText: 'Name'),
              onChanged: (value) {
                setState(() {
                  name = value;
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
            TextFormField(
              decoration: InputDecoration(labelText: 'From'),
              onChanged: (value) {
                setState(() {
                  from = value;
                });
              },
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () async{
                // You can access the selected destination using selectedDestination
                if (selectedDestination != null) {
                  // Pass the entered details back to HomePage/previous page
                  Navigator.pop(
                    context,
                    {
                      'selectedDestination': selectedDestination,
                      'name': name,
                      'phoneNumber': phoneNumber,
                      'from': from,
                    },
                  );
                } else {
                  print('Please select a destination');
                }
              },
              child: Text('Search for Rides'),
            ),
          ],
        ),
      ),
    );
  }
}
