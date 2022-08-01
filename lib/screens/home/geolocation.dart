// ignore_for_file: use_build_context_synchronously
import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart'; // Suitable for most situations
// ignore: depend_on_referenced_packages
import 'package:latlong2/latlong.dart';

import 'package:url_launcher/url_launcher.dart';
import 'package:memoria/widgets/starter_design.dart';
import 'package:location/location.dart';

List<Map<String, dynamic>> savedPlaces = [
  {'name': 'Sharat\'s Home', 'lat': 10.02787, 'lon': 76.32965},
  {'name': 'Nikita\'s Home', 'lat': 26.16816, 'lon': 77.97210},
  {'name': 'Govt. Hospital', 'lat': 10.05261, 'lon': 76.35560},
  {'name': 'Nayana\'s Home', 'lat': 54.9, 'lon': 34.9},
];

class Geolocation extends StatefulWidget {
  const Geolocation({Key? key}) : super(key: key);

  @override
  State<Geolocation> createState() => _GeolocationState();
}

class _GeolocationState extends State<Geolocation> {
  late LocationData currentCoordinates;
  double selectedLatitude = 10.026098218386911;
  double selectedLongitude = 76.326334986141765;
  late final MapController mapController;

  Future<void> _launchUrl(Uri url) async {
    if (!await launchUrl(url)) {
      throw 'Could not launch $url';
    }
  }

  getLocation() async {
    Location location = Location();
    bool serviceEnabled;
    PermissionStatus permissionGranted;

    serviceEnabled = await location.serviceEnabled();
    if (!serviceEnabled) {
      serviceEnabled = await location.requestService();
      if (!serviceEnabled) {
        return;
      }
    }

    permissionGranted = await location.hasPermission();
    if (permissionGranted == PermissionStatus.denied) {
      permissionGranted = await location.requestPermission();
      if (permissionGranted != PermissionStatus.granted) {
        return;
      }
    }

    LocationData currLocation = await location.getLocation();
    setState(() {
      currentCoordinates = currLocation;
    });
  }

  sosLocation() async {
    final Uri smsLaunchUri = Uri(
      scheme: 'sms',
      path: '+919895549782',
      queryParameters: <String, String>{
        'body':
            "Help, I'm in trouble. Reach me at location: 'https://maps.google.com/?q=${currentCoordinates.latitude},${currentCoordinates.longitude}"
      },
    );
    _launchUrl(smsLaunchUri);
  }

  @override
  void initState() {
    super.initState();
    getLocation();
    mapController = MapController();
  }

  void onSavedPlaceTileClick(
    double lat,
    double lon,
  ) {
    mapController.onReady.then((result) {
      mapController.move(LatLng(lat, lon), 18.0);
    });
    setState(() {
      selectedLatitude = lat;
      selectedLongitude = lon;
    });
  }

  @override
  Widget build(BuildContext context) {
    print(selectedLatitude);
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Stack(
              children: [
                SizedBox(
                  width: MediaQuery.of(context).size.width,
                  height: 600,
                  child: FlutterMap(
                    mapController: mapController,
                    options: MapOptions(
                        zoom: 10.2,
                        center: LatLng(selectedLatitude, selectedLongitude)),
                    layers: [
                      TileLayerOptions(
                        urlTemplate:
                            "https://tile.openstreetmap.org/{z}/{x}/{y}.png",
                        userAgentPackageName: 'com.memoria.app',
                      ),
                      MarkerLayerOptions(
                        markers: [
                          Marker(
                            point: LatLng(selectedLatitude, selectedLongitude),
                            width: 80,
                            height: 80,
                            builder: (context) => FlutterLogo(),
                          ),
                        ],
                      )
                    ],
                    nonRotatedChildren: [
                      AttributionWidget.defaultWidget(
                        source: 'OpenStreetMap contributors',
                        onSourceTapped: null,
                      ),
                    ],
                  ),
                ),
                Positioned(
                  top: 0,
                  child: StartingDesign(
                    "places",
                    "check out where you are at",
                    "home",
                  ),
                ),
                Positioned(
                  bottom: 0,
                  child: Container(
                    width: MediaQuery.of(context).size.width,
                    height: 30,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.white,
                    ),
                  ),
                ),
              ],
            ),
            Container(
              margin: EdgeInsets.only(left: 20),
              child: Text(
                "Are you feeling safe?",
                style: (TextStyle(fontSize: 20)),
              ),
            ),
            Center(
                child: ElevatedButton(
                    onPressed: () async {
                      sosLocation();
                    },
                    child: Text('Send Emergency SOS'))),
            // Center(
            // child: ElevatedButton(
            //     onPressed: () async {
            //       LocationData currLocation = await location.getLocation();
            //       onSavedPlaceTileClick(
            //           currLocation.latitude, currLocation.longitude);
            //     },
            //     child: Text('View current location in Map'))),
            SizedBox(
              height: 30,
            ),
            Container(
              width: double.infinity,
              padding: EdgeInsets.symmetric(vertical: 15),
              margin: EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: Color.fromARGB(255, 210, 208, 208),
                borderRadius: BorderRadius.circular(10),
              ),
              child: ElevatedButton(
                onPressed: () {
                  mapController.onReady.then((result) {
                    mapController.move(LatLng(4, 8), 18.0);
                  });
                  setState(() {
                    selectedLatitude = 4;
                    selectedLongitude = 8;
                  });
                },
                child: Text(
                  "HOME",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 18,
                    color: Colors.black,
                  ),
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.only(left: 20),
              child: Text(
                "SAVED PLACES",
                style: (TextStyle(fontSize: 20)),
              ),
            ),
            ListView.builder(
              scrollDirection: Axis.vertical,
              shrinkWrap: true,
              itemCount: savedPlaces.length,
              itemBuilder: ((context, index) => SavedPlace(
                  savedPlaces[index]['name'],
                  savedPlaces[index]['lat'],
                  savedPlaces[index]['lon'],
                  onSavedPlaceTileClick)),
            )
            // SavedPlace("NIKITA"),
          ],
        ),
      ),
    );
  }
}

class SavedPlace extends StatelessWidget {
  late String PlaceName;
  late double latitude;
  late double longitude;
  late Function onClickFunc;

  SavedPlace(String PN, double lat, double lon, Function onClick, {Key? key})
      : super(key: key) {
    PlaceName = PN;
    latitude = lat;
    longitude = lon;
    onClickFunc = onClick;
  }

  handleOnPressed() {
    onClickFunc(latitude, longitude);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(vertical: 15),
      margin: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      decoration: BoxDecoration(
        color: Color.fromARGB(255, 210, 208, 208),
        borderRadius: BorderRadius.circular(5),
      ),
      child: ElevatedButton(
        onPressed: handleOnPressed,
        child: Text(
          PlaceName,
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 18,
            color: Colors.black,
          ),
        ),
      ),
    );
  }
}
