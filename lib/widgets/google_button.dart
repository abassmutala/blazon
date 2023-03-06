import 'package:flutter/material.dart';

class GoogleSignInButton extends StatelessWidget {
  // final String text;
  final String image;
  final TextStyle? textStyle;
  final bool darkMode;
  final double borderRadius;
  final VoidCallback onPressed;
  final Color? splashColor;

  GoogleSignInButton({
    required this.onPressed,
    // this.text,
    required this.image,
    this.textStyle,
    this.splashColor,
    this.darkMode = false,
    this.borderRadius = 4.0,
    Key? key,
  });
  // : assert(text != null),
  //   super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      // buttonColor: themeProvider.isDarkTheme ? Color(0xFF4285F4) : whiteColor,
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all(Colors.white),
        overlayColor: MaterialStateProperty.all(splashColor),
      ),
      onPressed: onPressed,
      child:
          // The Google design guidelines aren't consistent. The dark mode
          // seems to have a perfect square of white around the logo, with a
          // thin 1dp (ish) border. However, since the height of the button
          // is 40dp and the logo is 18dp, it suggests the bottom and top
          // padding is (40 - 18) * 0.5 = 11. That's 10dp once we account for
          // the thin border.
          //
          // The design guidelines suggest 8dp padding to the left of the
          // logo, which doesn't allow us to center the image (given the 10dp
          // above). Something needs to give - either the 8dp is wrong or the
          // 40dp should be 36dp. I've opted to increase left padding to 10dp.
          Row(
        children: <Widget>[
          Image.asset(
            "graphics/google_logo.png",
            height: 18.0,
            width: 18.0,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Text(
              'Continue with Google',
              // style: TextStyle(
              //   // default to the application font-style
              //   fontSize: 15.0,
              //   fontWeight: FontWeight.w600,
              //   color: Colors.grey[700],
              // ),
              style: Theme.of(context).textTheme.button!.copyWith(color: Colors.grey[700],),
            ),
          ),
        ],
      ),
    );
  }
}
