import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';

class ConfirmLocationScreen extends StatefulWidget {
  final String token;

  const ConfirmLocationScreen({
    super.key,
    required this.token,
  });

  @override
  State<ConfirmLocationScreen> createState() => _ConfirmLocationScreenState();

  // Get the token from the route arguments
  static ConfirmLocationScreen fromRoute(RouteSettings settings) {
    final args = settings.arguments as Map<String, dynamic>;
    return ConfirmLocationScreen(token: args['token'] as String);
  }
}

class _ConfirmLocationScreenState extends State<ConfirmLocationScreen> {
  late final MapController _mapController;
  LatLng _selectedLocation = LatLng(30.033333, 31.233334); // Default to Cairo

  @override
  void initState() {
    super.initState();
    _mapController = MapController();
  }

  void _onTapMap(LatLng point) {
    setState(() {
      _selectedLocation = point;
    });
  }

  void _onConfirmLocation() {
    // هنا تقدر تبعت اللوكيشن للباك إند أو تخزنها
    print("Selected location: $_selectedLocation");
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text("Location confirmed: $_selectedLocation")),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Confirm Location'),
      ),
      body: FlutterMap(
        mapController: _mapController,
        options: MapOptions(
          center: _selectedLocation,
          zoom: 13.0,
          onTap: (_, point) => _onTapMap(point),
        ),
        children: [
          TileLayer(
            urlTemplate: "https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png",
            subdomains: ['a', 'b', 'c'],
          ),
          MarkerLayer(
            markers: [
              Marker(
                width: 80.0,
                height: 80.0,
                point: _selectedLocation,
                child: const Icon(
                  Icons.location_on,
                  size: 40.0,
                  color: Colors.red,
                ),
              ),
            ],
          ),
        ],
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ElevatedButton(
          onPressed: _onConfirmLocation,
          child: const Text('Confirm Location'),
        ),
      ),
    );
  }
}
