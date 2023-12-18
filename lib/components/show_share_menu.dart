import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:app_settings/app_settings.dart';
import '../services/pdf_services.dart';

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
              GestureDetector(
                onTap: () {
                  launchSocialMediaAppIfInstalled('https://www.linkedin.com/');
                },
                child: Image.asset(
                  "assets/images/linkedin.png",
                  height: 60,
                ),
              ),
              SizedBox(
                width: 10,
              ),
              GestureDetector(
                onTap: () {
                  launchSocialMediaAppIfInstalled('whatsapp://send?text=Your%20message');
                },
                child: Image.asset(
                  "assets/images/WhatsApp.png",
                  height: 70,
                ),
              ),
              SizedBox(
                width: 10,
              ),
              GestureDetector(
                onTap: () {
                //  AppSettings.openAppSettings(type: AppSettingsType.bluetooth);
                },
                child: Image.asset(
                  "assets/images/bleutooth.png",
                  height: 60,
                ),
              ),
              SizedBox(
                width: 10,
              ),
              GestureDetector(
                onTap: () {
                  launchSocialMediaAppIfInstalled('mailto:?subject=Subject&body=Body');
                },
                child: Image.asset(
                  "assets/images/mail.png",
                  height: 60,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
