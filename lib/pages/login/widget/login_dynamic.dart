import 'package:binamod/pages/login/widget/login_error_widget.dart';
import 'package:binamod/pages/login/widget/login_loading_widget.dart';
import 'package:binamod/pages/login/widget/login_widget.dart';
import 'package:binamod/providers/login_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class LoginDynamicWidget extends StatelessWidget {
  LoginProvider _loginProvider;
  @override
  Widget build(BuildContext context) {
    _loginProvider = Provider.of<LoginProvider>(context);
    switch (_loginProvider.loginState) {
      case LoginState.INIT:
        return LoginWidget();
      case LoginState.LOADING:
        return LoginLoadingWidget();
      case LoginState.WRONG_PASSWORD:
        return LoginErrorWidget(errorMessage: 'Hatalı Şifre');
      case LoginState.SERVER_ERROR:
        return LoginErrorWidget(errorMessage: 'Server Hatası');
      case LoginState.DONE:
        return LoginLoadingWidget();
      // goToQualityPage();
    }
    return Container();
  }
}
