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
    // return materialApp(context);
    return DevicePreview(
      enabled: true,
      builder: (context) => materialApp(context),
    );
  }

  Widget materialApp(BuildContext context) {
    return MaterialApp(
      locale: DevicePreview.locale(context),
      builder: DevicePreview.appBuilder,
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        fontFamily: 'Josefin',
        primaryColor: Color(0xFF3889EC),
        // primaryColor: Colors.blue,
        // textTheme: Theme.of(context).textTheme.apply(
        //       bodyColor: Colors.blue,
        //     ),
        textTheme: context.theme.textTheme.copyWith(
          caption: context.theme.textTheme.caption.copyWith(
            fontSize: context.fontSize100,
          ),
          bodyText1: context.theme.textTheme.bodyText1.copyWith(
            fontSize: context.fontSize200,
          ),
          bodyText2: context.theme.textTheme.bodyText2.copyWith(
            fontSize: context.fontSize200,
          ),
          subtitle1: context.theme.textTheme.subtitle1.copyWith(
            fontSize: context.fontSize300,
          ),
          subtitle2: context.theme.textTheme.subtitle2.copyWith(
            fontSize: context.fontSize300,
          ),
          button: context.theme.textTheme.button.copyWith(
            fontSize: context.fontSize500,
          ),
          headline6: context.theme.textTheme.headline6.copyWith(
            fontSize: context.fontSize600,
          ),
          headline5: context.theme.textTheme.headline5.copyWith(
            fontSize: context.fontSize700,
          ),
          headline4: context.theme.textTheme.headline4.copyWith(
            fontSize: context.fontSize800,
          ),
          headline3: context.theme.textTheme.headline3.copyWith(
            fontSize: context.fontSize900,
          ),
        ),
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
    }
  }
}
