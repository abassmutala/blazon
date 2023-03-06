import 'package:blazon/constants/route_names.dart';
import 'package:blazon/constants/ui_constants.dart';
import 'package:blazon/widgets/appbar.dart';
import 'package:blazon/widgets/input_field.dart';
import 'package:blazon/widgets/long_button.dart';

import '../../constants/ui_constants.dart';
import 'package:flutter/material.dart';

class ForgotPasswordView extends StatefulWidget {
  @override
  _ForgotPasswordViewState createState() => _ForgotPasswordViewState();
}

class _ForgotPasswordViewState extends State<ForgotPasswordView> {
  final _forgotPasswordFormKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  final Color color = Colors.white;

  _backgroundImage() {
    return Image.asset(
      'images/best-kids-movies-2020-call-of-the-wild-1579042974.jpg',
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
                  'Forgot Password',
                  style: headline5Text(context),
                ),
                verticalSpaceMedium,
                Text(
                  'Enter your email address below',
                  style: subtitle1Text(context),
                ),
                verticalSpaceMedium,
                Form(
                  key: _forgotPasswordFormKey,
                  child: Column(
                    children: [
                      _emailInput(),
                      _continueButton(),
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

  Widget _emailInput() {
    return InputField(
      autofocus: true,
      filled: true,
      fillColor: Colors.grey.withOpacity(0.6),
      prefixIcon: Icon(
        Icons.email_outlined,
        color: color,
      ),
      hintText: 'Email',
      controller: _emailController,
      validator: (val) => val!.isEmpty || !emailPattern.hasMatch(val)
          ? 'Invalid email address'
          : null,
      keyboardType: TextInputType.emailAddress,
    );
  }

  Widget _continueButton() {
    return Padding(
      padding: kTabLabelPadding.add(kMaterialListPadding),
      child: LongButton(
          onPressed: () {
            if (_forgotPasswordFormKey.currentState!.validate()) {
              Navigator.pushNamed(context, VerifyCodeRoute);
            }
          },
          label: 'Continue'.toUpperCase()),
    );
  }
}
