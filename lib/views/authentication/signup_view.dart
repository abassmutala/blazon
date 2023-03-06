import 'package:blazon/widgets/input_field.dart';
import 'package:blazon/widgets/login_referral.dart';
import 'package:blazon/widgets/long_button.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../constants/ui_constants.dart';
import 'package:flutter/material.dart';

class SignUpView extends StatefulWidget {
  @override
  _SignUpViewState createState() => _SignUpViewState();
}

class _SignUpViewState extends State<SignUpView> {
  final _signUpFormKey = GlobalKey<FormState>();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final Color color = Colors.white;

  _backgroundImage() {
    return Image.asset(
      'images/dolittle.jpg',
      width: screenWidth,
      fit: BoxFit.cover,
    );
  }

  _appLogo() {
    final String assetName = 'images/logo-nopad.svg';
    return Container(
      width: screenWidth! / 2,
      height: screenWidth! / 2,
      padding: EdgeInsets.all(8.0),
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
                    //   'Sign Up',
                    //   style: headline5Text(context),
                    // ),
                    // verticalSpaceMedium,
                    Form(
                      key: _signUpFormKey,
                      child: Column(
                        children: [
                          _nameInput(),
                          _emailInput(),
                          _passwordInput(),
                          _registerButton(),
                          LoginReferral(),
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget _nameInput() {
    return InputField(
      filled: true,
      fillColor: Colors.grey.withOpacity(0.6),
      prefixIcon: Icon(
        Icons.person_outlined,
        color: color,
      ),
      hintText: 'Name',
      controller: _nameController,
      validator: (val) => val!.length < 3 ? 'Enter a valid name' : null,
    );
  }

  Widget _emailInput() {
    return InputField(
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
          val!.length < 3 ? 'Password must be at least 8 characters long' : null,
    );
  }

  Widget _registerButton() {
    return Padding(
      padding: kTabLabelPadding.add(kMaterialListPadding),
      child: LongButton(
          onPressed: () {
            if (_signUpFormKey.currentState!.validate()) {}
          },
          label: 'Register'.toUpperCase()),
    );
  }
}
