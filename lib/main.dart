import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

Future<void> main() async {
  await dotenv.load(fileName: ".env"); // Carga las variables
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final lat1 = double.parse(dotenv.env['LAT1'] ?? '0');
    final lng1 = double.parse(dotenv.env['LNG1'] ?? '0');
    final lat2 = double.parse(dotenv.env['LAT2'] ?? '0');
    final lng2 = double.parse(dotenv.env['LNG2'] ?? '0');

    return MaterialApp(
      title: 'Mapa Demo',
      home: Scaffold(
        appBar: AppBar(title: const Text('Mapa en Web')),
        body: FlutterMap(
          options: MapOptions(
            initialCenter: LatLng(lat1, lng1),
            initialZoom: 13.0,
          ),
          children: [
            TileLayer(
              urlTemplate: "https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png",
              subdomains: const ['a', 'b', 'c'],
            ),
            MarkerLayer(
              markers: [
                Marker(
                  point: LatLng(lat1, lng1),
                  width: 80,
                  height: 80,
                  child: const Icon(
                    Icons.location_pin,
                    color: Colors.red,
                    size: 40,
                  ),
                ),
                Marker(
                  point: LatLng(lat2, lng2),
                  width: 80,
                  height: 80,
                  child: const Icon(
                    Icons.location_pin,
                    color: Colors.blue,
                    size: 40,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}