import 'dart:convert';

import 'package:flutter/material.dart';

enum ResultState { INIT, LOW_RISK, MEDIUM_RISK, HIGH_RISK, VERY_HIGH_RISK }

class Packet2ResponseModel {
  int httpStatus;
  String detail;
  String resultText;
  ResultState result;
  Packet2ResponseModel.success({
    @required this.httpStatus,
    @required String source,
  }) {
    Map<String, dynamic> map = json.decode(source);
    this.resultText = map['resultText'];
    switch (map['result']) {
      case 'LOW_RISK':
        this.result = ResultState.LOW_RISK;
        break;
      case 'MEDIUM_RISK':
        this.result = ResultState.MEDIUM_RISK;
        break;
      case 'HIGH_RISK':
        this.result = ResultState.HIGH_RISK;
        break;
      case 'VERY_HIGH_RISK':
        this.result = ResultState.VERY_HIGH_RISK;
        break;
      default:
        this.result = ResultState.INIT;
    }
  }
  Packet2ResponseModel.wrong({
    @required this.httpStatus,
    @required String source,
  }) {
    Map<String, dynamic> map = json.decode(source);
    this.detail = map['detail'];
  }
}
