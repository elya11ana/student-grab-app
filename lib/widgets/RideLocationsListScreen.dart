import 'package:flutter/material.dart';
import 'package:stud_grab_app/models/RideLocation.dart';

class RideLocationsListScreen extends StatefulWidget {
  final List<RideLocation> rideLocations;

  RideLocationsListScreen({required this.rideLocations});

  @override
  _RideLocationsListScreenState createState() =>
      _RideLocationsListScreenState();
}

class _RideLocationsListScreenState extends State<RideLocationsListScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.amber,
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 90, 42, 99),
        title: Text(
          'Available Ride Locations',
          style: TextStyle(color: Colors.white),
        ),
        
      ),
      body: ListView.builder(
        itemCount: widget.rideLocations.length, //ms 148 Biassek
        itemBuilder: (context, index) {
          final location = widget.rideLocations[index];
          return ListTile(
            title: Text(location.name),
            subtitle: Text(location.details),
            onTap: () {
              // Handle tap on the location, e.g., navigate to details screen
              // or perform other actions.
              print('Tapped on ${location.name}');
            },
          );
        },
      ),
    );
  }

}
