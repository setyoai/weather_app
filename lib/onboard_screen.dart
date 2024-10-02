import 'package:flutter/material.dart';

class OnboardScreen extends StatelessWidget {
  const OnboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
            image: DecorationImage(
                image: AssetImage('images/onboard.png'), fit: BoxFit.fill)),
        child: Container(
          margin: const EdgeInsets.only(right: 50, left: 50.0, bottom: 150.0),
          alignment: Alignment.center,
          child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: <Widget>[
                const Text(
                    style: TextStyle(
                        fontFamily: 'Overpass',
                        fontSize: 35,
                        fontWeight: FontWeight.w700,
                        color: Color(0xFF494A4B)),
                    'Never get caught in the rain again'),
                const SizedBox(height: 20.0),
                const Text(
                    style: TextStyle(
                        fontFamily: 'Overpass',
                        fontSize: 15,
                        fontWeight: FontWeight.w400,
                        color: Color(0xFF494A4B)),
                    'Stay ahead of the weather with our accurate forecasts'),
                const SizedBox(height: 20.0),
                ElevatedButton(
                  style: ButtonStyle(
                      fixedSize:
                          WidgetStateProperty.all<Size>(const Size(306, 64))),
                  child: const Text(
                      style: TextStyle(
                          fontFamily: 'Overpass',
                          fontSize: 17,
                          fontWeight: FontWeight.w400,
                          color: Color(0xFF444E72)),
                      'Get Started'),
                  onPressed: () {},
                )
              ]),
        ),
      ),
    );
  }
}
