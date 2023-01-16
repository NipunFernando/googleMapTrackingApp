import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class SimpleMapScreen extends StatefulWidget {
  const SimpleMapScreen({Key? key}) : super(key: key);

  @override
  State<SimpleMapScreen> createState() => _SimpleMapScreenState();
}

class _SimpleMapScreenState extends State<SimpleMapScreen> {

  final Completer<GoogleMapController> _controller = Completer();

  static const CameraPosition initialPosition = CameraPosition(target: LatLng(7.253924853399335, 80.59193258728561),zoom:18.0);

  //static const CameraPosition initialPosition = CameraPosition(target: LatLng(7.248903313507881, 80.62724185574072),zoom:18.0);

  //static const CameraPosition targetPosition = CameraPosition(target: LatLng(7.25467254442788, 80.5952258202641),zoom: 18.0, bearing: 192.0, tilt: 60);
  static const CameraPosition targetPosition = CameraPosition(target: LatLng(7.25467254442788, 80.5952258202641),zoom: 18.0);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Google Map App'),
        centerTitle: true,
      ),
      body: GoogleMap(initialCameraPosition: initialPosition,mapType: MapType.normal, onMapCreated: (GoogleMapController controller) {
        _controller.complete(controller);
      },),
      floatingActionButton: FloatingActionButton.extended(onPressed: (){gotoML1();}, label: Text("Frist Milestone"),icon: const Icon(Icons.assistant_photo_outlined),),
    );
  }

  Future<void> gotoML1() async{
    final GoogleMapController controller = await _controller.future;
    controller.animateCamera(CameraUpdate.newCameraPosition(targetPosition));

  }
}
