import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'package:gli_check/views/onboarding_page.dart';
import 'package:gli_check/views/login_page.dart';
import 'package:gli_check/views/home_page.dart';

int? isViewed;

void main() async {
  WidgetsFlutterBinding.ensureInitialized(); // isto está a dar um aviso
  SharedPreferences prefs = await SharedPreferences.getInstance();
  isViewed = prefs.getInt('onBoard');

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Glicheck App',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.amber.shade50),
        scaffoldBackgroundColor: Colors.amber.shade50,
        useMaterial3: true,
      ),
      home: isViewed == 0
          // ? const HomePage()
          ? LoginPage() //deve ficar temporariamente ate ter auth feita?
          : const OnBoardingPage(title: 'Flutter Demo Home Page'),
    );
  }
}
