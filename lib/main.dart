import 'package:flutter/material.dart';
import 'package:gli_check/views/home_page.dart';
import 'package:gli_check/views/onboarding_page.dart';
import 'package:shared_preferences/shared_preferences.dart';

int? isViewed;

void main() async {
  /*final prefs = await SharedPreferences.getInstance();
  final showHome = prefs.getBool('showHome') ?? false;*/

  WidgetsFlutterBinding.ensureInitialized();  // isto está a dar um aviso
  SharedPreferences prefs = await SharedPreferences.getInstance();
  isViewed = prefs.getInt('onBoard');
  /*runApp(const MyApp(
    showHome: showHome, //tentar passar aqui o que vem do ficheiro onboarding_page
  ));*/
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  //final showHome;

  /*const MyApp({
    Key? key,
    //required this.showHome,
  }) : super(key: key);*/

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
          ? const HomePage()
          : const OnBoardingPage(title: 'Flutter Demo Home Page'),
    );
  }
}
