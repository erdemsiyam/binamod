import 'dart:convert';

import 'package:flutter/material.dart';

class UserResponseModel {
  int httpStatus;
  String detail;
  String refresh;
  String access;
  UserResponseModel.success({
    @required this.httpStatus,
    @required String source,
  }) {
    Map<String, dynamic> map = json.decode(source);
    this.refresh = map['refresh'];
    this.access = map['access'];
  }
  UserResponseModel.wrong({
    @required this.httpStatus,
    @required String source,
  }) {
    Map<String, dynamic> map = json.decode(source);
    this.detail = map['detail'];
  }
}
