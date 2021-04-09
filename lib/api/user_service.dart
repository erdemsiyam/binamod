import 'package:binamod/model/packet2_response_model.dart';
import 'package:binamod/model/user_response_model.dart';

class UserService {
  /* Singleton */
  static UserService _userService;
  UserService._internal();
  factory UserService() {
    if (_userService == null) _userService = UserService._internal();
    return _userService;
  }

  /* Properties */
  UserResponseModel userResponseModel;

  Future<UserResponseModel> login() async {
    /* fake */
    await Future.delayed(Duration(seconds: 1));
    userResponseModel = UserResponseModel();
    userResponseModel.httpStatus = 200;
    userResponseModel.detail = "detail";
    userResponseModel.access = "XXX";
    userResponseModel.refresh = "YYY";

    return userResponseModel;
  }

  reToken() {}
  packet1Request() {}
  Future<Packet2ResponseModel> packet2Request() async {
    // TODO paket 2 isteği
    //
    /* fake */
    await Future.delayed(Duration(seconds: 1));
    return Packet2ResponseModel(
      httpStatus: 200,
      result: ResultState.HIGH_RISK,
      resultText: 'Binanıza X kadar ton ağırlığı uygulanmaktadır',
    );
  }
}
