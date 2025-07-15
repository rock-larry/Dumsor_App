import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MapScreen extends StatefulWidget {
  @override
  _MapScreenState createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {
  late GoogleMapController mapController;

  final LatLng _center = const LatLng(5.614818, -0.205874); // Accra

  final Set<Marker> _markers = {
    Marker(
      markerId: MarkerId('outage1'),
      position: LatLng(5.614818, -0.205874),
      infoWindow: InfoWindow(title: 'Power Outage Reported'),
    ),
    Marker(
      markerId: MarkerId('outage2'),
      position: LatLng(6.6886, -1.6244), // Kumasi
      infoWindow: InfoWindow(title: 'Outage - Kumasi'),
    ),
  };

  void _onMapCreated(GoogleMapController controller) {
    mapController = controller;
  }

  @override
  Widget build(BuildContext context) {
    return GoogleMap(
      onMapCreated: _onMapCreated,
      initialCameraPosition: CameraPosition(
        target: _center,
        zoom: 7.0,
      ),
      markers: _markers,
    );
  }
}
