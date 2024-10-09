import 'package:flutter/material.dart';
import 'package:weather_app/weather_data.dart';
import 'package:intl/intl.dart';

import 'home_screen.dart';

class DetailWeather extends StatelessWidget {
  const DetailWeather({super.key});

  @override
  Widget build(BuildContext context) {
    const LinearGradient backgroundGradient = LinearGradient(
        begin: Alignment.topRight,
        end: Alignment.bottomLeft,
        colors: [
          Color(0xff47BFDF),
          Color(0xff4A91FF),
        ]);

    final Size screenSize = MediaQuery.of(context).size;
    final double screenHeight = screenSize.height;
    final double screenWidth = screenSize.width;

    return Scaffold(
      body: SafeArea(
        child: Stack(children: <Widget>[
          Container(
            height: screenHeight,
            width: screenWidth,
            decoration: const BoxDecoration(gradient: backgroundGradient),
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  const SizedBox(height: 30),
                  IconButton(
                    color: Colors.white,
                    icon: const Icon(Icons.arrow_back_outlined),
                    onPressed: () {
                      Navigator.pop(context);
                    },
                  ),
                  const SizedBox(height: 40),
                  const Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: <Widget>[
                      Text(
                        'Next Forecast',
                        style: TextStyle(
                          shadows: [
                            Shadow(
                                blurRadius: 1.0, // shadow blur
                                color: Color(0xff74B1DE), // shadow color
                                offset: Offset(-2.0, 3.0))
                          ],
                          fontFamily: 'Overpass',
                          fontSize: 20.0,
                          fontWeight: FontWeight.w700,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 50),
                  Expanded(
                    child: WeatherListData(
                      screenHeight: screenHeight,
                      screenWidth: screenWidth,
                      backgroundGradient: backgroundGradient,
                    ),
                  ),
                ]),
          ),
        ]),
      ),
    );
  }
}

class WeatherListData extends StatelessWidget {
  final LinearGradient backgroundGradient;
  final double screenHeight;
  final double screenWidth;

  const WeatherListData({
    super.key,
    required this.backgroundGradient,
    required this.screenHeight,
    required this.screenWidth,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
        itemCount: weatherDataList.length,
        itemBuilder: (context, index) {
          final WeatherData weather = weatherDataList[index];
          return Container(
            height: screenHeight *
                0.15, // Set height sesuai layar (15% dari tinggi layar)
            width: screenWidth, // Set width sesuai layar
            decoration: BoxDecoration(
              gradient: backgroundGradient,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  weather.date,
                  style: const TextStyle(
                    shadows: [
                      Shadow(
                          blurRadius: 1.0, // shadow blur
                          color: Color(0xff74B1DE), // shadow color
                          offset: Offset(-2.0, 3.0))
                    ], // how much shadow will be shown
                    fontFamily: 'Overpass',
                    fontSize: 18.0,
                    fontWeight: FontWeight.w700,
                    color: Colors.white,
                  ),
                ),
                SizedBox(
                  width: 100,
                  height: 100,
                  child: weather.imageWeather,
                ),
                Text(
                  weather.temperature,
                  style: const TextStyle(
                    shadows: [
                      Shadow(
                          blurRadius: 1.0, // shadow blur
                          color: Color(0xff74B1DE), // shadow color
                          offset: Offset(-2.0, 3.0))
                    ], // how much shadow will be shown
                    fontFamily: 'Overpass',
                    fontSize: 18.0,
                    fontWeight: FontWeight.w400,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
