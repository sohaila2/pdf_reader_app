import 'package:flutter/material.dart';

import '../views/premium_view.dart';

class ToolsContainer extends StatelessWidget {
  const ToolsContainer({
    super.key, required this.title,
  });

  final String title;
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Padding(
          padding: const EdgeInsets.only(top:28.0 ,right: 28.0 ,left: 28.0),
          child: Row(
            children: [
              Text(
                'PDF Reader',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                ),
              ),
              Spacer(),
              GestureDetector(
                onTap :(){
                Navigator.pushNamed(context, PremiumView.id);
              },
                child: Image.asset(
                  "assets/images/permium.png",
                  height: 50,
                ),
              ),
              SizedBox(width: 5,),
              Icon(
                Icons.search,
                color: Colors.white,
                size: 30,
              ),
            ],
          ),
        ),
        const SizedBox(height: 8.0),
        Text(
         title,
          style: TextStyle(
            color: Colors.white,
            fontSize: 28,
              fontWeight: FontWeight.w500
          ),
        ),
      ],
    );
  }
}
