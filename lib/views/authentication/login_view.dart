import 'package:blazon/constants/route_names.dart';
import 'package:blazon/constants/ui_constants.dart';
import 'package:blazon/widgets/input_field.dart';
import 'package:blazon/widgets/long_button.dart';
import 'package:blazon/widgets/sign_up_referral.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../constants/ui_constants.dart';
import 'package:flutter/material.dart';

class LoginView extends StatefulWidget {
  @override
  _LoginViewState createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  final _loginInFormKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final Color color = Colors.white;

  _backgroundImage() {
    return Image.asset(
      'images/onward.jpg',
      width: screenWidth,
      fit: BoxFit.cover,
    );
  }

  _appLogo() {
    final String assetName = 'images/logo-nopad.svg';
    return Container(
      width: screenWidth! / 2,
      height: screenWidth! / 2,
      alignment: Alignment.center,
      child: SvgPicture.asset(assetName),
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
              flex: 3,
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
            body: ListView(
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    _appLogo(),
                    // Text(
                    //   'Login',
                    //   style: headline5Text(context),
                    // ),
                    // verticalSpaceMedium,
                    Form(
                      key: _loginInFormKey,
                      child: Column(
                        children: [
                          _emailInput(),
                          _passwordInput(),
                          _forgotPassword(),
                          _loginButton(),
                          SignUpReferral(),
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
            // Center(
            //   child: Column(
            //     mainAxisAlignment: MainAxisAlignment.center,
            //     children: [
            //       _appLogo(),
            //       Form(
            //         key: _loginInFormKey,
            //         child: Column(
            //           children: [
            //             _emailInput(),
            //             _passwordInput(),
            //             _forgotPassword(),
            //             _loginButton(),
            //             SignUpReferral()
            //           ],
            //         ),
            //       ),
            //     ],
            //   ),
            // ),
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

  Widget _passwordInput() {
    return InputField(
      password: true,
      filled: true,
      fillColor: Colors.grey.withOpacity(0.6),
      prefixIcon: Icon(
        Icons.lock_outlined,
        color: color,
      ),
      hintText: 'Password',
      controller: _passwordController,
      validator: (val) =>
          val!.length < 8 ? 'Password must be at least 8 characters long' : null,
    );
  }

  Widget _forgotPassword() {
    return InkWell(
      onTap: () {
        Navigator.pushNamed(context, ForgotPasswordRoute);
      },
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Text(
          'Forgot Password?',
        ),
      ),
    );
  }

  Widget _loginButton() {
    return Padding(
      padding: kTabLabelPadding.add(kMaterialListPadding),
      child: LongButton(
          onPressed: () {
            if (_loginInFormKey.currentState!.validate()) {}
          },
          label: 'Login'.toUpperCase()),
    );
  }
}
