import 'package:flutter/material.dart';

class PremiumFeature extends StatelessWidget {
  final String text;
  final String imagePath;

  const PremiumFeature(this.text, this.imagePath);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 20),
      child: Row(
        children: [
          Image.asset(
            imagePath,
            height: 30,
          ),
          SizedBox(
            width: 16,
          ),
          Text(
            text,
            style: TextStyle(fontSize: 14),
          )
        ],
      ),
    );
  }
}