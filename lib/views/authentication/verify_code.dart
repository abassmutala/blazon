import 'package:blazon/constants/route_names.dart';
import 'package:blazon/constants/ui_constants.dart';
import 'package:blazon/widgets/appbar.dart';
import 'package:blazon/widgets/input_field.dart';
import 'package:blazon/widgets/long_button.dart';

import '../../constants/ui_constants.dart';
import 'package:flutter/material.dart';

class VerifyCodeView extends StatefulWidget {
  @override
  _VerifyCodeViewState createState() => _VerifyCodeViewState();
}

class _VerifyCodeViewState extends State<VerifyCodeView> {
  final _verifyCodeFormKey = GlobalKey<FormState>();
  final TextEditingController _codeController = TextEditingController();
  final Color color = Colors.white;

  _backgroundImage() {
    return Image.asset(
      'images/mulan.jpg',
      width: screenWidth,
      fit: BoxFit.cover,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      fit: StackFit.expand,
      children: [
        Column(
          children: [
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
        Scaffold(
          appBar: FilmAppBar(),
          backgroundColor: Colors.transparent,
          body: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Verify Code',
                  style: headline5Text(context),
                ),
                verticalSpaceMedium,
                Text(
                  'Enter the code sent to your email address.',
                  style: subtitle1Text(context),
                ),
                verticalSpaceMedium,
                Form(
                  key: _verifyCodeFormKey,
                  child: Column(
                    children: [
                      _codeInput(),
                      _verifyButton(),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget _codeInput() {
    return InputField(
      autofocus: true,
      filled: true,
      fillColor: Colors.grey.withOpacity(0.6),
      prefixIcon: Icon(
        Icons.email_outlined,
        color: color,
      ),
      hintText: 'Verification Code',
      controller: _codeController,
      validator: (val) => val!.length < 6 ? 'Invalid verification code' : null,
      maxLength: 6,
      keyboardType: TextInputType.number,
    );
  }

  Widget _verifyButton() {
    return Padding(
      padding: kTabLabelPadding.add(kMaterialListPadding),
      child: LongButton(
        onPressed: () {
          if (_verifyCodeFormKey.currentState!.validate()) {
            Navigator.pushNamed(context, MainScreenRoute);
          }
        },
        label: 'Verify'.toUpperCase(),
      ),
    );
  }
}
