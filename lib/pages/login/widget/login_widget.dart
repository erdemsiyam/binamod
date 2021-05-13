import 'package:binamod/providers/auth_provider.dart';
import 'package:binamod/providers/login_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:binamod/utils/context_extension.dart';
import 'package:provider/provider.dart';

class LoginWidget extends StatelessWidget {
  LoginProvider loginProvider;
  AuthProvider authProvider;
  @override
  Widget build(BuildContext context) {
    loginProvider = Provider.of<LoginProvider>(context, listen: false);
    authProvider = Provider.of<AuthProvider>(context, listen: false);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      mainAxisSize: MainAxisSize.max,
      children: [
        Flexible(flex: 1, child: forgotPasswordButton(context)),
        // SizedBox(height: shortestSide / 50),
        Flexible(flex: 2, child: loginButton(context)),
        // SizedBox(height: shortestSide / 20),
        Flexible(flex: 1, child: socialSeparate(context)),
        // SizedBox(height: shortestSide / 20),
        Flexible(flex: 2, child: socialLoginButtons(context)),
        // SizedBox(height: shortestSide / 20),
      ],
    );
  }

  Widget forgotPasswordButton(BuildContext context) {
    return Container(
      alignment: Alignment.centerRight,
      child: Padding(
        padding: EdgeInsets.only(
          right: context.dynamicWidth(0.146), //fit(38, 60, 80, 100),
        ),
        child: TextButton(
          child: Text(
            "Şifremi Unuttum",
            style: context.theme.textTheme.bodyText2.copyWith(
              fontSize: context.dynamicShortest(0.034),
              color: Colors.grey[700],
            ),
          ),
          onPressed: () {
            // TODO şifre unuttum
          },
        ),
      ),
    );
  }

  Widget loginButton(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(
        horizontal: context.dynamicWidth(0.2), //fit(60, 80, 110, 140),
        // vertical: 0, //fit(0, 0, 20, 30),
      ),
      child: RaisedButton(
        padding: EdgeInsets.symmetric(
          vertical: context.dynamicHeight(0.024), // fit(14, 20, 26, 32),
        ),
        child: Text(
          "GİRİŞ",
          style: context.theme.textTheme.subtitle1.copyWith(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: context.dynamicShortest(0.04),
          ),
        ),
        color: Theme.of(context).primaryColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(context.dynamicHeight(0.061)),
        ),
        onPressed: () async {
          loginProvider.login().then(
            (value) {
              if (value) {
                authProvider.authState = AuthState.DONE;
              }
            },
          );
        },
      ),
    );
  }

  Widget socialSeparate(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      mainAxisSize: MainAxisSize.max,
      children: [
        Expanded(
          child: Padding(
            padding: EdgeInsets.only(
              left: context.dynamicWidth(0.075), //fit(20, 30, 40, 50),
              right: context.dynamicWidth(0.05), //fit(15, 20, 25, 30),
            ),
            child: Divider(
              color: Colors.grey[700],
            ),
          ),
        ),
        Text(
          "Sosyal Medya İle",
          textAlign: TextAlign.center,
          style: context.theme.textTheme.bodyText1.copyWith(
            color: Colors.grey[400],
            fontWeight: FontWeight.bold,
            fontSize: context.dynamicShortest(0.033),
          ),
        ),
        Expanded(
          child: Padding(
            padding: EdgeInsets.only(
              right: context.dynamicWidth(0.075), //fit(20, 30, 40, 50),
              left: context.dynamicWidth(0.05), //fit(15, 20, 25, 30),
            ),
            child: Divider(
              color: Colors.grey[700],
            ),
          ),
        ),
      ],
    );
  }

  Widget socialLoginButtons(BuildContext context) {
    final String logoFacebook = 'asset/images/auth/facebook.svg';
    final String logoGoogle = 'asset/images/auth/google.svg';
    final String logoTwitter = 'asset/images/auth/twitter.svg';
    final String logoLinkedin = 'asset/images/auth/linkedin.svg';
    final String labelFacebook = 'Facebook Login';
    final String labelGoogle = 'Google Login';
    final String labelTwitter = 'Twitter Login';
    final String labelLinkedin = 'Linkedin Login';
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      mainAxisSize: MainAxisSize.max,
      children: [
        context.emptyWidgetWidthHigh,
        iconButton(context, logoFacebook, labelFacebook, () {}),
        iconButton(context, logoGoogle, labelGoogle, () {}),
        // iconButton(context, logoTwitter, labelTwitter, () {}),
        // iconButton(context, logoLinkedin, labelLinkedin, () {}),
        context.emptyWidgetWidthHigh,
      ],
    );
  }

  Widget iconButton(
    BuildContext context,
    String logoLinkedin,
    String labelLinkedin,
    Function onTap,
  ) {
    return Flexible(
      flex: 1,
      child: InkWell(
        child: SvgPicture.asset(
          logoLinkedin,
          semanticsLabel: labelLinkedin,
          width: context.dynamicWidth(0.1),
        ),
        onTap: onTap,
      ),
    );
  }
}
