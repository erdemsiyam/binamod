import 'package:binamod/pages/packet1/widget/bottom_sheet_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';

class Packet1Page extends StatefulWidget {
  PageController pageController;
  Packet1Page(this.pageController);
  @override
  _Packet1PageState createState() => _Packet1PageState();
}

class _Packet1PageState extends State<Packet1Page> {
  final String mapSignLogo = 'asset/images/map_sign.svg';

  final String mapSignLabel = 'Map Sign Icon';

  Color signColor = Colors.blue;
  double pointerSize = 120;
  double screenX, screenY;
  GoogleMapController mapController;

  @override
  Widget build(BuildContext context) {
    // Screen Size
    screenX = MediaQuery.of(context).size.height;
    screenY = MediaQuery.of(context).size.width;

    return Scaffold(
      body: Stack(
        children: [
          GoogleMap(
            onMapCreated: onMapCreated,
            initialCameraPosition: CameraPosition(
              target: LatLng(41.015137, 28.979530),
              zoom: 10.0,
            ),
            // markers: [].toSet(),
            onTap: pickLocation,
            onCameraMove: _onCameraMove,
          ),
          Positioned(
            top: (screenX / 2) - (pointerSize / 2),
            left: (screenY / 2) - (pointerSize / 2),
            child: IgnorePointer(
              child: SvgPicture.asset(
                mapSignLogo,
                semanticsLabel: mapSignLabel,
                width: pointerSize,
                color: signColor,
              ),
            ),
          ),
          Positioned(
            bottom: 20,
            left: 70,
            right: 70,
            child: RaisedButton(
              color: Colors.white,
              shape: RoundedRectangleBorder(
                side: BorderSide(
                  color: Colors.white,
                ),
                borderRadius: BorderRadius.circular(20),
              ),
              onPressed: () {
                setState(() {
                  signColor = Color(0xffc6211d);
                });
                showMaterialModalBottomSheet(
                  expand: false,
                  context: context,
                  backgroundColor: Colors.transparent,
                  builder: (context) =>
                      BottomSheetWidget(widget.pageController),
                );
              },
              child: Text(
                'Deprem Tehlikesi',
                style: TextStyle(
                  color: Colors.blue,
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                ),
              ),
            ),
          ),
          Positioned(
            top: screenX * 0.75,
            right: screenY * 0.01,
            child: MaterialButton(
              onPressed: () {
                getCurrentLocation();
              },
              color: Colors.white,
              textColor: Colors.white,
              child: Icon(
                Icons.my_location,
                size: 32,
                color: Colors.grey[800],
              ),
              padding: EdgeInsets.all(12),
              shape: CircleBorder(),
            ),
          ),
        ],
      ),
    );
  }

  void onMapCreated(GoogleMapController controller) {
    setState(() {
      mapController = controller;
    });

    // Get Current Location
    getCurrentLocation();
  }

  void searchNavigate() {}

  void pickLocation(LatLng konum) {
    // setState(() {
    //   if (markers.length > 0) {
    //     markers.clear();
    //   }
    //   markers.add(Marker(position: konum, markerId: MarkerId('1')));
    // });
  }

  void _onCameraMove(CameraPosition position) {
    print(position.target.toString());
  }

  void getCurrentLocation() async {
    Location location = new Location();
    bool _serviceEnabled;
    PermissionStatus _permissionGranted;

    // Konum Açık Değilse Biter
    _serviceEnabled = await location.serviceEnabled();
    if (!_serviceEnabled) {
      _serviceEnabled = await location.requestService();
      if (!_serviceEnabled) {
        return;
      }
    }

    // İzin Yoksa Biter
    _permissionGranted = await location.hasPermission(); // izin var mı
    if (_permissionGranted == PermissionStatus.denied) {
      // izin yoksa
      _permissionGranted = await location.requestPermission(); // izin iste
      if (_permissionGranted != PermissionStatus.granted) {
        // izin verilmezse çık
        return;
      }
    }
    location.getLocation().then((value) {
      mapController.moveCamera(
        CameraUpdate.newLatLng(
          LatLng(
            value.latitude,
            value.longitude,
          ),
        ),
      );
    });
  }
}
