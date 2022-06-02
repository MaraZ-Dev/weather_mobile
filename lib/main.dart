import 'package:flutter/material.dart';
import 'package:weather_mobile/screens/city_screen.dart';
import 'package:weather_mobile/screens/home_screen.dart';

void main() => runApp(const WeatherApp());

class WeatherApp extends StatelessWidget {
  const WeatherApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        fontFamily: 'DMSans',
      ),
      initialRoute: HomeScreen.id,
      routes: {
        HomeScreen.id : (context) => const HomeScreen(),
        CityScreen.id : (context) => const CityScreen()
      },
    );
  }
}
