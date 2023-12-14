import 'package:flutter/material.dart';
import 'package:pdf_reader_app/views/home_view.dart';
import 'package:pdf_reader_app/views/premium_view.dart';
import '../components/gradient_color.dart';
import '../services/pdf_services.dart';

class PermissionView extends StatelessWidget {
  const PermissionView({super.key});
  static const String id = "PermissionView";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: buildContainerDecoration(),
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  "Welcome to",
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                ),
                const Text(
                  "PDF READER",
                  style: TextStyle(
                      color: Colors.red,
                      fontSize: 24,
                      fontWeight: FontWeight.bold),
                ),
                Image.asset(
                  "assets/images/to-do1.png",
                  height: 180,
                ),
                SizedBox(height: 20,),
                const Text(
                  "Permission Required",
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                ),
                const Text(
                  "To read your files please allow",
                  textAlign: TextAlign.start,
                  style:
                  TextStyle(fontSize: 16),

                ),
                Row(
                 mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "PDF Reader",
                      style: TextStyle(color: Colors.red,
                          fontSize: 16),
                    ),
                    Text(" to access all your files.",
                        style: TextStyle(
                            fontSize: 16)
                    ),
                  ],
                ),
                SizedBox(height: 30,),

                SizedBox(
                  width: 150,
                  child: ElevatedButton(
                    onPressed: () {
                      requestPermission(context);
                      Navigator.pushNamed(context, PremiumView.id);

                    },
                    child: const Text("Allow",
                        style: TextStyle(
                            fontSize: 18)),
                    style: ElevatedButton.styleFrom(
                      primary: Colors.red,
                      onPrimary: Colors.white,
                    ),
                  ),
                ),
                SizedBox(
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.pushNamed(context, PremiumView.id);
                    },
                    child: const Text("Later",
                        style: TextStyle(
                            fontSize: 18)),
                    style: ElevatedButton.styleFrom(
                        primary: Colors.transparent,
                        elevation: 0,
                        onPrimary: Colors.black54),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
