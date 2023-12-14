import 'package:flutter/material.dart';
import 'package:pdf_reader_app/constants.dart';
import 'package:pdf_reader_app/views/home_view.dart';

import '../components/premium/premium_button.dart';
import '../components/premium/premium_feature.dart';

class PremiumView extends StatelessWidget {
  const PremiumView({super.key});
  static const String id = "PremiumScreen";

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 14.0),
      child: Scaffold(
        backgroundColor: kSecondColor,
        body: Center(
          child: Column(
            children: [
              Image.asset("assets/images/bussinesmen.jpg"),
              Padding(
                padding: const EdgeInsets.only(top: 26.0,right: 16.0,left: 16.0,bottom: 12.0),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "Get PDF Reader Premium",
                    style: TextStyle(fontSize: 20,
                    fontWeight: FontWeight.w500),
                  ),
                ),
              ),
              PremiumFeature("No Ads", "assets/images/lock.png"),
              SizedBox(
                height: 10,
              ),
              PremiumFeature("All Documents Reader", "assets/images/doc2.jpeg"),
              SizedBox(
                height: 10,
              ),
              PremiumFeature("Convert Image to PDF", "assets/images/photo.jpeg"),
              SizedBox(
                height: 10,
              ),
              PremiumButton("Monthly", "Rs: 2000.00/1 month",Icons.check_circle_outline),
              SizedBox(
                height: 10,
              ),
              PremiumButton("Yearly", "Rs: 8500.00/1 year",Icons.circle_outlined),
              SizedBox(
                height: 10,
              ),
              ElevatedButton(
                onPressed: () {
                  Navigator.pushNamed(context, HomeView.id);
                },
                child: Text("Start 3 - Day FREE Trail"),
                style: ElevatedButton.styleFrom(
                    primary: Colors.red, onPrimary: Colors.white),
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                "    Subscriptions are changed monthly\nand yearly basis, you cn cancel at any time",
                style: TextStyle(fontSize: 10),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
