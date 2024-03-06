// import 'dart:html';

import 'package:flutter/material.dart';
import 'package:introduction_screen/introduction_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'home_screen.dart';


class IntroScreen extends StatelessWidget {
  IntroScreen({super.key});
  final List<PageViewModel> pages = [
    PageViewModel(
      title: "Welcome to our restaurant app!",
      body: '''
        Discover delicious dishes, explore new flavors, 
        and enjoy a seamless dining experience right at your fingertips. 
        
      ''',
      footer: Column(
        children: [
          SizedBox(
            width: 180,
            height: 45,
            child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                    backgroundColor: Color.fromARGB(255, 255, 249, 218),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10)),
                    elevation: 8),
                onPressed: () {},
                child: const Text("Let's get started!",
                    style: TextStyle(
                        fontWeight: FontWeight.w400,
                        fontSize: 16.0,
                        color: Colors.black))),
          ),
        ],
      ),
      image: Image.asset('assets/images/111.png'),
    ),
    PageViewModel(
      title: "Explore Menu",
      body: '''Explore our diverse menu filled with mouthwatering dishes.
From appetizers to desserts, we have something for everyone.
Browse through our curated selections and find your next favorite meal.''',
      footer: Column(
        children: [
          SizedBox(
            width: 180,
            height: 45,
            child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                    backgroundColor: Color.fromARGB(255, 255, 249, 218),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10)),
                    elevation: 8),
                onPressed: () {},
                child: const Text("Let's get started!",
                    style: TextStyle(
                        fontWeight: FontWeight.w400,
                        fontSize: 16.0,
                        color: Colors.black))),
          ),
        ],
      ),
      image: Image.asset('assets/images/222.png'),
    ),
    PageViewModel(
      title: "Easy Ordering",
      body: '''Ordering has never been easier!
With our intuitive interface, you can place your order
in just a few taps. Customize your meal, select pickup or delivery,
and track your order in real-time. Enjoy convenience at its best!
''',
      footer: Column(
        children: [
          SizedBox(
            width: 180,
            height: 45,
            child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                    backgroundColor: Color.fromARGB(255, 255, 249, 218),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10)),
                    elevation: 8),
                onPressed: () {},
                child: const Text("Let's get started!",
                    style: TextStyle(
                        fontWeight: FontWeight.w400,
                        fontSize: 16.0,
                        color: Colors.black))),
          ),
        ],
      ),
      image: Image.asset('assets/images/menus.png'),
    ),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 244, 230, 162),
        title: const Text('Restaurant',
            style: TextStyle(
                fontWeight: FontWeight.w400,
                fontSize: 24.0,
                color: Colors.black)),
        centerTitle: true,
      ),
      body: Container(
        color: const Color.fromARGB(255, 255, 248, 210),
        child: Column(
          children: [
            const SizedBox(
              height: 50,
            ),
            Expanded(
              child: IntroductionScreen(
                globalBackgroundColor: const Color.fromARGB(255, 255, 248, 210),
                pages: pages,
                showSkipButton: true,
                skip: const Text('Skip',
                    style: TextStyle(
                      fontWeight: FontWeight.w400,
                      fontSize: 18.0,
                      color: Colors.black,
                    )),
                showDoneButton: true,
                done: const Text('Finish',
                    style: TextStyle(
                      fontWeight: FontWeight.w400,
                      fontSize: 18.0,
                      color: Colors.black,
                    )),
                showNextButton: true,
                next: const Icon(Icons.arrow_right, color: Colors.black),
                onDone: () => onDone(context),
                curve: Curves.bounceOut,
                dotsDecorator: const DotsDecorator(
                    size: Size(14, 14),
                    color: Colors.lightBlue,
                    activeColor: Colors.blue,
                    activeSize: Size.square(17)),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void onDone(context) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool('ON_BOARDING', false);
    Navigator.pushReplacement(
        context, MaterialPageRoute(builder: (context) => HomeScreen()));
  }
}
