import 'package:flutter/material.dart';
import 'package:stud_grab_app/models/RideLocation.dart';
import 'package:stud_grab_app/widgets/FindRidePage.dart';
import 'package:stud_grab_app/widgets/OfferRidePage.dart';
import 'package:stud_grab_app/widgets/RideLocationsListScreen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Student Grab App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // State variable to store entered details
  Map<String, dynamic>? passengerDetails;
  Map<String, dynamic>? driverDetails;

  final List<RideLocation> rideLocations = [
    RideLocation(
        name: 'Kampung Wakaf Tembesu', details: '31 Jalan Wakaf Tembesu'),
    RideLocation(name: 'Kampung Tok Jembal', details: '40 Jalan Tok Jembal'),
    RideLocation(name: 'Pantai Teluk Ketapang', details: 'Laluan ke KTCC'),
    RideLocation(name: 'Unisza', details: 'Hospital Unisza'),
    RideLocation(name: 'Stesen Bas', details: 'MBKT'),
    RideLocation(
        name: 'Klinik Ikram', details: 'Depan Sekolah Kebangsaan Gong Badak'),
    RideLocation(name: 'Masjid Padang Nenas', details: 'Padang Nenas'),
    RideLocation(name: 'Taman Tasik Kuala Nerus', details: 'Bandar Baru'),
    RideLocation(name: 'Mydin Mall Gong Badak', details: 'Dataran Austin'),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 90, 42, 99),
        title: Text(
          'Student Grab',
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'Welcome to Student Grab App!',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: const Color.fromARGB(255, 170, 121, 179),
              ),
            ),
            // Display the filled form to find a ride
            if (passengerDetails != null) ...[
              SizedBox(height: 20),
              GestureDetector(
                onTap: () {
                  //remove the detailed box when it is clicked or tap
                  setState(() {
                    passengerDetails = null;
                  });
                },
              
              child: Container(
                padding: EdgeInsets.all(16.0),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10.0),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.5),
                      spreadRadius: 5,
                      blurRadius: 7,
                      offset: Offset(0, 3),
                    ),
                  ],
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                        'Selected Destination: ${passengerDetails!['selectedDestination']}'),
                    Text('Name: ${passengerDetails!['name']}'),
                    Text('Phone Number: ${passengerDetails!['phoneNumber']}'),
                    Text('From: ${passengerDetails!['from']}'),
                  ],
                ),
              ),
              ),
            ],
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () async {
                // Navigate to FindRidePage and wait for result
                final result = await Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => FindRidePage(
                      rideLocations: rideLocations,
                    ),
                  ),
                );

                // Handle the result from FindRidePage
                if (result != null) {
                  // Update the state variable with entered details
                  setState(() {
                    passengerDetails = result;
                  });
                }
              },
              child: Text(
                'Find a Ride',
                style: TextStyle(fontSize: 18),
              ),
            ),
            SizedBox(height: 10),
            ElevatedButton(
              onPressed: () async {
                // Navigate to the OfferRidePage and wait for the result (entered details)
                final results = await Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => OfferRidePage()),
                );

                // Handle the result from OfferRidePage
                if (results != null) {
                  // Update the state variable with entered details
                  setState(() {
                    driverDetails = results;
                  });
                }

                // Display entered details if available
                if (driverDetails != null) {
                  // Wrap the details display in a widget, e.g., Column
                  // ignore: use_build_context_synchronously
                  showDialog(
                    context: context,
                    builder: (context) => AlertDialog(
                      content: Container(
                        padding: const EdgeInsets.all(16.0),
                        width: 50.0,
                        height: 120.0,
                        
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('Name: ${driverDetails!['name']}'),
                            Text('Gender: ${driverDetails!['gender']}'),
                            Text('Phone Number: ${driverDetails!['phoneNumber']}'),
                            Text('Plate No: ${driverDetails!['carPlate']}'),
                          ],
                        ),
                      ),
                    ),
                  );
                }
              },
              child: Text(
                'Offer a Ride',
                style: TextStyle(fontSize: 18),
              ),
            ),
          ],
        ),
      ),
      drawer: Drawer(
        backgroundColor: Color.fromARGB(255, 233, 191, 255),
        child: ListView(
          children: [
            const SizedBox(
              height: 60.0,
              child: DrawerHeader(
                decoration: BoxDecoration(color: Colors.purple),
                child: Text(
                  'Drawer Header',
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ),
            ListTile(
              title: Text('Show Ride Locations'),
              onTap: () {
                // Navigate to RideLocationsListScreen
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => RideLocationsListScreen(
                      rideLocations: rideLocations,
                    ),
                  ),
                );
              },
            ),
          ],
        ),
      ),
      backgroundColor: Colors.amber,
    );
  }
}
