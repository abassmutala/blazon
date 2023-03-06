import 'package:flutter/material.dart';

class InputField extends StatefulWidget {
  final bool autofocus;
  final Widget? icon;
  final String? labelText;
  final String? hintText;
  final TextEditingController? controller;
  final FormFieldValidator<String>? validator;
  final TextInputType? keyboardType;
  final ValueChanged<String>? onFieldSubmitted;
  final int? maxLength;
  final bool password;
  final bool? enabled;
  final String? initialValue;
  final bool? filled;
  final Color? fillColor;
  final Widget? prefixIcon, suffix;

  const InputField({
    Key? key,
    this.icon,
     this.labelText,
    this.autofocus = false,
    this.controller,
    this.validator,
    this.keyboardType,
    this.onFieldSubmitted,
    this.maxLength,
    this.password = false,
    this.enabled,
    this.initialValue,
    this.filled,
    this.fillColor,
    this.prefixIcon,
    this.suffix,
    this.hintText,
  }) : super(key: key);

  @override
  _InputFieldState createState() => _InputFieldState();
}

class _InputFieldState extends State<InputField> {
  bool isPassword = false;

  @override
  void initState() {
    super.initState();
    isPassword = widget.password;
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: kTabLabelPadding.add(kMaterialListPadding),
      child: TextFormField(
        autofocus: widget.autofocus,
        controller: widget.controller,
        decoration: InputDecoration(
          isDense: true,
          border: OutlineInputBorder(
            borderSide: BorderSide.none,
            borderRadius: BorderRadius.all(
              Radius.circular(8.0),
            ),
          ),
          filled: widget.filled,
          fillColor: widget.fillColor,
          icon: widget.icon,
          labelText: widget.labelText,
          hintText: widget.hintText,
          hintStyle: TextStyle(color: Colors.white),
          prefixIcon: widget.prefixIcon,
          suffix: widget.suffix,
          suffixIcon: widget.password
              ? InkWell(
                  onTap: () {
                    setState(() {
                      isPassword = !isPassword;
                    });
                  },
                  child: Icon(
                    isPassword
                        ? Icons.visibility_outlined
                        : Icons.visibility_off_outlined,
                    semanticLabel:
                        isPassword ? 'Show password' : 'Hide password',
                    color: Colors.white,
                    size: 24.0,
                  ),
                )
              : null,
        ),
        enabled: widget.enabled,
        initialValue: widget.initialValue,
        maxLength: widget.maxLength,
        obscureText: isPassword,
        onFieldSubmitted: widget.onFieldSubmitted,
        validator: widget.validator,
        keyboardType: widget.keyboardType,
      ),
    );
  }
}
