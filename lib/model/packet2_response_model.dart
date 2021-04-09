import 'dart:convert';

import 'package:flutter/material.dart';

enum ResultState { INIT, LOW_RISK, MEDIUM_RISK, HIGH_RISK, VERY_HIGH_RISK }

class Packet2ResponseModel {
  int httpStatus;
  String detail;
  String resultText;
  ResultState result;
  Packet2ResponseModel({
    this.httpStatus,
    this.detail,
    this.resultText,
    this.result,
  });

  Packet2ResponseModel copyWith({
    int httpStatus,
    String detail,
    String resultText,
    String result,
  }) {
    return Packet2ResponseModel(
      httpStatus: httpStatus ?? this.httpStatus,
      detail: detail ?? this.detail,
      resultText: resultText ?? this.resultText,
      result: result ?? this.result,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'httpStatus': httpStatus,
      'detail': detail,
      'resultText': resultText,
      'result': result,
    };
  }

  factory Packet2ResponseModel.fromMap(Map<String, dynamic> map) {
    return Packet2ResponseModel(
      httpStatus: map['httpStatus'],
      detail: map['detail'],
      resultText: map['resultText'],
      result: map['result'],
    );
  }

  String toJson() => json.encode(toMap());

  factory Packet2ResponseModel.fromJson(String source) =>
      Packet2ResponseModel.fromMap(json.decode(source));

  @override
  String toString() {
    return 'Packet2ResponseModel(httpStatus: $httpStatus, detail: $detail, resultText: $resultText, result: $result)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is Packet2ResponseModel &&
        other.httpStatus == httpStatus &&
        other.detail == detail &&
        other.resultText == resultText &&
        other.result == result;
  }

  @override
  int get hashCode {
    return httpStatus.hashCode ^
        detail.hashCode ^
        resultText.hashCode ^
        result.hashCode;
  }
}
