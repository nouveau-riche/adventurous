import 'package:flutter/material.dart';

import 'package:adventurous_learner_app/utils/const_color.dart';

class AuthTextFieldWidget extends StatelessWidget {
  final String hintText;
  final Widget icon;
  final TextEditingController? controller;
  final bool isPasswordField;
  final bool isPasswordVisible;
  final Function? onPasswordVisibility;

  const AuthTextFieldWidget({
    Key? key,
    required this.hintText,
    required this.icon,
    this.controller,
    this.isPasswordField = false,
    this.isPasswordVisible = false,
    this.onPasswordVisibility,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextField(
      cursorColor: oliveColor,
      controller: controller,
      obscureText: isPasswordVisible,
      decoration: InputDecoration(
        hintText: hintText,
        hintStyle: const TextStyle(
          color: Colors.black,
          fontWeight: FontWeight.w500,
        ),
        focusedBorder: const UnderlineInputBorder(
          borderSide: BorderSide(color: oliveColor),
        ),
        suffixIcon: isPasswordField
            ? IconButton(
                onPressed: () {
                  onPasswordVisibility?.call();
                },
                splashColor: Colors.transparent,
                icon: Icon(
                  isPasswordVisible
                      ? Icons.visibility_outlined
                      : Icons.visibility_off_outlined,
                  color: kSecondaryTextColor,
                  size: 20,
                ),
              )
            : null,
        icon: icon,
      ),
    );
  }
}
