import 'package:flutter/material.dart';

class ActionButtonExt extends StatelessWidget {
  final IconData icon;
  final VoidCallback? onPressed;

  const ActionButtonExt({
    super.key,
    required this.icon,
    this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      // shape: const CircleBorder(),
      onPressed: onPressed,
      child: Icon(icon),
    );
  }
}