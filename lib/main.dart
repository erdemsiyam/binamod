import 'package:binamod/pages/home/home_page.dart';
import 'package:binamod/pages/login/login_page.dart';
import 'package:binamod/providers/auth_provider.dart';
import 'package:binamod/providers/home_provider.dart';
import 'package:binamod/providers/login_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:device_preview/device_preview.dart';
import 'package:binamod/utils/context_extension.dart';

void main() {
  // Provider.debugCheckInvalidValueType = null;
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MyMaterialApp();
    // return DevicePreview(
    //   enabled: true,
    //   builder: (context) => MyMaterialApp(),
    // );
  }
}

class MyMaterialApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      locale: DevicePreview.locale(context),
      builder: DevicePreview.appBuilder,
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        fontFamily: 'Josefin',
        primaryColor: Color(0xFF3889EC),
        // textTheme: textTheme(context),
      ),
      home: ChangeNotifierProvider<AuthProvider>(
        create: (_) => AuthProvider(),
        child: MainPage(),
      ),
    );
  }

  // TextTheme textTheme(BuildContext context) {
  //   return TextTheme(
  //     caption: TextStyle(fontSize: context.fontSize100),
  //     bodyText1: TextStyle(fontSize: context.fontSize200),
  //     bodyText2: TextStyle(fontSize: context.fontSize200),
  //     subtitle1: TextStyle(fontSize: context.fontSize300),
  //     subtitle2: TextStyle(fontSize: context.fontSize300),
  //     button: TextStyle(fontSize: context.fontSize500),
  //     headline6: TextStyle(fontSize: context.fontSize600),
  //     headline5: TextStyle(fontSize: context.fontSize700),
  //     headline4: TextStyle(fontSize: context.fontSize800),
  //     headline3: TextStyle(fontSize: context.fontSize900),
  //   );
  // }
}

class MainPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    AuthProvider _authProvider = Provider.of<AuthProvider>(context);
    // Fake
    // return ChangeNotifierProvider<LoginProvider>(
    //   create: (_) => LoginProvider(),
    //   child: LoginPage(),
    // );
    // return ChangeNotifierProvider<HomeProvider>(
    //   create: (_) => HomeProvider(),
    //   child: HomePage(),
    // );

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
      default:
        return Scaffold();
    }
  }
}
