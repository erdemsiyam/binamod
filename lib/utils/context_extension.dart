import 'package:flutter/material.dart';

extension ContextExtension on BuildContext {
  double dynamicWidth(double val) => MediaQuery.of(this).size.width * val;
  double dynamicHeight(double val) => MediaQuery.of(this).size.height * val;
  double dynamicShortest(double val) =>
      MediaQuery.of(this).size.shortestSide * val;
  ThemeData get theme => Theme.of(this);
}

extension NumberExtension on BuildContext {
  double get lowValue => dynamicHeight(0.01);
  double get mediumValue => dynamicHeight(0.03);
  double get highValue => dynamicHeight(0.05);
}

extension PaddingExtension on BuildContext {
  EdgeInsets get paddingAllowLow => EdgeInsets.all(lowValue);
  EdgeInsets get paddingAllowMedium => EdgeInsets.all(mediumValue);
  EdgeInsets get paddingAllowHigh => EdgeInsets.all(highValue);
}

extension EmptyWidget on BuildContext {
  Widget get emptyWidgetHeightLow => SizedBox(height: lowValue);
  Widget get emptyWidgetHeightMedium => SizedBox(height: mediumValue);
  Widget get emptyWidgetHeightHigh => SizedBox(height: highValue);
  Widget get emptyWidgetWidthLow => SizedBox(width: lowValue);
  Widget get emptyWidgetWidthMedium => SizedBox(width: mediumValue);
  Widget get emptyWidgetWidthHigh => SizedBox(width: highValue);
}

extension FontSize on BuildContext {
  double get fontSize100 => dynamicHeight(0.0146); // 12
  double get fontSize200 => dynamicHeight(0.0170); // 14
  double get fontSize300 => dynamicHeight(0.0195); // 16
  double get fontSize400 => dynamicHeight(0.0219); // 18
  double get fontSize500 => dynamicHeight(0.0244); // 20
  double get fontSize600 => dynamicHeight(0.0268); // 22
  double get fontSize700 => dynamicHeight(0.0292); // 24
  double get fontSize800 => dynamicHeight(0.0317); // 26
  double get fontSize900 => dynamicHeight(0.0341); // 28
}
