import 'package:binamod/pages/packet1/widget/pointer_widget.dart';
import 'package:binamod/pages/packet1/widget/request_button_widget.dart';
import 'package:binamod/providers/packet1_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';
import 'package:binamod/utils/context_extension.dart';
import 'package:provider/provider.dart';

class Packet1Page extends StatefulWidget {
  PageController pageController;
  Packet1Page(this.pageController);
  @override
  _Packet1PageState createState() => _Packet1PageState();
}

class _Packet1PageState extends State<Packet1Page> {
  double pointerSize;
  double screenX, screenY;
  GoogleMapController mapController;
  Packet1Provider packet1provider;

  @override
  Widget build(BuildContext context) {
    packet1provider = Provider.of<Packet1Provider>(context, listen: false);
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
              child: PointerWidget(pointerSize: pointerSize),
            ),
            Positioned(
              bottom: context.dynamicHeight(0.025),
              left: context.dynamicWidth(0.171),
              right: context.dynamicWidth(0.171),
              child: RequestButtonWidget(pageController: widget.pageController),
            ),
            Positioned(
              top: screenY * 0.75,
              right: screenX * 0.01,
              child: MaterialButton(
                onPressed: () {
                  goToCurrentLocation();
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
    goToCurrentLocation();
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
    packet1provider.lastLocation = position.target;
  }

  void goToCurrentLocation() async {
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
      packet1provider.lastLocation = LatLng(
        value.latitude,
        value.longitude,
      );
      mapController.moveCamera(
        CameraUpdate.newLatLng(packet1provider.lastLocation),
      );
    });
  }
}
