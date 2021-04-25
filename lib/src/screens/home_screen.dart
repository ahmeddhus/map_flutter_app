import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:map_flutter_app/src/helper/constants.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  BitmapDescriptor pinLocationIcon;
  Set<Marker> _markers;
  List<LatLng> latLngList;

  Completer<GoogleMapController> _controller = Completer();

  void _onMapCreated(GoogleMapController controller) {
    _controller.complete(controller);
  }

  @override
  void initState() {
    super.initState();
    _setUpLatLng();
    setCustomMapPin();
    _setUpMarkers();
  }

  void _setUpLatLng() {
    latLngList = [
      latLan1,
      latLan2,
      latLan3,
      latLan4,
      latLan5,
    ];
  }

  void setCustomMapPin() {
    String _iconImage = 'assets/images/marker_icon.png';
    pinLocationIcon = BitmapDescriptor.fromAsset(_iconImage);
  }

  void _setUpMarkers() {
    _markers = {
      Marker(
        markerId: MarkerId('latLan1'),
        position: latLan1,
        icon: pinLocationIcon,
      ),
      Marker(
        markerId: MarkerId('latLan2'),
        position: latLan2,
        icon: pinLocationIcon,
      ),
      Marker(
        markerId: MarkerId('latLan3'),
        position: latLan3,
        icon: pinLocationIcon,
      ),
      Marker(
        markerId: MarkerId('latLan4'),
        position: latLan4,
        icon: pinLocationIcon,
      ),
      Marker(
        markerId: MarkerId('latLan5'),
        position: latLan5,
        icon: pinLocationIcon,
      ),
    };
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Google Map'),
      ),
      body: GoogleMap(
        onMapCreated: _onMapCreated,
        markers: _markers,
        initialCameraPosition: CameraPosition(
          target: latLan2,
          zoom: 17.0,
        ),
      ),
    );
  }
}
