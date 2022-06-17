import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:weather_mobile/ui/city_screen.dart';
import 'package:weather_mobile/ui/home_screen.dart';
import 'package:weather_mobile/ui/onboarding_screen.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final prefs = await SharedPreferences.getInstance();
  final showHome = prefs.getBool('showHome') ?? false;
  runApp(WeatherApp(showHome: showHome));
}

class WeatherApp extends StatefulWidget {
  const WeatherApp({Key? key, required this.showHome}) : super(key: key);

  final bool showHome;

  @override
  State<WeatherApp> createState() => _WeatherAppState();
}

class _WeatherAppState extends State<WeatherApp> {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        fontFamily: 'DMSans',
      ),
      initialRoute: widget.showHome ? HomeScreen.id : OnboardingScreen.id,
      routes: {
        HomeScreen.id: (context) => const HomeScreen(),
        CityScreen.id: (context) => const CityScreen(),
        OnboardingScreen.id: (context) => const OnboardingScreen()
      },
    );
  }
}
