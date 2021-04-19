import 'package:binamod/providers/login_provider.dart';
import 'package:flutter/material.dart';
import 'package:binamod/utils/context_extension.dart';
import 'package:provider/provider.dart';

class MailTextWidget extends StatefulWidget {
  @override
  _MailTextWidgetState createState() => _MailTextWidgetState();
}

class _MailTextWidgetState extends State<MailTextWidget> {
  FocusNode _fs1 = FocusNode();
  LoginProvider loginProvider;
  final String inputHint = 'E-Mail';
  @override
  void initState() {
    super.initState();
    _fs1.addListener(() {
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    loginProvider = Provider.of<LoginProvider>(context, listen: false);
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: context.dynamicWidth(0.09), //fit(30, 40, 60, 80),
        // vertical: context.dynamicShortest(0.032), //fit(2, 13, 16, 20),
      ),
      child: SizedBox(
        child: TextFormField(
          cursorHeight: context.dynamicHeight(0.024), //fit(15, 20, 25, 25),
          focusNode: _fs1,
          onChanged: (val) {
            loginProvider.username = val;
          },
          style: (_fs1.hasFocus)
              ? context.theme.textTheme.bodyText2.copyWith(
                  color: context.theme.primaryColor,
                )
              : context.theme.textTheme.bodyText2,
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
                Icons.person,
                size: context.dynamicWidth(0.063), //fit(20, 24, 34, 42),
                color: (_fs1.hasFocus)
                    ? Theme.of(context).primaryColor
                    : Theme.of(context).disabledColor,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
