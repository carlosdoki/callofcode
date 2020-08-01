import 'dart:async';

import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:helpcare/constants.dart';
import 'package:helpcare/models/incidentes.dart';
import 'package:helpcare/size_config.dart';
import 'package:platform_maps_flutter/platform_maps_flutter.dart';

class Body extends StatefulWidget {
  Body({Key key}) : super(key: key);

  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  bool _disponivel = false;
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
    SizeConfig().init(context);

    return Container(
      child: Column(
        children: <Widget>[
          Container(
            color: Color(0xFF2296F3),
            child: Row(
              children: <Widget>[
                Text("Ola"),
                Spacer(),
                Container(
                  child: Switch(
                    value: _disponivel,
                    onChanged: (value) {
                      setState(
                        () {
                          _disponivel = value;
                          print(_disponivel);
                        },
                      );
                    },
                    activeColor: Colors.green,
                  ),
                ),
              ],
            ),
          ),
          Container(
            // width: 300
            height: SizeConfig.screenHeight - 350,
            // color: Colors.red,
            child: PlatformMap(
              initialCameraPosition: CameraPosition(
                target:
                    LatLng(positionActual.latitude, positionActual.longitude),
                zoom: 16.0,
              ),
              markers: Set<Marker>.of(
                [
                  Marker(
                    markerId: MarkerId('marker_1'),
                    position: LatLng(47.6, 8.8796),
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
                          target: LatLng(positionActual.latitude,
                              positionActual.longitude),
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
          Padding(
            padding: EdgeInsets.symmetric(
              vertical: SizeConfig.defaultSize * 2,
            ),
            child: SizedBox(
              height: SizeConfig.defaultSize * 6.5,
              child: Container(
                color: Colors.white,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: incidentes.length,
                  itemBuilder: (context, index) => buildCategoriesItem(index),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: <Widget>[
                RaisedButton(
                  elevation: 5.0,
                  onPressed: () {
                    // Navigator.push(
                    //   context,
                    //   MaterialPageRoute(
                    //       builder: (context) => HomeScreen()),
                    // );
                  },
                  padding: EdgeInsets.only(
                    left: 30.0,
                    top: 10.0,
                    bottom: 10.0,
                    right: 30.0,
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30.0),
                  ),
                  color: kTextColor,
                  child: Text(
                    'Aceitar',
                    style: TextStyle(
                      color: Colors.white,
                      letterSpacing: 1.5,
                      fontSize: 18.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Spacer(),
                RaisedButton(
                  elevation: 5.0,
                  onPressed: () {
                    // Navigator.push(
                    //   context,
                    //   MaterialPageRoute(
                    //       builder: (context) => HomeScreen()),
                    // );
                  },
                  padding: EdgeInsets.only(
                    left: 30.0,
                    top: 10.0,
                    bottom: 10.0,
                    right: 30.0,
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30.0),
                  ),
                  color: Colors.red,
                  child: Text(
                    'Recusar',
                    style: TextStyle(
                      color: Colors.white,
                      letterSpacing: 1.5,
                      fontSize: 18.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget buildCategoriesItem(int index) {
    return GestureDetector(
      onTap: () {
        setState(() {
          selectedIndex = index;
        });
      },
      child: Container(
        margin: EdgeInsets.only(left: SizeConfig.defaultSize * 2),
        padding: EdgeInsets.symmetric(
            horizontal: SizeConfig.defaultSize * 2,
            vertical: SizeConfig.defaultSize * 0.5),
        decoration: BoxDecoration(
            color:
                selectedIndex == index ? Color(0xFFEFF3EE) : Colors.transparent,
            borderRadius: BorderRadius.circular(
              SizeConfig.defaultSize * 0.5,
            )),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          textDirection: TextDirection.ltr,
          children: <Widget>[
            Row(
              children: <Widget>[
                Text(
                  incidentes[index].title,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: selectedIndex == index
                        ? kPrimaryColor
                        : Color(0xFFC2C2B5),
                  ),
                ),
                SizedBox(
                  width: 20.0,
                ),
                Text(
                  "Dist.: 2 km",
                  style: TextStyle(
                    fontSize: 10.0,
                    color: selectedIndex == index
                        ? kPrimaryColor
                        : Color(0xFFC2C2B5),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: SizeConfig.defaultSize / 2,
            ),
            Text(
              incidentes[index].description,
              style: TextStyle(
                fontSize: 12.0,
                color:
                    selectedIndex == index ? kPrimaryColor : Color(0xFFC2C2B5),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
