import 'package:flutter/material.dart';
import 'package:weather_app/detail_weather.dart';
// import 'package:weather_app/detail_weather.dart';
// import 'package:weather_app/home_screen.dart';
import 'package:weather_app/onboard_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const OnboardScreen(),
    );
  }
}
