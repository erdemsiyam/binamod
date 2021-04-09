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

  Future<void> sendQualityAnswers() async {
    // TODO scevaplar gider
    packet2State = Packet2State.LOADING;
    // packet2responseModel = await UserService().packet2Request(Packet2RequestModel());
    // switch (packet2responseModel.httpStatus) {
    //   case 200:
    //     packet2State = Packet2State.DONE;
    //     return;
    //   default:
    //    packet2State = Packet2State.FAIL;
    //     return;
    // }
  }
}
