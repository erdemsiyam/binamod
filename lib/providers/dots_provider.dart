import 'package:binamod/pages/packet2/enum/answer_enum.dart';
import 'package:binamod/pages/packet2/enum/seen_enum.dart';
import 'package:flutter/material.dart';

class DotsProvider with ChangeNotifier {
  int selectedIndex = 0;
  List<SeenState> seenStates = [];
  List<AnswerState> answerStates = [];

  void updateDots(
      int index, List<SeenState> seenStates, List<AnswerState> answerStates) {
    this.selectedIndex = index;
    this.seenStates = seenStates;
    this.answerStates = answerStates;
    notifyListeners();
  }
}
