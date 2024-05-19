import 'dart:async';

import 'package:flutter/material.dart';

import 'package:geolocator/geolocator.dart';

class GeoFencing extends StatefulWidget {
  const GeoFencing({super.key});

  @override
  State<GeoFencing> createState() => _GeoFencingState();
}

class _GeoFencingState extends State<GeoFencing> {
  Position? _currentLocation;
  late bool servicePermission = false;
  Future<Position> _getCurrentLocation() async {
    servicePermission = await Geolocator.isLocationServiceEnabled();

    if (!servicePermission) {
      print("Service Disabled");
    }

    return await Geolocator.getCurrentPosition();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Get Your Location"),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
// Displaying the title

            const Text(
              "Location Coordinates",
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(
              height: 6,
            ),

// Displaying the latitude and longitude

            Text(
              "Latitude = ${_currentLocation?.latitude} ; Longitude = ${_currentLocation?.longitude}",
            ),

            const SizedBox(
              height: 30.0,
            ),

// Button to trigger location fetching

            ElevatedButton(
              onPressed: () async {
// Fetch and print the current location

                _currentLocation = await _getCurrentLocation();
              },
              child: const Text('Get Location'),
            )
          ],
        ),
      ),
    );
  }
}
