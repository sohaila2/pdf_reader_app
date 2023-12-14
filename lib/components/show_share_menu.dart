import 'package:flutter/material.dart';

class ShowShareMenu extends StatelessWidget {
  const ShowShareMenu({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 180,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const Text(
            "Share",
            style: TextStyle(fontSize: 30),
          ),
          SizedBox(
            height: 20,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                "assets/images/linkedin.png",
                height: 60,
              ),
              SizedBox(
                width: 10,
              ),
              Image.asset(
                "assets/images/WhatsApp.png",
                height: 70,
              ),
              SizedBox(
                width: 10,
              ),
              Image.asset(
                "assets/images/bleutooth.png",
                height: 60,
              ),
              SizedBox(
                width: 10,
              ),
              Image.asset(
                "assets/images/mail.png",
                height: 60,
              ),
            ],
          )
        ],
      ),
    );
  }
}
