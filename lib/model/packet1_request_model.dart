import 'dart:convert';
import 'package:flutter/material.dart';

class Packet1RequestModel {
  double longitude;
  double latitude;

  Packet1RequestModel({
    @required this.longitude,
    @required this.latitude,
  });

  Map<String, dynamic> toMap() {
    return {
      'longitude': longitude,
      'latitude': latitude,
    };
  }

  factory Packet1RequestModel.fromMap(Map<String, dynamic> map) {
    return Packet1RequestModel(
      longitude: map['longitude'],
      latitude: map['latitude'],
    );
  }

  String toJson() => json.encode(toMap());

  factory Packet1RequestModel.fromJson(String source) =>
      Packet1RequestModel.fromMap(json.decode(source));
}
