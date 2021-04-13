import 'package:binamod/pages/home/home_page.dart';
import 'package:binamod/pages/login/login_page.dart';
import 'package:binamod/providers/auth_provider.dart';
import 'package:binamod/providers/home_provider.dart';
import 'package:binamod/providers/login_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  // Provider.debugCheckInvalidValueType = null;
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        fontFamily: 'Josefin',

        // primaryColor: Colors.blue,
        // textTheme: Theme.of(context).textTheme.apply(
        //       bodyColor: Colors.blue,
        //     ),
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
    return ChangeNotifierProvider<LoginProvider>(
      create: (_) => LoginProvider(),
      child: LoginPage(),
    );
    // Real
    switch (_authProvider.authState) {
      case AuthState.LOGIN:
        return ChangeNotifierProvider<LoginProvider>(
          create: (_) => LoginProvider(),
          child: LoginPage(),
        );
      case AuthState.DONE:
        return ChangeNotifierProvider<HomeProvider>(
          create: (_) => HomeProvider(),
          child: HomePage(),
        );
    }
  }
}
