import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:geolocator/geolocator.dart';

class MapviewPage extends StatefulWidget {
  MapviewPage({Key key}) : super(key: key);

  @override
  _MapviewPageState createState() {
    return _MapviewPageState();
  }
}

class _MapviewPageState extends State<MapviewPage> {
  Completer<GoogleMapController> _controller = Completer();
  final GlobalKey<ScaffoldState> _key = GlobalKey<ScaffoldState>();

  var isLoading = true;
  LatLng _center = const LatLng(10.020909, 105.786489);
  final Set<Marker> _markers = {};
  LatLng _lastMapPosition = const LatLng(10.020909, 105.786489);

  void _onMapCreated(GoogleMapController controller) {
    _controller.complete(controller);

    setState(() {
      isLoading = false;
      _markers.add(Marker(
        // This marker id can be anything that uniquely identifies each marker.
        markerId: MarkerId(_lastMapPosition.toString()),
        position: _lastMapPosition,
        infoWindow: InfoWindow(
            //title: diachihinetai,
            //snippet: 'Đánh giá: 5*',
            ),
        icon: BitmapDescriptor.defaultMarker,
        //icon: BitmapDescriptor.fromAsset("assets/images/car.png"),
      ));

      _markers.add(Marker(
        // This marker id can be anything that uniquely identifies each marker.
        markerId: MarkerId(_lastMapPosition.toString()),
        position: _lastMapPosition,

        icon: BitmapDescriptor.defaultMarker,
        //icon: BitmapDescriptor.fromAsset("assets/images/caricon1.png"),
      ));
    });
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return GoogleMap(
      myLocationEnabled: true,
      myLocationButtonEnabled: true,
      onMapCreated: _onMapCreated,
      initialCameraPosition: CameraPosition(
        target: _center,
        zoom: 18.0,
      ),
      markers: _markers,
    );
  }
}
