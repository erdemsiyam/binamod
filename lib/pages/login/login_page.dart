import 'package:binamod/pages/login/widget/error_widget.dart';
import 'package:binamod/pages/login/widget/init_widget.dart';
import 'package:binamod/providers/auth_provider.dart';
import 'package:binamod/providers/login_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class LoginPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Column(
            children: [
              Text('Login'),
              Consumer<LoginProvider>(
                builder: (context, loginProvider, child) {
                  switch (loginProvider.loginEnum) {
                    case LoginEnum.INIT:
                      return InitWidget();
                    case LoginEnum.LOADING:
                      return CircularProgressIndicator();
                    case LoginEnum.WRONG_PASSWORD:
                      return LoginErrorWidget(errorMessage: 'Wrong Password');
                    case LoginEnum.SERVER_ERROR:
                      return LoginErrorWidget(errorMessage: 'Server Error');
                    case LoginEnum.DONE:
                      return Icon(Icons.done);
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
