import 'package:binamod/api/user_service.dart';
import 'package:binamod/model/packet2_request_model.dart';
import 'package:binamod/model/packet2_response_model.dart';
import 'package:flutter/material.dart';

enum Packet2State { INIT, LOADING, FAIL, DONE }

class Packet2Provider with ChangeNotifier {
  Packet2State _packet2state = Packet2State.INIT;
  Packet2ResponseModel packet2responseModel;
  set packet2State(val) {
    if (val != _packet2state) {
      _packet2state = val;
      notifyListeners();
    }
  }

  Packet2State get packet2State => _packet2state;

  Future<void> sendQualityAnswers({
    double longitude,
    double latitude,
    int age,
    int floors,
    int height,
    bool corrosion,
    int area,
    bool shop,
    bool contiguous,
  }) async {
    packet2State = Packet2State.LOADING;
    packet2responseModel = null;
    packet2responseModel = await UserService().packet2Request(
      Packet2RequestModel(
        longitude: longitude,
        latitude: latitude,
        age: age,
        floors: floors,
        height: height,
        corrosion: corrosion,
        area: area,
        shop: shop,
        contiguous: contiguous,
      ),
    );
    if (packet2responseModel == null) {
      packet2State = Packet2State.FAIL;
    }
    switch (packet2responseModel.httpStatus) {
      case 200:
        packet2State = Packet2State.DONE;
        return;
      default:
        packet2State = Packet2State.FAIL;
    }
  }

  void reset() {
    packet2State = Packet2State.INIT;
    packet2responseModel = null;
  }
}
