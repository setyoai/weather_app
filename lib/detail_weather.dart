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
    return Scaffold(
      body: SafeArea(
        child: Stack(children: <Widget>[
          Container(
            decoration: const BoxDecoration(
              gradient: backgroundGradient
            ),
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  const SizedBox(height: 30),
                  IconButton(
                    color: Colors.white,
                    icon: const Icon(Icons.arrow_back_outlined),
                    onPressed: () {},
                  ),
                  const SizedBox(height: 40),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: <Widget>[
                      const Text(
                        'Next Forecast',
                        style: TextStyle(
                          shadows: [
                            Shadow(
                                blurRadius: 1.0, // shadow blur
                                color: Color(0xff74B1DE), // shadow color
                                offset: Offset(-2.0, 3.0))
                          ],
                          fontFamily: 'Overpass',
                          fontSize: 24.0,
                          fontWeight: FontWeight.w700,
                          color: Colors.white,
                        ),
                      ),
                      Text(
                        style: const TextStyle(
                          shadows: [
                            Shadow(
                                blurRadius: 1.0, // shadow blur
                                color: Color(0xff74B1DE), // shadow color
                                offset: Offset(-2.0, 3.0))
                          ],
                          fontFamily: 'Overpass',
                          fontSize: 18.0,
                          fontWeight: FontWeight.w500,
                          color: Colors.white,
                        ),
                        DateFormat('MMMMEEEEd').format(now),
                      ),
                    ],
                  ),
                  const SizedBox(height: 50),
                  const Expanded(
                    child: WeatherListData(
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
  const WeatherListData({super.key, required this.backgroundGradient});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
        itemCount: weatherDataList.length,
        itemBuilder: (context, index) {
          final WeatherData weather = weatherDataList[index];
          return Container(
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
