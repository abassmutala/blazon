import 'package:blazon/constants/route_names.dart';
import 'package:blazon/constants/ui_constants.dart';
import 'package:flutter/material.dart';

class LoginReferral extends StatelessWidget {
  final Color? linkColor;
  final Color? color;

  const LoginReferral({ Key? key,  this.linkColor,  this.color}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.pushReplacementNamed(context, LoginViewRoute);
      },
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: RichText(
          textAlign: TextAlign.center,
          text: TextSpan(
            children: <TextSpan>[
              TextSpan(
                text: 'Already have an account? ',
                style: subtitle1Text(context)!.apply(color: color),
              ),
              TextSpan(
                text: 'Login',
                style: subtitle1Text(context)!.apply(
                  // fontWeightDelta: 2,
                  color: linkColor,
                  decoration: TextDecoration.underline,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
