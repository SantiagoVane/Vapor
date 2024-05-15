import 'package:flutter/material.dart';

class ButtonAppBar extends StatelessWidget {
  final Icon icon;
  final VoidCallback? onPressed;

  const ButtonAppBar({super.key, required this.icon, this.onPressed});

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: icon,
      onPressed: onPressed,
      color: Colors.cyanAccent,
    );
  }
}
