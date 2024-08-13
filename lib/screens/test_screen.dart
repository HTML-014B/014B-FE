import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:geocoding/geocoding.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MapSample(),
    );
  }
}

class MapSample extends StatefulWidget {
  @override
  State<MapSample> createState() => MapSampleState();
}

class MapSampleState extends State<MapSample> {
  late GoogleMapController mapController;

  final LatLng _center = const LatLng(37.24120, 127.0709); // 샌프란시스코의 위도, 경도

  @override
  Widget build(BuildContext context) {
    late GoogleMapController _controller;
    LatLng _initialPosition = LatLng(37.24120, 127.0709); // 초기 위치 (샌프란시스코)
    String _locationInfo = "Tap on the map to get location details";

    void _onMapCreated(GoogleMapController controller) {
      _controller = controller;
    }

    void _onTap(LatLng position) async {
      final latitude = position.latitude;
      final longitude = position.longitude;

      // Geocoding을 사용하여 위치명 얻기
      List<Placemark> placemarks = await placemarkFromCoordinates(
        latitude,
        longitude,
      );
      Placemark place = placemarks[0];

      setState(() {
        _locationInfo = "${place.name}, ${place.locality}, ${place.country}";
      });
      print(
          'Latitude: $latitude, Longitude: $longitude, Location: $_locationInfo');

      setState(() {});
    }

    return Scaffold(
      appBar: AppBar(
        title: Text(_locationInfo),
        backgroundColor: Colors.green[700],
      ),
      body: GoogleMap(
        onMapCreated: _onMapCreated,
        initialCameraPosition: CameraPosition(
          target: _center,
          zoom: 11.0,
        ),
        onTap: _onTap,
      ),
    );
  }
}
