import 'package:binamod/model/user_response_model.dart';

class UserService {
  static UserService _userService;
  UserService._internal();
  static UserResponseModel userResponseModel;

  static Future<UserResponseModel> login() async {
    /* fake */
    await Future.delayed(Duration(seconds: 1));
    userResponseModel = UserResponseModel();
    userResponseModel.httpStatus = 200;
    userResponseModel.detail = "detail";
    userResponseModel.access = "XXX";
    userResponseModel.refresh = "YYY";

    return userResponseModel;
  }

  static reToken() {}
  static packet1Request() {}
  static packet2Request() {}
}
