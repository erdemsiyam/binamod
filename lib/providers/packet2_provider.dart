import 'package:flutter/material.dart';

enum Packet2State { INIT, LOADING, FAIL, DONE }

class Packet2Provider with ChangeNotifier {
  Packet2State _packet2state = Packet2State.INIT;
  set packet2State(val) {
    if (val != _packet2state) {
      _packet2state = val;
      notifyListeners();
    }
  }

  Packet2State get packet2State => _packet2state;

  void sendQualityAnswers() {
    // TODO scevaplar gider
  }
}
