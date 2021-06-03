import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlng/latlng.dart';
import "package:latlong/latlong.dart" as latLng;
class MapPage extends StatefulWidget {
  @override
  _MapPageState createState() => _MapPageState();
}

class _MapPageState extends State<MapPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(

      ),
      body: FlutterMap(
        options: MapOptions(
          center: latLng.LatLng(40,40),
          minZoom: 10,
        ),
        layers: [
          TileLayerOptions(
              urlTemplate: "https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png",
              subdomains: ['a', 'b', 'c']
          ),
        ],
      ),
    );
  }
}
