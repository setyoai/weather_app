import 'package:flutter/material.dart';
import 'package:weather_app/home_screen.dart';

class OnboardScreen extends StatelessWidget {
  const OnboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topRight,
            end: Alignment.bottomLeft,
            colors: [
              Color(0xff47BFDF),
              Color(0xff4A91FF),
            ],
          ),
        ),
        child: Padding(
          padding:
              const EdgeInsets.symmetric(horizontal: 50.0, vertical: 100.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: <Widget>[
              const Text(
                style: TextStyle(
                  fontFamily: 'Overpass',
                  fontSize: 35,
                  fontWeight: FontWeight.w700,
                  color: Color(0xFF494A4B),
                ),
                'Never get caught in the rain again',
              ),
              const SizedBox(height: 20.0),
              const Text(
                style: TextStyle(
                  fontFamily: 'Overpass',
                  fontSize: 15,
                  fontWeight: FontWeight.w400,
                  color: Color(0xFF494A4B),
                ),
                'Stay ahead of the weather with our accurate forecasts',
              ),
              const SizedBox(height: 20.0),
              ElevatedButton(
                style: ButtonStyle(
                  fixedSize: WidgetStateProperty.all<Size>(
                    const Size(306, 64),
                  ),
                ),
                child: const Text(
                  style: TextStyle(
                    fontFamily: 'Overpass',
                    fontSize: 17,
                    fontWeight: FontWeight.w400,
                    color: Color(0xFF444E72),
                  ),
                  'Get Started',
                ),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const HomeScreen(),
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
