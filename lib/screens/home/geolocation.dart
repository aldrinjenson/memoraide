// ignore_for_file: use_build_context_synchronously
import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart'; // Suitable for most situations
// import 'package:google_maps_flutter/google_maps_flutter.dart';
// ignore: depend_on_referenced_packages
import 'package:latlong2/latlong.dart';
import 'package:path/path.dart';
// import 'package:google_maps_flutter/google_maps_flutter.dart';
// ignore: depend_on_referenced_packages
// import 'package:latlong2/latlong.dart' as latLng;
// import 'package:latlong2/latlong.dart' as latLng;

import 'package:url_launcher/url_launcher.dart';
import 'package:memoria/widgets/starter_design.dart';
import 'package:location/location.dart';

class Geolocation extends StatefulWidget {
  const Geolocation({Key? key}) : super(key: key);

  @override
  State<Geolocation> createState() => _GeolocationState();
}

class _GeolocationState extends State<Geolocation> {
  late LocationData currentCoordinates;
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
      path: '919895549782',
      queryParameters: <String, String>{
        // 'body': Uri.encodeComponent('Example Subject & Symbols are allowed!'),
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
  }

  @override
  Widget build(BuildContext context) {
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
                    options: MapOptions(
                      zoom: 10.2,
                      center: LatLng(10.026098218386911, 76.32633486141765),
                    ),
                    layers: [
                      TileLayerOptions(
                        urlTemplate:
                            "https://tile.openstreetmap.org/{z}/{x}/{y}.png",
                        userAgentPackageName: 'com.memoria.app',
                      ),
                    ],
                    nonRotatedChildren: [
                      AttributionWidget.defaultWidget(
                        source: 'OpenStreetMap contributors',
                        onSourceTapped: null,
                      ),
                    ],
                  ),
                  // Image(
                  //   image: AssetImage("assets/Maps.png"),
                  // ),
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
                      // image: DecorationImage(
                      //   image: AssetImage(
                      //     "frame.png",
                      //   ),
                      //   fit: BoxFit.fill,
                      // ),
                    ),
                  ),
                ),
              ],
            ),
            Container(
              margin: EdgeInsets.only(left: 20),
              child: Text(
                "YOU'RE CURRENTLY AT",
                style: (TextStyle(fontSize: 20)),
              ),
            ),
            Container(
              width: double.infinity,
              padding: EdgeInsets.symmetric(vertical: 15),
              margin: EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: Color.fromARGB(255, 210, 208, 208),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Text(
                "HOME",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 18,
                  color: Colors.black,
                ),
              ),
            ),
            Center(
                child: ElevatedButton(
                    onPressed: () async {
                      sosLocation();
                    },
                    child: Text('Send Emergency SOS'))),
            SizedBox(
              height: 30,
            ),
            Container(
              margin: EdgeInsets.only(left: 20),
              child: Text(
                "SAVED PLACES",
                style: (TextStyle(fontSize: 20)),
              ),
            ),
            SavedPlace("SHARAT"),
            SavedPlace("ALDRIN"),
            SavedPlace("NAYANA"),
            SavedPlace("ANJALI"),
            SavedPlace("NIKITA"),

            // GoogleMap(
            //   onMapCreated: _onMapCreated,
            //   initialCameraPosition: CameraPosition(
            //     target: _center,
            //     zoom: 11.0,
            //   ),
            // ),
          ],
        ),
      ),
    );
  }
}

class SavedPlace extends StatelessWidget {
  late String PlaceName;
  SavedPlace(
    String PN, {
    Key? key,
  }) : super(key: key) {
    PlaceName = PN;
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
      child: Text(
        "$PlaceName'S HOME",
        textAlign: TextAlign.center,
        style: TextStyle(
          fontSize: 18,
          color: Colors.black,
        ),
      ),
    );
  }
}
