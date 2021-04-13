import 'package:binamod/pages/login/widget/login_error_widget.dart';
import 'package:binamod/pages/login/widget/login_loading_widget.dart';
import 'package:binamod/pages/login/widget/login_widget.dart';
import 'package:binamod/pages/login/widget/mail_text_widget.dart';
import 'package:binamod/pages/login/widget/password_text_widget.dart';
import 'package:binamod/providers/login_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:binamod/utils/context_extension.dart';

class LoginPage extends StatelessWidget {
  LoginProvider _loginProvider;
  @override
  Widget build(BuildContext context) {
    _loginProvider = Provider.of<LoginProvider>(context);
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  Colors.white,
                  Colors.grey[100],
                  Colors.white,
                ],
                begin: const FractionalOffset(0.0, 0.0),
                end: const FractionalOffset(1.0, 1.0),
                stops: [0.0, 0.5, 1.0],
                tileMode: TileMode.clamp,
              ),
            ),
            child: SizedBox(
              height: context.dynamicHeight(0.9),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                mainAxisSize: MainAxisSize.max,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  topLogoWidget(context),
                  sayingWidget(context),
                  MailTextWidget(),
                  PasswordTextWidget(),
                  dynamicPart(),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  // print(context.dynamicWidth(1)); // 411
  // print(context.dynamicHeight(1)); // 820
  Widget topLogoWidget(BuildContext context) {
    final String icon1Path = 'asset/images/auth/cloud3.svg';
    final String icon2Path = 'asset/images/auth/building1.svg';
    final String icon3Path = 'asset/images/auth/cloud1.svg';
    final String icon1Label = 'Cloud1';
    final String icon2Label = 'Building';
    final String icon3Label = 'Cloud2';
    return Stack(
      alignment: Alignment.center,
      children: [
        Container(),
        Positioned(
          left: context.dynamicShortest(0.24), //fit(80, 100, 130, 230),
          top: -context.dynamicShortest(0.024), //fit(-10, -10, -10, 0),
          child: SvgPicture.asset(
            icon1Path,
            semanticsLabel: icon1Label,
            width: context.dynamicShortest(0.267), //fit(80, 110, 140, 150),
          ),
        ),
        SvgPicture.asset(
          icon2Path,
          semanticsLabel: icon2Label,
          width: context.dynamicShortest(0.4), //fit(120, 160, 230, 240),
        ),
        Positioned(
          right: context.dynamicShortest(0.146), //fit(60, 60, 80, 160),
          top: -context.dynamicShortest(0.024),
          child: SvgPicture.asset(
            icon3Path,
            semanticsLabel: icon3Label,
            width: context.dynamicShortest(0.292), // fit(80, 120, 150, 180),
          ),
        ),
      ],
    );
  }

  Widget sayingWidget(BuildContext context) {
    final String title = 'Hayatın Değerli.';
    final String subTitle =
        'Sevdikleriniz ile birlikte daha fazla vakit gerçimeniz için çalışıyoruz...';
    return Column(
      children: [
        Text(
          title,
          textAlign: TextAlign.center,
          style: context.theme.textTheme.headline4.copyWith(
            color: Colors.black87,
          ),
        ),
        Padding(
          padding: EdgeInsets.symmetric(
            horizontal: context.dynamicShortest(0.1), //fit(50, 50, 80, 180),
            vertical: context.mediumValue,
          ),
          child: Text(
            subTitle,
            textAlign: TextAlign.center,
            style: context.theme.textTheme.caption.copyWith(
              fontSize: context.dynamicShortest(0.035),
            ),
          ),
        ),
      ],
    );
  }

  Widget dynamicPart() {
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
  }
}
