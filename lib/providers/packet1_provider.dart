import 'package:binamod/api/user_service.dart';
import 'package:binamod/model/packet1_request_model.dart';
import 'package:binamod/model/packet1_response_model.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

enum Packet1State { INIT, LOADING, FAIL, DONE }

class Packet1Provider with ChangeNotifier {
  LatLng lastLocation;
  Packet1State _packet1state = Packet1State.INIT;
  Packet1ResponseModel packet1responseModel;
  set packet1State(val) {
    if (val != _packet1state) {
      _packet1state = val;
      notifyListeners();
    }
  }

  Packet1State get packet1State => _packet1state;

  Future<Packet1ResponseModel> requestLocation({
    @required LatLng latLng,
  }) async {
    packet1State = Packet1State.LOADING;
    packet1responseModel = null;
    packet1responseModel = await UserService().packet1Request(
      // TODO : gerçek LatLng Verilmeli
      Packet1RequestModel(
        longitude: latLng.longitude, // 28.354234,
        latitude: latLng.latitude, // 38.07,
      ),
    );
    if (packet1responseModel == null) {
      packet1State = Packet1State.FAIL;
    }
    switch (packet1responseModel.httpStatus) {
      case 200:
        packet1State = Packet1State.DONE;
        break;
      default:
        packet1State = Packet1State.FAIL;
    }
    return packet1responseModel;
  }
}
