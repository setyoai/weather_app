import 'package:flutter/material.dart';
import 'package:weather_app/weather_data.dart';

class DetailScreen extends StatelessWidget {
  const DetailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraints) {
          if (constraints.maxWidth <= 600) {
            return const WeatherListData();
          } else if (constraints.maxWidth <= 1200) {
            return const WeatherGridData(gridCount: 4);
          } else {
            return const WeatherGridData(gridCount: 6);
          }
        },
      ),
    );
  }
}

class WeatherListData extends StatelessWidget {
  const WeatherListData({super.key});

  @override
  Widget build(BuildContext context) {
    const LinearGradient backgroundGradient = LinearGradient(
      begin: Alignment.topRight,
      end: Alignment.bottomLeft,
      colors: [
        Color(0xff47BFDF),
        Color(0xff4A91FF),
      ],
    );

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
                  child: ListView.builder(
                    itemCount: weatherDataList.length,
                    itemBuilder: (context, index) {
                      final WeatherData weather = weatherDataList[index];
                      return Container(
                        height: screenHeight *
                            0.15, // Set height sesuai layar (15% dari tinggi layar)
                        width: screenWidth, // Set width sesuai layar
                        decoration: const BoxDecoration(
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
                ),
              ],
            ),
          ),
        ]),
      ),
    );
  }
}

class WeatherGridData extends StatelessWidget {
  final int gridCount;

  const WeatherGridData({super.key, required this.gridCount});

  @override
  Widget build(BuildContext context) {
    const LinearGradient backgroundGradient = LinearGradient(
      begin: Alignment.topRight,
      end: Alignment.bottomLeft,
      colors: [
        Color(0xff47BFDF),
        Color(0xff4A91FF),
      ],
    );

    return Container(
      decoration: const BoxDecoration(gradient: backgroundGradient),
      child: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
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
                fontSize: 32,
                fontFamily: 'Overpass',
                fontWeight: FontWeight.w700,
                color: Colors.white,
              ),
            ),
            const SizedBox(height: 25.0),
            Expanded(
              child: GridView.count(
                crossAxisCount: gridCount,
                crossAxisSpacing: 16,
                mainAxisSpacing: 16,
                children: weatherDataList.map((weather) {
                  return InkWell(
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.white.withOpacity(0.3),
                        border: Border.all(color: Colors.white, width: 2),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(vertical: 8.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
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
                            Expanded(
                              child: SizedBox(
                                child: weather.imageWeather,
                              ),
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
                      ),
                    ),
                  );
                }).toList(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
