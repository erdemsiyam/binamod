import 'package:binamod/pages/home/home_page.dart';
import 'package:binamod/pages/login/login_page.dart';
import 'package:binamod/providers/auth_provider.dart';
import 'package:binamod/providers/home_provider.dart';
import 'package:binamod/providers/login_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        fontFamily: 'Josefin',
      ),
      home: ChangeNotifierProvider<AuthProvider>(
        create: (_) => AuthProvider(),
        child: MainPage(),
      ),
    );
  }
}

class MainPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    AuthProvider _authProvider = Provider.of<AuthProvider>(context);
    // Fake
    return ChangeNotifierProvider<HomeProvider>(
      create: (_) => HomeProvider(),
      child: HomePage(),
    );
    // Real
    switch (_authProvider.authEnum) {
      case AuthEnum.NOT:
        return ChangeNotifierProvider<LoginProvider>(
          create: (_) => LoginProvider(),
          child: LoginPage(),
        );
      case AuthEnum.DONE:
        return ChangeNotifierProvider<HomeProvider>(
          create: (_) => HomeProvider(),
          child: HomePage(),
        );
    }
  }
}
