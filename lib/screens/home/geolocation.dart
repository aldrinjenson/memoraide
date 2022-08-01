import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:memoria/screens/home/home.dart';
import 'package:memoria/widgets/starter_design.dart';

class Geolocation extends StatefulWidget {
  const Geolocation({Key? key}) : super(key: key);

  @override
  State<Geolocation> createState() => _GeolocationState();
}

class _GeolocationState extends State<Geolocation> {
  // late GoogleMapController mapController;

  // final LatLng _center = const LatLng(45.521563, -122.677433);

  // void _onMapCreated(GoogleMapController controller) {
  //   mapController = controller;
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Stack(
              children: [
                Container(
                  width: MediaQuery.of(context).size.width,
                  height: 600,
                  child: Image(
                    image: AssetImage("assets/Maps.png"),
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
            SavedPlace("SRK"),
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
        "$PlaceName" + "'S HOME",
        textAlign: TextAlign.center,
        style: TextStyle(
          fontSize: 18,
          color: Colors.black,
        ),
      ),
    );
  }
}
