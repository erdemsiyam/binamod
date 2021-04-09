import 'dart:convert';

import 'package:flutter/material.dart';

class Packet2RequestModel {
  double longitude;
  double latitude;
  int age;
  int floors;
  int height;
  bool corrosion;
  int area;
  bool shop;
  bool contiguous;
  Packet2RequestModel({
    @required this.longitude,
    @required this.latitude,
    @required this.age,
    @required this.floors,
    @required this.height,
    @required this.corrosion,
    @required this.area,
    @required this.shop,
    @required this.contiguous,
  });

  Map<String, dynamic> toMap() {
    return {
      'longitude': longitude,
      'latitude': latitude,
      'age': age,
      'floors': floors,
      'height': height,
      'corrosion': corrosion,
      'area': area,
      'shop': shop,
      'contiguous': contiguous,
    };
  }

  factory Packet2RequestModel.fromMap(Map<String, dynamic> map) {
    return Packet2RequestModel(
      longitude: map['longitude'],
      latitude: map['latitude'],
      age: map['age'],
      floors: map['floors'],
      height: map['height'],
      corrosion: map['corrosion'],
      area: map['area'],
      shop: map['shop'],
      contiguous: map['contiguous'],
    );
  }

  String toJson() => json.encode(toMap());

  factory Packet2RequestModel.fromJson(String source) =>
      Packet2RequestModel.fromMap(json.decode(source));
}
