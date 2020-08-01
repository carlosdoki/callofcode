import 'dart:async';

import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:platform_maps_flutter/platform_maps_flutter.dart';

class Mapa extends StatefulWidget {
  Mapa({Key key}) : super(key: key);

  @override
  _MapaState createState() => _MapaState();
}

class _MapaState extends State<Mapa> {
  var geolocator = Geolocator();
  Position positionActual;
  var locationOptions =
      LocationOptions(accuracy: LocationAccuracy.high, distanceFilter: 10);
  int selectedIndex = 0;

  @override
  void initState() {
    super.initState();
    getLocation();
  }

  Future<void> getLocation() async {
    GeolocationStatus geolocationStatus =
        await Geolocator().checkGeolocationPermissionStatus();
    print(geolocationStatus.value);
    if (geolocationStatus.value == 2) {
      StreamSubscription<Position> positionStream = geolocator
          .getPositionStream(locationOptions)
          .listen((Position position) {
        positionActual = position;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        Text("Localidade"),
        SizedBox(
          width: 10,
        ),
        Container(
          height: 300,
          width: 250,
          child: PlatformMap(
            initialCameraPosition: CameraPosition(
              target: LatLng(-23.494124, -46.8388004),
              zoom: 16.0,
            ),
            markers: Set<Marker>.of(
              [
                Marker(
                  markerId: MarkerId('marker_1'),
                  position: LatLng(-23.494124, -46.8388004),
                  consumeTapEvents: true,
                  infoWindow: InfoWindow(
                    title: 'PlatformMarker',
                    snippet: "Hi I'm a Platform Marker",
                  ),
                  onTap: () {
                    print("Marker tapped");
                  },
                ),
              ],
            ),
            // mapType: MapType.normal,
            myLocationEnabled: true,
            myLocationButtonEnabled: true,
            onTap: (location) => print('onTap: $location'),
            onCameraMove: (cameraUpdate) =>
                print('onCameraMove: $cameraUpdate'),
            compassEnabled: true,
            onMapCreated: (controller) {
              Future.delayed(Duration(seconds: 2)).then(
                (_) {
                  controller.animateCamera(
                    CameraUpdate.newCameraPosition(
                      CameraPosition(
                        bearing: 270.0,
                        target: LatLng(-23.494124, -46.8388004),
                        tilt: 30.0,
                        zoom: 18,
                      ),
                    ),
                  );
                  // controller.getVisibleRegion().then(
                  //     (bounds) => print("bounds: ${bounds.toString()}"));
                },
              );
            },
          ),
        ),
      ],
    );
  }
}
