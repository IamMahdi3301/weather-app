import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';
import 'package:weatherapp/service/weather_service.dart';
import 'package:weatherapp/models/weather_model.dart';

class WeatherPage extends StatefulWidget {
  const WeatherPage({super.key});

  @override
  State<WeatherPage> createState() => _WeatherPageState();
}

class _WeatherPageState extends State<WeatherPage> {
  final _weatherService = WeatherService(
    apiKey: "7dfbe705c618e04790ab0272595ec62a",
  );

  Weather? _weather;

  _fetchWeather() async {
    String cityName = await _weatherService.GetCityName();

    try {
      final weather = await _weatherService.GetWeather(cityName);
      setState(() {
        _weather = weather;
      });
    } catch (e) {
      print(e.toString());
    }
  }

  @override
  void initState() {
    super.initState();
    _fetchWeather();
  }

  @override
  Widget build(BuildContext context) {
    String lottieAnimationLocation = "assets/Weather-partly shower.json";

    if (_weather?.mainCondition.toLowerCase() == "cloulds") {
      lottieAnimationLocation = "assets/Weather-windy.json";
    } else if (_weather?.mainCondition.toLowerCase() == "clear") {
      lottieAnimationLocation = "assets/Weather-sunny.json";
    } else if (_weather?.mainCondition.toLowerCase() == "stormy") {
      lottieAnimationLocation = "assets/Weather-storm.json";
    }

    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            //!show city Name
            Text(
              _weather?.cityName ?? "loading city...",
              style: GoogleFonts.jetBrainsMono(
                fontWeight: FontWeight.bold,
                fontSize: 20,
              ),
            ),

            Lottie.asset(lottieAnimationLocation),

            //!show temperature
            Text(
              ('${_weather?.tempreature.toString()}°C'),

              style: GoogleFonts.jetBrainsMono(
                fontWeight: FontWeight.bold,
                fontSize: 45,
              ),
            ),

            Text(
              "Feels Like : ${_weather?.feelsLike.toString()}",
              style: GoogleFonts.jetBrainsMono(
                fontWeight: FontWeight.bold,
                fontSize: 30,
              ),
            ),

            Text(
              _weather?.mainCondition ?? "loading",
              style: GoogleFonts.jetBrainsMono(
                fontSize: 35,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
