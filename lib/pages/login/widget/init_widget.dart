import 'package:binamod/pages/forgotpass/forgotpass_page.dart';
import 'package:binamod/providers/auth_provider.dart';
import 'package:binamod/providers/forgotpass_provider.dart';
import 'package:binamod/providers/login_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class InitWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    AuthProvider _authProvider =
        Provider.of<AuthProvider>(context, listen: false);

    LoginProvider _loginProvider =
        Provider.of<LoginProvider>(context, listen: false);
    return Column(
      children: [
        TextFormField(),
        TextFormField(),
        RaisedButton(
          child: Text('Login'),
          onPressed: () async {
            if (await _loginProvider.login()) {
              _authProvider.login_done();
            }
          },
        ),
        RaisedButton(
          child: Text('Change Password'),
          onPressed: () async {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (_) {
                  return ChangeNotifierProvider<ForgotpassProvider>(
                    create: (_) => ForgotpassProvider(),
                    child: ForgotpassPage(),
                  );
                },
              ),
            );
          },
        ),
      ],
    );
  }
}
