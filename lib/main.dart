import 'package:blazon/constants/app_colors.dart';
import 'package:blazon/managers/router.dart';
import 'package:flutter/material.dart';
import 'views/authentication/intro.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      onGenerateRoute: generateRoute,
      debugShowCheckedModeBanner: false,
      title: 'Film',
      theme: ThemeData(
        brightness: Brightness.dark,
        primaryColor: AppColors.primaryColour,
        accentColor: AppColors.acentColour,
        fontFamily: 'Product Sans',
        appBarTheme: AppBarTheme(
            centerTitle: true,
            color: Colors.transparent
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ButtonStyle(
            padding: MaterialStateProperty.all(
              EdgeInsets.symmetric(vertical: 12.0)
            )
          )
        ),
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: IntroView(),
    );
  }
}
