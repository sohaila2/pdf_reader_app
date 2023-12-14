import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pdf_reader_app/bloc/pdf_file/pdf_cubit.dart';
import 'package:pdf_reader_app/views/permission_view.dart';
import 'package:pdf_reader_app/views/splash_view.dart';
import '../services/pdf_services.dart';
import '../views/home_view.dart';
import '../views/premium_view.dart';

class AppRoot extends StatelessWidget {
  const AppRoot({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context)=>PdfCubit()..initState()),
      ],
      child: MaterialApp(
        title: 'PDF Reader App',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        routes: {
          SplashView.id: (context) => const SplashView(),
          PermissionView.id: (context) => const PermissionView(),
          PremiumView.id: (context) => const PremiumView(),
          HomeView.id: (context) => HomeView(),


        },
       initialRoute: SplashView.id,
      ),
    );
  }
}