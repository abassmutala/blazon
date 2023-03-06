import 'package:flutter/material.dart';


final emailPattern = RegExp(
    r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+");

final phoneNumberPattern = RegExp(r"^[+.0-9]+");

class SizeConfig {
  static MediaQueryData? _mediaQueryData;
  static double? screenWidth;
  static double? screenHeight;
  static Orientation? orientation;

  void init(BuildContext context) {
    _mediaQueryData = MediaQuery.of(context);
    screenWidth = _mediaQueryData!.size.width;
    screenHeight = _mediaQueryData!.size.height;
    orientation = _mediaQueryData!.orientation;
  }
}

// Spaces
const Widget horizontalSpaceTiny = SizedBox(width: 4.0);
const Widget horizontalSpaceSmall = SizedBox(width: 8.0);
const Widget horizontalSpaceMini = SizedBox(width: 12.0);
const Widget horizontalSpaceMedium = SizedBox(width: 16.0);
const Widget horizontalSpaceLarge = SizedBox(width: 24.0);

const Widget verticalSpaceTiny = SizedBox(height: 4.0);
const Widget verticalSpaceSmall = SizedBox(height: 8.0);
const Widget verticalSpaceMini = SizedBox(height: 12.0);
const Widget verticalSpaceMedium = SizedBox(height: 16.0);
const Widget verticalSpaceLarge = SizedBox(height: 24.0);
const Widget verticalSpaceMassive = SizedBox(height: 48.0);

// padding
const EdgeInsets kStandardPadding = EdgeInsets.symmetric(
  horizontal: 16.0,
  vertical: 24.0,
);
const EdgeInsets kWideInputFieldPadding = EdgeInsets.symmetric(
  horizontal: 16.0,
  vertical: 4.0,
);
const EdgeInsets kWideButtonPadding = EdgeInsets.symmetric(
  horizontal: 16.0,
  vertical: 12.0,
);

Widget verticalSpace(double height) => SizedBox(height: height);

// Screen Sizes
double? screenWidth = SizeConfig.screenWidth;
double? screenHeight = SizeConfig.screenHeight;

double screenHeightFraction({int dividedBy = 1, double offsetBy = 0}) =>
    (SizeConfig.screenHeight! - offsetBy) / dividedBy;

double screenWidthFraction({int dividedBy = 1, double offsetBy = 0}) =>
    (SizeConfig.screenWidth! - offsetBy) / dividedBy;

double halfScreenWidth = screenWidthFraction(dividedBy: 2);

double thirdScreenWidth = screenWidthFraction(dividedBy: 3);

double quarterScreenWidth = screenWidthFraction(dividedBy: 4);

// Colours
Color buttonColor(BuildContext context) => Theme.of(context).buttonColor;
Color primaryColor(BuildContext context) => Theme.of(context).primaryColor;
Color accentColor(BuildContext context) => Theme.of(context).accentColor;

// Text Styles
TextStyle? headline1Text(context) =>
    Theme.of(context).textTheme.headline1;
TextStyle? headline2Text(context) =>
    Theme.of(context).textTheme.headline2;
TextStyle? headline3Text(context) =>
    Theme.of(context).textTheme.headline3;
TextStyle? headline4Text(context) =>
    Theme.of(context).textTheme.headline4;
TextStyle? headline5Text(context) =>
    Theme.of(context).textTheme.headline5;
TextStyle? headline6Text(context) =>
    Theme.of(context).textTheme.headline6;
TextStyle? subtitle1Text(context) =>
    Theme.of(context).textTheme.subtitle1;
TextStyle? subtitle2Text(context) =>
    Theme.of(context).textTheme.subtitle2;
TextStyle? bodyText1Text(context) =>
    Theme.of(context).textTheme.bodyText1;
TextStyle? bodyText2Text(context) =>
    Theme.of(context).textTheme.bodyText2;
TextStyle? buttonText(context) =>
    Theme.of(context).textTheme.button;
TextStyle? captionText(context) =>
    Theme.of(context).textTheme.caption;
TextStyle? overlineText(context) =>
    Theme.of(context).textTheme.overline;

// Special Widgets
final divider12 = Divider(
  height: 12,
);
