import 'package:flutter/material.dart';
import '../constants.dart';

BoxDecoration buildContainerDecoration() {
  return const BoxDecoration(
    gradient: LinearGradient(
      colors: [
        kFirstColor,
        kSecondColor,
      ],
      begin: Alignment.topCenter,
      end: Alignment.bottomCenter,
      stops: [0.1, 0.7],
      tileMode: TileMode.clamp,
    ),
  );
}