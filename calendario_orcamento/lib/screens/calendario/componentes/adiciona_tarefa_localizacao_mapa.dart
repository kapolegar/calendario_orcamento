import 'dart:async';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MapaLocalizacao extends StatefulWidget {
  const MapaLocalizacao({super.key});

  @override
  State<MapaLocalizacao> createState() => _MapaLocalizacaoState();
}

class _MapaLocalizacaoState extends State<MapaLocalizacao> {
  final Completer<GoogleMapController> _controller = Completer();

  static const LatLng _center = LatLng(-30.018537, -51.202460);

  void _onMapCreated(GoogleMapController controller) {
    _controller.complete(controller);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GoogleMap(
        onMapCreated: _onMapCreated,
        initialCameraPosition: const CameraPosition(
          target: _center,
          zoom: 11.0,
        ),
      ),
    );
  }
}
