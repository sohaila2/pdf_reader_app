import 'package:flutter/material.dart';


class AppBarIcon extends StatelessWidget {
  final Icon icon;
  final VoidCallback? onPressedCallback;
  const AppBarIcon({super.key, required this.icon, this.onPressedCallback});

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: icon,
      iconSize: 30,
      onPressed: onPressedCallback ?? () {},
    );
  }
}
