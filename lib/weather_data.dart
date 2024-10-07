import 'package:flutter/cupertino.dart';

class WeatherData {
  String date;
  Image imageWeather;
  String temperature;

  WeatherData(
      {required this.date,
      required this.imageWeather,
      required this.temperature});
}

var weatherDataList = [
  WeatherData(
      date: 'Oct 04',
      imageWeather: Image.asset('images/weather/thunder.png'),
      temperature: '21°C'
  ),
  WeatherData(
      date: 'Oct 04',
      imageWeather: Image.asset('images/weather/rain.png'),
      temperature: '21°C'
  ),
  WeatherData(
      date: 'Oct 05',
      imageWeather: Image.asset('images/weather/sunny.png'),
      temperature: '22°C'
  ),
  WeatherData(
      date: 'Oct 06',
      imageWeather: Image.asset('images/weather/cloudy.png'),
      temperature: '34°C'
  ),
  WeatherData(
      date: 'Oct 07',
      imageWeather: Image.asset('images/weather/sun_cloudy.png'),
      temperature: '27°C'
  ),
  WeatherData(
      date: 'Oct 08',
      imageWeather: Image.asset('images/weather/thunder.png'),
      temperature: '20°C'
  ),
  WeatherData(
      date: 'Oct 09',
      imageWeather: Image.asset('images/weather/sunny.png'),
      temperature: '23°C'
  ),
  WeatherData(
      date: 'Oct 10',
      imageWeather: Image.asset('images/weather/cloudy.png'),
      temperature: '31°C'
  ),
];
