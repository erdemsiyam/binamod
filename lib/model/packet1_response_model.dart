import 'package:flutter/material.dart';
import 'dart:convert';

enum DamageState { LOW, MEDIUM, HIGH, VERY_HIGH }

class Packet1ResponseModel {
  int httpStatus;
  String detail;
  String var1;
  String var2;
  String var3;
  String var4;
  String var5;
  String var6;
  DamageState var7;

  Packet1ResponseModel.success({
    @required this.httpStatus,
    @required String source,
  }) {
    Map<String, dynamic> map = json.decode(source);
    this.var1 = map['var1'];
    this.var2 = map['var2'];
    this.var3 = map['var3'];
    this.var4 = map['var4'];
    this.var5 = map['var5'];
    this.var6 = map['var6'];
    switch (map['var7']) {
      case 'LOW':
        this.var7 = DamageState.LOW;
        break;
      case 'MEDIUM':
        this.var7 = DamageState.MEDIUM;
        break;
      case 'HIGH':
        this.var7 = DamageState.HIGH;
        break;
      case 'VERY_HIGH':
        this.var7 = DamageState.VERY_HIGH;
        break;
    }
  }
  Packet1ResponseModel.wrong({
    @required this.httpStatus,
    @required String source,
  }) {
    Map<String, dynamic> map = json.decode(source);
    this.detail = map['detail'];
  }
}
