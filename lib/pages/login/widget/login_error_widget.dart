import 'package:binamod/providers/login_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class LoginErrorWidget extends StatelessWidget {
  final String errorMessage;
  LoginProvider loginProvider;
  LoginErrorWidget({@required this.errorMessage});
  @override
  Widget build(BuildContext context) {
    loginProvider = Provider.of<LoginProvider>(context, listen: false);
    return Column(
      children: [
        Text(errorMessage),
        IconButton(
          icon: Icon(Icons.refresh),
          onPressed: () {
            loginProvider.loginState = LoginState.INIT;
          },
        ),
      ],
    );
  }
}
