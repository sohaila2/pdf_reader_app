import 'package:flutter/material.dart';
import 'package:pdf_reader_app/constants.dart';
import 'dart:async';
import 'package:pdf_reader_app/views/permission_view.dart';

import '../components/gradient_color.dart';

class SplashView extends StatefulWidget {
  const SplashView({super.key});

  static const String id = "SplashView";

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  @override
  void initState() {
    super.initState();
    Timer(
        const Duration(seconds: 5),
        () => Navigator.pushReplacement(context,
            MaterialPageRoute(builder: (context) => const PermissionView())));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: buildContainerDecoration(),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                "assets/images/pdf_reader.png",
                height: 150,
              ),
              const Text(
                "Reading PDFs has never been easer",
              ),
            ],
          ),
        ),
      ),
    );
  }
}
