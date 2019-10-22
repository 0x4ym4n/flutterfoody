import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_rating/flutter_rating.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:geolocator/geolocator.dart';

import 'mockdata.dart';
import 'uidata.dart';

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

  int selectedIndex = 0;

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

        //icon: BitmapDescriptor.defaultMarker,
        icon: BitmapDescriptor.fromAsset("assets/images/naviga96.png"),
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
    return Stack(
      children: <Widget>[
        GoogleMap(
          myLocationEnabled: true,
          myLocationButtonEnabled: true,
          onMapCreated: _onMapCreated,
          initialCameraPosition: CameraPosition(
            target: _center,
            zoom: 18.0,
          ),
          markers: _markers,
        ),
        Column(
          children: <Widget>[
            Spacer(),
            _buildListHor(),
            SizedBox(
              height: 40,
            )
          ],
        ),
      ],
    );
  }

  Widget _buildFoodItem({int index}) {
    return InkWell(
      onTap: () => {
        _chonItem(index)
      },
      child: Padding(
        padding: const EdgeInsets.only(right: 8.0),
        child: Card(
          elevation: 2.0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10.0),
          ),
          child: Container(
            // color: Colors.pinkAccent,
            padding: EdgeInsets.all(8),
            decoration: BoxDecoration(
              border: index == selectedIndex
                  ? Border.all(color: UIData.PrimaryAssentColor)
                  : null,
              borderRadius: BorderRadius.circular(10.0),

              //color: UIData.tr,
            ),
            child: Row(
              children: <Widget>[
                ClipRRect(
                  borderRadius: BorderRadius.circular(5.0),
                  child: Image.asset(
                    imgset1[index]["img"],
                    height: 80,
                    width: 80,
                    fit: BoxFit.cover,
                  ),
                ),
                Container(
                  padding: EdgeInsets.all(5),
                  //width: double.infinity,
                  //color: Colors.lightGreenAccent,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(listshop[index].tenquan,
                          style: TextStyle(fontWeight: FontWeight.bold)),
                      Text(
                        listshop[index].diachi,
                        style: TextStyle(color: Colors.grey),
                      ),
                      StarRating(
                        color: Colors.amber,
                        rating: listmonan[index]["rating"],
                        size: 16,
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildListHor() {
    return Container(
      height: 110.0,
      //width: 200,
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: <Widget>[
          _buildFoodItem(index: 0),
          _buildFoodItem(index: 1),
          _buildFoodItem(index: 2),
          _buildFoodItem(index: 3),
          _buildFoodItem(index: 4),
          _buildFoodItem(index: 5),
          SizedBox(
            width: 20.0,
          ),
        ],
      ),
    );
  }

  _chonItem(index) {
    setState(() {
      selectedIndex=index;
    });
  }
}
