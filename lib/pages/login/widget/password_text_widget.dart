import 'package:flutter/material.dart';
import 'package:binamod/utils/context_extension.dart';

class PasswordTextWidget extends StatefulWidget {
  @override
  _PasswordTextWidgetState createState() => _PasswordTextWidgetState();
}

class _PasswordTextWidgetState extends State<PasswordTextWidget> {
  FocusNode _fs1 = FocusNode();
  bool _isPasswordHide = true;
  final String inputHint = 'Password';
  @override
  void initState() {
    super.initState();
    _fs1.addListener(() {
      setState(() {});
    });
  }

  // TODO username ile password aynı widget olamaz mı
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: context.dynamicWidth(0.09), //fit(30, 40, 60, 80),
        // vertical: 13, //fit(4, 13, 16, 20),
      ),
      child: SizedBox(
        child: TextFormField(
          cursorHeight: 20, //fit(15, 20, 25, 25),
          focusNode: _fs1,
          onChanged: (val) {
            // _authProvider.password = val;
          },
          style: (_fs1.hasFocus)
              ? context.theme.textTheme.bodyText2.copyWith(
                  color: context.theme.primaryColor,
                )
              : context.theme.textTheme.bodyText2,
          obscureText: _isPasswordHide,
          decoration: InputDecoration(
            contentPadding: EdgeInsets.symmetric(
              vertical: context.dynamicHeight(0.024), //fit(0, 20, 30, 40),
            ),
            hintText: inputHint,
            filled: true,
            fillColor: Colors.white,
            isDense: false,
            border: OutlineInputBorder(
              borderSide: BorderSide.none,
              borderRadius: BorderRadius.circular(context.dynamicHeight(0.061)),
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(
                color: Theme.of(context).primaryColor,
              ),
              borderRadius: BorderRadius.circular(context.dynamicHeight(0.061)),
            ),
            prefixIcon: Padding(
              padding: EdgeInsets.only(
                left: context.dynamicWidth(0.06), //fit(20, 26, 34, 42),
                right: context.dynamicWidth(0.039), //fit(10, 16, 20, 24),
              ),
              child: Icon(
                Icons.vpn_key,
                size: context.dynamicWidth(0.063), //fit(20, 24, 34, 42),
                color: (_fs1.hasFocus)
                    ? Theme.of(context).primaryColor
                    : Theme.of(context).disabledColor,
              ),
            ),
            suffixIcon: (_isPasswordHide)
                ? Padding(
                    padding: EdgeInsets.only(
                      right:
                          context.dynamicWidth(0.048), // fit(10, 20, 26, 34),
                    ),
                    child: IconButton(
                      icon: Icon(
                        Icons.visibility,
                        size:
                            context.dynamicWidth(0.055), //fit(20, 24, 34, 42),
                        color: (_fs1.hasFocus)
                            ? Theme.of(context).primaryColor
                            : Theme.of(context).disabledColor,
                      ),
                      onPressed: () {
                        setState(
                          () {
                            _isPasswordHide = !_isPasswordHide;
                          },
                        );
                      },
                    ),
                  )
                : Padding(
                    padding: EdgeInsets.only(
                      right: context.dynamicWidth(0.048), //fit(10, 20, 26, 30),
                    ),
                    child: IconButton(
                      icon: Icon(
                        Icons.visibility_off,
                        size:
                            context.dynamicWidth(0.055), //fit(20, 24, 34, 38),
                        color: (_fs1.hasFocus)
                            ? Theme.of(context).primaryColor
                            : Theme.of(context).disabledColor,
                      ),
                      onPressed: () {
                        setState(
                          () {
                            _isPasswordHide = !_isPasswordHide;
                          },
                        );
                      },
                    ),
                  ),
          ),
        ),
      ),
    );
  }
}
