import 'dart:convert';

import 'package:flutter/material.dart';

class UserRequestModel {
  String username;
  String password;
  UserRequestModel({
    @required this.username,
    @required this.password,
  });

  Map<String, dynamic> toMap() {
    return {
      'username': username,
      'password': password,
    };
  }

  factory UserRequestModel.fromMap(Map<String, dynamic> map) {
    return UserRequestModel(
      username: map['username'],
      password: map['password'],
    );
  }

  String toJson() => json.encode(toMap());

  factory UserRequestModel.fromJson(String source) =>
      UserRequestModel.fromMap(json.decode(source));
}
