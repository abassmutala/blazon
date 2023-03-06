import 'package:blazon/constants/route_names.dart';
import 'package:blazon/constants/ui_constants.dart';
import 'package:flutter/material.dart';

class SignUpReferral extends StatelessWidget {
  final Color? color;
  final Color? linkColor;

  const SignUpReferral({Key? key, this.color, this.linkColor}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.pushReplacementNamed(context, SignUpViewRoute);
      },
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: RichText(
          textAlign: TextAlign.center,
          text: TextSpan(
            children: <TextSpan>[
              TextSpan(
                text: 'Dont have an account? ',
                style: subtitle1Text(context)!.apply(color: color),
              ),
              TextSpan(
                text: 'Sign up',
                style: subtitle1Text(context)!.apply(
                    // fontWeightDelta: 2,
                    color: linkColor,
                    decoration: TextDecoration.underline),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
