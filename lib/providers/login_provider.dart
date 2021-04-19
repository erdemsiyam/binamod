import 'package:binamod/api/user_service.dart';
import 'package:binamod/model/user_request_model.dart';
import 'package:binamod/model/user_response_model.dart';
import 'package:flutter/material.dart';

enum LoginState { INIT, LOADING, WRONG_PASSWORD, SERVER_ERROR, DONE }

class LoginProvider with ChangeNotifier {
  LoginState _loginState = LoginState.INIT;
  String username;
  String password;
  set loginState(val) {
    if (val != _loginState) {
      _loginState = val;
      notifyListeners();
    }
  }

  get loginState => _loginState;

  Future<bool> login() async {
    loginState = LoginState.LOADING;
    UserResponseModel userResponseModel = await UserService().login(
      UserRequestModel(
        username: this.username,
        password: this.password,
      ),
    );
    if (userResponseModel == null) {
      loginState = LoginState.SERVER_ERROR;
      return false;
    }
    switch (userResponseModel.httpStatus) {
      case 200:
        loginState = LoginState.DONE;
        return true;
      case 400:
      case 401:
        loginState = LoginState.WRONG_PASSWORD;
        return false;
      default:
        loginState = LoginState.SERVER_ERROR;
        return false;
    }
  }
}
