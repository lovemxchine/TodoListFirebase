import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'screen/home_screen.dart';
import 'screen/introduction_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';


bool show = true;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform
  );

  final prefs = await SharedPreferences.getInstance();
  show = prefs.getBool('ON_BOARDING') ?? false;
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Onboarding Screen',
      theme: ThemeData(
        primaryColor: Colors.blue,
      ),
      //home: IntroScreen(),
      home:show ? IntroScreen() : HomeScreen(),
    );
  }
}


// ...

