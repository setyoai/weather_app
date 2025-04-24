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
        child: Stack(
          children: [
            Positioned(
              top: 50,
              left: 0,
              child: Image.asset(
                'images/sun.png',
                height: 150,
              ),
            ),
            Positioned.fill(
              child: CustomPaint(
                painter: CircleBackgroundPainter(),
              ),
            ),
            Positioned(
              bottom: 120,
              right: 0,
              child: Image.asset(
                'images/cloud_onboard.png',
                height: 400,
                fit: BoxFit.cover,
              ),
            ),
            Positioned(
              bottom: 100,
              left: 50,
              right: 50,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const Text(
                    'Never get caught in the rain again',
                    textAlign: TextAlign.start,
                    style: TextStyle(
                      fontFamily: 'Overpass',
                      fontSize: 35,
                      fontWeight: FontWeight.w700,
                      color: Color(0xFF494A4B),
                    ),
                  ),
                  const SizedBox(height: 20.0),
                  const Text(
                    'Stay ahead of the weather with our accurate forecasts',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontFamily: 'Overpass',
                      fontSize: 15,
                      fontWeight: FontWeight.w400,
                      color: Color(0xFF494A4B),
                    ),
                  ),
                  const SizedBox(height: 20),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.white,
                      foregroundColor: const Color(0xFF444E72),
                      minimumSize: const Size(306, 64),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                      elevation: 4,
                      shadowColor: Colors.black26,
                    ),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const HomeScreen(),
                        ),
                      );
                    },
                    child: const Text(
                      style: TextStyle(
                        fontFamily: 'Overpass',
                        fontSize: 17,
                        fontWeight: FontWeight.w400,
                        color: Color(0xFF444E72),
                      ),
                      'Get Started',
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
