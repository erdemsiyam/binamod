import 'package:binamod/pages/login/widget/init_widget.dart';
import 'package:flutter/material.dart';

class LoginErrorWidget extends StatelessWidget {
  final String errorMessage;
  LoginErrorWidget({@required this.errorMessage});
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        InitWidget(),
        Text('Wrong Password'),
      ],
    );
  }
}
