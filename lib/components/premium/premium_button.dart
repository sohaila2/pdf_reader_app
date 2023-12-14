import 'package:flutter/material.dart';

class PremiumButton extends StatelessWidget {
  final String buttonText;
  final String price;
  final IconData icon;
  const PremiumButton(this.buttonText, this.price, this.icon, {super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 300,
      height: 60,
      child: ElevatedButton(
        onPressed: () {},
        child: Row(
          children: [
            Icon(icon,
            color: Colors.black,),
            SizedBox(
              width: 20,
            ),
            Column(
              children: [
                Text(buttonText,style: TextStyle(
                  color: Colors.black,
                    fontWeight: FontWeight.w500,
                ),),
                Text(price,
                    style: TextStyle(
                    color: Colors.red,
                    fontWeight: FontWeight.w400)),
              ],
            )
          ],
        ),
        style: ElevatedButton.styleFrom(
          primary: Color(0xfff1eeb1),
        ),
      ),
    );
  }
}