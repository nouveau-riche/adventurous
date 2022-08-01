import 'package:flutter/material.dart';

class HideKeyboardOnTouchWidget extends StatelessWidget {
  final Widget child;

  const HideKeyboardOnTouchWidget({
    Key? key,
    required this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: child,
    );
  }
}
