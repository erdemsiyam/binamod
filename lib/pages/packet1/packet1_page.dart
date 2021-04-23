import 'package:binamod/pages/packet1/widget/bottom_sheet_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import 'package:binamod/utils/context_extension.dart';

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
  double pointerSize;
  double screenX, screenY;
  GoogleMapController mapController;

  @override
  Widget build(BuildContext context) {
    pointerSize = context.dynamicShortest(0.292);
    screenX = context.dynamicWidth(1);
    screenY = context.dynamicHeight(1);
    return Scaffold(
      body: SafeArea(
        child: Stack(
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
              top: (screenY / 2) - (pointerSize / 2),
              left: (screenX / 2) - (pointerSize / 2),
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
              bottom: context.dynamicHeight(0.025),
              left: context.dynamicWidth(0.171),
              right: context.dynamicWidth(0.171),
              child: ElevatedButton(
                child: Padding(
                  padding: EdgeInsets.all(context.dynamicHeight(0.016)),
                  child: Text(
                    'Deprem Tehlikesi',
                    style: context.theme.textTheme.button.copyWith(
                      color: Colors.blue[600],
                      fontWeight: FontWeight.bold,
                      fontSize: context.dynamicShortest(0.033),
                    ),
                  ),
                ),
                style: ElevatedButton.styleFrom(
                  primary: Colors.white,
                  textStyle: context.theme.textTheme.subtitle1.copyWith(
                    color: Colors.white,
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(
                      context.dynamicWidth(0.049),
                    ),
                  ),
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
              ),
            ),
            Positioned(
              top: screenY * 0.75,
              right: screenX * 0.01,
              child: MaterialButton(
                onPressed: () {
                  getCurrentLocation();
                },
                color: Colors.white,
                textColor: Colors.white,
                child: Icon(
                  Icons.my_location,
                  size: context.dynamicShortest(0.078),
                  color: Colors.grey[800],
                ),
                padding: EdgeInsets.all(context.dynamicShortest(0.0292)),
                shape: CircleBorder(),
              ),
            ),
          ],
        ),
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
