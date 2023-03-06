import 'package:blazon/constants/ui_constants.dart';
import 'package:flutter/material.dart';

class LongButton extends StatelessWidget {
  final String label;
  final VoidCallback onPressed;
  final EdgeInsetsGeometry? margin;
  final Color? color;

  LongButton(
      {Key? key,
      required this.onPressed,
      required this.label,
      this.margin,
      this.color})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.all(Radius.circular(8.0)),
      child: Container(
        height: 50.0,
        width: screenWidth,
        constraints: BoxConstraints(
          maxWidth: 360.0,
        ),
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Color.fromRGBO(2, 53, 180, 1),
              Color.fromRGBO(8, 128, 163, 1)
            ],
            begin: Alignment.centerLeft,
            end: Alignment.centerRight,
          ),
          // boxShadow: [
          //   BoxShadow(
          //       color: Colors.grey, offset: Offset(0.0, 1.5), blurRadius: 1.5)
          // ],
        ),
        margin: margin,
        child: Material(
          elevation: 2.0,
          color: Colors.transparent,
          child: InkWell(
            onTap: onPressed,
            child: Center(
              child: Text(
                label,
                style: buttonText(context)!.copyWith(color: Colors.white),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
