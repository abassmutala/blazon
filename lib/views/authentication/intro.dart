import 'package:blazon/constants/route_names.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../constants/ui_constants.dart';
import '../../widgets/long_button.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class IntroView extends StatelessWidget {
  final String assetName = 'images/logo-nopad.svg';
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
    ]);

    _appLogo() {
      return Container(
        width: screenWidth! / 2,
        padding: EdgeInsets.all(8.0),
        alignment: Alignment.center,
        child: SvgPicture.asset(assetName),
      );
    }

    _backgroundImage() {
      return Image.asset(
        'images/star-wars.jpg',
        width: screenWidth,
        fit: BoxFit.cover,
      );
    }

    _startButton() {
      return LongButton(onPressed: () {
        Navigator.pushNamed(context, LoginViewRoute);
      }, label: 'Start'.toUpperCase());
    }

    _appDesc() {
      return Padding(
        padding: kTabLabelPadding.add(kMaterialListPadding),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              'Stream now or \ndownload and go'.toUpperCase(),
              style: headline6Text(context)!.copyWith(color: Colors.white),
              textAlign: TextAlign.center,
            ),
            verticalSpaceLarge,
            Text(
              'Stream on 4 devices at once or download your favourites to watch later.',
              style: subtitle1Text(context)!.copyWith(color: Colors.white),
              textAlign: TextAlign.center,
            ),
            verticalSpaceMassive,
            _startButton()
          ],
        ),
      );
    }

    return Stack(
      fit: StackFit.expand,
      children: [
        Column(
          children: <Widget>[
            Expanded(
              flex: 2,
              child: _backgroundImage(),
            ),
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                    color: Color.fromRGBO(0, 10, 37, 1),
                    boxShadow: [
                      BoxShadow(
                          color: Color.fromRGBO(0, 10, 37, 1),
                          blurRadius: 50.0,
                          spreadRadius: 70.0)
                    ]),
              ),
            ),
          ],
        ),
        SafeArea(
          child: Scaffold(
            backgroundColor: Colors.transparent,
            body: Column(
              children: [
                Expanded(
                  flex: 3,
                  child: Container(
                    child: Center(
                      child: _appLogo(),
                    ),
                  ),
                ),
                Expanded(
                  flex: 2,
                  child: _appDesc(),
                )
              ],
            ),
          ),
        )
      ],
    );
  }
}
