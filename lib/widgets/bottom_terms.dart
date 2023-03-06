import 'package:blazon/constants/ui_constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class BottomTerms extends StatelessWidget {
  final Color color;
  final TextStyle textStyle;
  final Color decorColor;

  const BottomTerms({Key? key, required this.color, required this.textStyle, required this.decorColor})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Future<void> _launchURL(String url) async {
    //   if (await canLaunch(url)) {
    //     await launch(
    //       url,
    //       enableJavaScript: true,
    //       forceWebView: true,
    //       forceSafariVC: true,
    //     );
    //   } else {
    //     // PlatformException(
    //     //     code: '',
    //     //     message: translate(context, 'cannot_establish_connection'));
    //     throw (translate(context, 'cannot_establish_connection'));
    //   }
    // }

    return Container(
      margin: EdgeInsets.all(24.0),
      alignment: Alignment.bottomCenter,
      child: RichText(
        textAlign: TextAlign.center,
        text: TextSpan(
          style: TextStyle(color: Colors.black87),
          children: <TextSpan>[
            TextSpan(
              text: 'By proceeding',
              style:
                  captionText(context)!.apply(color: color),
            ),
            TextSpan(
              text: 'Terms of service',
              style:
                  captionText(context)!.apply(
                      color: color, decoration: TextDecoration.underline),
              recognizer: TapGestureRecognizer()
                ..onTap = () {},
            ),
            TextSpan(
                text: 'and',
                style:
                    captionText(context)!.apply(color: color)),
            TextSpan(
              text: 'Privacy policy',
              style:
                  captionText(context)!.apply(
                      color: color, decoration: TextDecoration.underline),
              recognizer: TapGestureRecognizer()
                ..onTap = () {},
            ),
          ],
        ),
      ),
    );
  }
}
