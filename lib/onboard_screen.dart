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
            begin: Alignment.topCenter,
            end: Alignment.bottomRight,
            colors: [
              Color(0xff4A9EF7),
              Color(0xffFFFFFF),
            ],
          ),
        ),
        child: Stack(
          children: [
            Positioned(
              top: 0,
              left: 0,
              right: 0,
              bottom: 0,
              child: CustomPaint(
                painter: CircleBackgroundPainter(),
              ),
            ),
            Positioned(
              top: 90,
              left: -80,
              child: Image.asset(
                'images/sun.png',
                height: 175,
              ),
            ),
            Positioned(
              bottom: 170,
              right: -15,
              child: Image.asset(
                'images/cloud_onboard.png',
              ),
            ),
            Positioned(
              left: 50.0,
              right: 50.0,
              bottom: 115.0,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  const Text(
                    'Never get caught in the rain again',
                    style: TextStyle(
                      fontFamily: 'Overpass',
                      fontSize: 35,
                      fontWeight: FontWeight.w800,
                      color: Color(0xff494A4B),
                    ),
                  ),
                  const SizedBox(height: 15.0),
                  const Text(
                    'Stay ahead of the weather with our accurate forecasts',
                    style: TextStyle(
                      fontFamily: 'Overpass',
                      fontSize: 15,
                      fontWeight: FontWeight.w400,
                      color: Color(0xff494A4B),
                    ),
                  ),
                  const SizedBox(height: 20.0),
                  ElevatedButton(
                    onPressed: () {
                       Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const HomeScreen(),
                        ),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.white,
                      foregroundColor: const Color(0xFF444E72),
                      minimumSize: const Size(306, 64),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                      elevation: 10,
                      shadowColor: Colors.black26,
                    ),
                    child: const Text(
                      'Get Started',
                      style: TextStyle(
                        fontFamily: 'Overpass',
                        fontSize: 17,
                        fontWeight: FontWeight.w400,
                        color: Color(0xFF444E72),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class CircleBackgroundPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final Paint paint = Paint()
      ..color = Colors.white.withOpacity(0.2)
      ..style = PaintingStyle.stroke
      ..strokeWidth = 1;

    final Offset center = Offset(size.width * 0.7, size.height * 0.3);
    for (double radius = 60; radius < 300; radius += 60) {
      canvas.drawCircle(center, radius, paint);
    }
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}
