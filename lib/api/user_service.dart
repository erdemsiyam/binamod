import 'dart:convert';
import 'dart:io';

import 'package:binamod/model/packet1_request_model.dart';
import 'package:binamod/model/packet1_response_model.dart';
import 'package:binamod/model/packet2_request_model.dart';
import 'package:binamod/model/packet2_response_model.dart';
import 'package:binamod/model/user_request_model.dart';
import 'package:binamod/model/user_response_model.dart';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';

class UserService {
  /* Singleton */
  static UserService _userService;
  UserService._internal();
  factory UserService() {
    if (_userService == null) _userService = UserService._internal();
    return _userService;
  }

  /* Properties */
  String url = "https://binamod.pythonanywhere.com"; // http://10.0.2.2:8000
  UserResponseModel userResponseModel;

  /* Methods */
  Future<UserResponseModel> login(UserRequestModel userRequestModel) async {
    final headers = {HttpHeaders.contentTypeHeader: 'application/json'};
    Response response = await http.post(
      Uri.parse(url + '/api/token/'),
      headers: headers,
      body: userRequestModel.toJson(),
    );

    switch (response.statusCode) {
      case 200:
        userResponseModel = UserResponseModel.success(
          httpStatus: 200,
          source: response.body,
        );
        return userResponseModel;
      default:
        userResponseModel = UserResponseModel.wrong(
          httpStatus: response.statusCode,
          source: response.body,
        );
        return userResponseModel;
    }
  }

  reToken() {}

  Future<Packet1ResponseModel> packet1Request(
      Packet1RequestModel packet1requestModel) async {
    Packet1ResponseModel packet1responseModel;
    final headers = {
      HttpHeaders.contentTypeHeader: 'application/json; charset=utf-8',
      HttpHeaders.acceptHeader: 'application/json; charset=UTF-8',
      HttpHeaders.authorizationHeader: 'Bearer ${userResponseModel.access}',
    };
    Response response = await http.post(
      Uri.parse(url + '/api/packet1/'),
      headers: headers,
      body: packet1requestModel.toJson(),
    );
    switch (response.statusCode) {
      case 200:
        packet1responseModel = Packet1ResponseModel.success(
          httpStatus: 200,
          // gelen body byte lar?? utf8 i??in decode edilir
          source: utf8.decode(response.bodyBytes),
        );
        return packet1responseModel;
      default:
        packet1responseModel = Packet1ResponseModel.wrong(
          httpStatus: response.statusCode,
          // gelen body byte lar?? utf8 i??in decode edilir
          source: utf8.decode(response.bodyBytes),
        );
        return packet1responseModel;
    }
  }

  Future<Packet2ResponseModel> packet2Request(
      Packet2RequestModel packet2requestModel) async {
    // TODO login sayfas?? yap??lmas?? durumunda bu kald??r??lmal??
    // if (userResponseModel == null) {
    //   await UserService().login(
    //     UserRequestModel(
    //       username: 'erdem',
    //       password: '123',
    //     ),
    //   );
    // }

    Packet2ResponseModel packet2responseModel;
    final headers = {
      HttpHeaders.contentTypeHeader: 'application/json; charset=utf-8',
      HttpHeaders.acceptHeader: 'application/json; charset=UTF-8',
      HttpHeaders.authorizationHeader: 'Bearer ${userResponseModel.access}',
    };
    Response response = await http.post(
      Uri.parse(url + '/api/packet2/'),
      headers: headers,
      body: packet2requestModel.toJson(),
    );
    switch (response.statusCode) {
      case 200:
        packet2responseModel = Packet2ResponseModel.success(
          httpStatus: 200,
          // gelen body byte lar?? utf8 i??in decode edilir
          source: utf8.decode(response.bodyBytes),
        );
        return packet2responseModel;
      default:
        packet2responseModel = Packet2ResponseModel.wrong(
          httpStatus: response.statusCode,
          // gelen body byte lar?? utf8 i??in decode edilir
          source: utf8.decode(response.bodyBytes),
        );
        return packet2responseModel;
    }
  }
}

// Testing
// Future<void> main(List<String> args) async {
//   await UserService()
//       .login(
//     UserRequestModel(
//       username: 'test_user_81',
//       password: '123',
//     ),
//   )
//       .then(
//     (value) {
//       print(value.httpStatus);
//       print(value.access);
//       print(value.refresh);
//     },
//   );
//   await UserService()
//       .packet2Request(
//     Packet2RequestModel(
//         longitude: 123,
//         latitude: 123,
//         age: 1,
//         floors: 2,
//         height: 100,
//         corrosion: true,
//         area: 200,
//         shop: true,
//         contiguous: true),
//   )
//       .then(
//     (value) {
//       print(value.httpStatus);
//       print(value.result == ResultState.HIGH_RISK);
//       print(value.resultText);
//     },
//   );
// }
