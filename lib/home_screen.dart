import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:weather_app/detail_weather.dart';

const List<String> city = <String>[
  'Semarang',
  'Surabaya',
  'Jakarta',
  'Bandung'
];

final now = DateTime.now();

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    const textStyle = TextStyle(
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
    );
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Expanded(
            child: Container(
              decoration: const BoxDecoration(
                  gradient: LinearGradient(
                      begin: Alignment.topRight,
                      end: Alignment.bottomLeft,
                      colors: [
                    Color(0xff47BFDF),
                    Color(0xff4A91FF),
                  ])),
              child: Column(children: <Widget>[
                Padding(
                  padding:
                      const EdgeInsets.only(top: 30.0, left: 25.0, right: 25.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Row(
                        children: <Widget>[
                          Image.asset('images/map.png'),
                          const SizedBox(width: 20.0),
                          const DropdownButtonCity(),
                        ],
                      ),
                      Image.asset('images/notif.png'),
                    ],
                  ),
                ),
                Image.asset('images/cloud.png'),
                Padding(
                  padding: const EdgeInsets.only(left: 30.0, right: 30.0),
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.white.withOpacity(0.3),
                      border: Border.all(color: Colors.white, width: 2),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.only(top: 30.0, bottom: 30.0),
                      child: Column(children: <Widget>[
                        Text(style: textStyle, DateFormat('MMMMEEEEd').format(now)),
                        Image.asset('images/temperature_number.png'),
                        const Text(
                          'Cloudy',
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
                        const SizedBox(height: 30.0),
                        Column(children: <Widget>[
                          Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                Image.asset('images/windy.png'),
                                const SizedBox(width: 15.0),
                                const Text(
                                  'Wind',
                                  style: textStyle,
                                ),
                                const SizedBox(width: 15.0),
                                Image.asset('images/line.png'),
                                const SizedBox(width: 15.0),
                                const Text(
                                  '10 km/h',
                                  style: textStyle,
                                ),
                              ]),
                          const SizedBox(height: 10.0),
                          Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                Image.asset('images/hum.png'),
                                const SizedBox(width: 15.0),
                                const Text(
                                  'Hum',
                                  style: textStyle,
                                ),
                                const SizedBox(width: 15.0),
                                Image.asset('images/line.png'),
                                const SizedBox(width: 15.0),
                                const Text(
                                  '54 %',
                                  style: textStyle,
                                ),
                              ])
                        ]),
                      ]),
                    ),
                  ),
                ),
                const SizedBox(height: 50.0),
                ElevatedButton(
                  style: ButtonStyle(
                      elevation: const WidgetStatePropertyAll(5),
                      fixedSize:
                          WidgetStateProperty.all<Size>(const Size(220, 64))),
                  child: const Text(
                      style: TextStyle(
                          fontFamily: 'Overpass',
                          fontSize: 18,
                          fontWeight: FontWeight.w400,
                          color: Color(0xFF444E72)),
                      'Weather Detail'),
                  onPressed: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context) => const DetailWeather()));
                  },
                )
              ]),
            ),
          ),
        ),
      ),
    );
  }
}

class DropdownButtonCity extends StatefulWidget {
  const DropdownButtonCity({super.key});
  @override
  State<DropdownButtonCity> createState() => _DropdownButtonCityState();
}

class _DropdownButtonCityState extends State<DropdownButtonCity> {
  String dropdownValue = city.first;

  @override
  Widget build(BuildContext context) {
    return DropdownButton<String>(
      dropdownColor: const Color(0xff47BFDF),
      value: dropdownValue,
      style: const TextStyle(
          fontFamily: 'Overpass',
          fontSize: 20,
          fontWeight: FontWeight.w400,
          color: Colors.white),
      icon: const Icon(color: Colors.white, Icons.arrow_drop_down),
      // elevation: 2,
      onChanged: (String? value) {
        // This is called when the user selects an item.
        setState(() {
          dropdownValue = value!;
        });
      },
      items: city.map<DropdownMenuItem<String>>((String value) {
        return DropdownMenuItem(
          value: value,
          child: Text(value),
        );
      }).toList(),
    );
  }
}
