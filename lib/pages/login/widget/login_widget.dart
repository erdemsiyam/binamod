import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class LoginWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.teal,
      child: Column(
        children: [
          forgotPasswordButton(),
          // SizedBox(height: shortestSide / 50),
          loginButton(),
          // SizedBox(height: shortestSide / 20),
          socialSeparate(),
          // SizedBox(height: shortestSide / 20),
          socialLoginButtons(),
          // SizedBox(height: shortestSide / 20),
        ],
      ),
    );
  }

  Widget forgotPasswordButton() {
    return Container(
      alignment: Alignment.centerRight,
      child: Padding(
        padding: EdgeInsets.only(
          right: 60, //fit(38, 60, 80, 100),
        ),
        child: TextButton(
          child: Text(
            "Şifremi Unuttum",
            // style: fit(
            //   tsTextButton1_350,
            //   tsTextButton1_450,
            //   tsTextButton1_550,
            //   tsTextButton1_bigest,
            // ),
          ),
          onPressed: () {
            // TODO
          },
        ),
      ),
    );
  }

  Widget loginButton() {
    return Container(
      margin: EdgeInsets.symmetric(
        horizontal: 80, //fit(60, 80, 110, 140),
        vertical: 0, //fit(0, 0, 20, 30),
      ),
      child: RaisedButton(
        padding: EdgeInsets.symmetric(
          vertical: 20, // fit(14, 20, 26, 32),
        ),
        child: Text(
          "GİRİŞ",
          // style: fit(
          //   tsButton1_350,
          //   tsButton1_450,
          //   tsButton1_550,
          //   tsButton1_bigest,
          // ),
        ),
        // color: Theme.of(context).primaryColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(60.0),
        ),
        onPressed: () async {
          // await _authProvider.login(context);
        },
      ),
    );
  }

  Widget socialSeparate() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      mainAxisSize: MainAxisSize.max,
      children: [
        Expanded(
          child: Padding(
            padding: EdgeInsets.only(
              left: 30, //fit(20, 30, 40, 50),
              right: 20, //fit(15, 20, 25, 30),
            ),
            child: Divider(
                // color: Theme.of(context).disabledColor,
                ),
          ),
        ),
        Text(
          "Sosyal Medya İle",
          textAlign: TextAlign.center,
          // style: fit(
          //   tsKucukAciklama1_350,
          //   tsKucukAciklama1_450,
          //   tsKucukAciklama1_550,
          //   tsKucukAciklama1_bigest,
          // ),
        ),
        Expanded(
          child: Padding(
            padding: EdgeInsets.only(
              right: 30, //fit(20, 30, 40, 50),
              left: 20, //fit(15, 20, 25, 30),
            ),
            child: Divider(
                // color: Theme.of(context).disabledColor,
                ),
          ),
        ),
      ],
    );
  }

  Widget socialLoginButtons() {
    double logoSize = 20;
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
        SizedBox(width: 30),
        InkWell(
          child: SvgPicture.asset(
            logoFacebook,
            semanticsLabel: labelFacebook,
            width: logoSize,
          ),
          onTap: () {
            // TODO
          },
        ),
        InkWell(
          child: SvgPicture.asset(
            logoGoogle,
            semanticsLabel: labelGoogle,
            width: logoSize,
          ),
          onTap: () {
            // TODO
          },
        ),
        InkWell(
          child: SvgPicture.asset(
            logoTwitter,
            semanticsLabel: labelTwitter,
            width: logoSize,
          ),
          onTap: () {
            // TODO
          },
        ),
        InkWell(
          child: SvgPicture.asset(
            logoLinkedin,
            semanticsLabel: labelLinkedin,
            width: logoSize,
          ),
          onTap: () {
            // TODO
          },
        ),
        SizedBox(width: 30),
      ],
    );
  }
}
