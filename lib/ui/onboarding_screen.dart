import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:weather_mobile/ui/home_screen.dart';
import 'package:weather_mobile/utils/utils.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({Key? key}) : super(key: key);

  static const id = 'OnboardingScreen';

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final _controller = PageController();
  bool isLastPage = false;

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    var height = size.height;
    var width = size.width;

    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        padding: EdgeInsets.only(bottom: height * 0.1),
        child: PageView(
          controller: _controller,
          onPageChanged: (index) {
            setState(() {
              isLastPage = index == 2;
            });
          },
          children: [
            BuildOnboarding(
              width: width,
              image: 'images/current_weather.png',
              title: 'Current Weather',
              description:
                  'Check the current weather of your present location at any point in time.',
            ),
            BuildOnboarding(
              width: width,
              image: 'images/city_weather.png',
              title: 'Any Location',
              description:
                  'Check the weather of any location you want to know about',
            ),
            BuildOnboarding(
              width: width,
              image: 'images/forecast_weather.png',
              title: 'Forecast Report',
              description:
                  'Check the hourly and daily forecast of your current location at any point in time in order to plan your day ahead',
            )
          ],
        ),
      ),
      bottomSheet: isLastPage
          ? GestureDetector(
              onTap: () async {
                Navigator.pushNamed(context, HomeScreen.id);

                final prefs = await SharedPreferences.getInstance();
                prefs.setBool('showHome', true);
              },
              child: Container(
                color: Colors.white,
                padding: EdgeInsets.symmetric(vertical: height * 0.02),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    const Text(
                      'Get Started',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontSize: 24,
                          color: Colors.blueGrey,
                          fontWeight: FontWeight.bold),
                    ),
                    const Icon(
                      Icons.keyboard_double_arrow_right,
                      color: Colors.blueGrey,
                    ),
                    SizedBox(
                      width: width * 0.04,
                    )
                  ],
                ),
              ),
            )
          : Container(
              color: Colors.white,
              padding: EdgeInsets.symmetric(vertical: height * 0.02),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  TextButton(
                      onPressed: () => _controller.jumpToPage(2),
                      child: const Text(
                        "SKIP",
                        style: TextStyle(color: Colors.blueGrey, fontSize: 15),
                      )),
                  SmoothPageIndicator(
                    controller: _controller,
                    count: 3,
                    effect: WormEffect(
                      dotHeight: height * 0.01,
                      dotWidth: width * 0.05,
                      type: WormType.thin,
                      activeDotColor: Colors.blueGrey,
                      dotColor: Colors.black12,
                    ),
                    onDotClicked: (index) {
                      _controller.animateToPage(index,
                          duration: const Duration(seconds: 1),
                          curve: Curves.easeInBack);
                    },
                  ),
                  TextButton(
                      onPressed: () {
                        setState(() {
                          _controller.nextPage(
                              duration: const Duration(seconds: 1),
                              curve: Curves.easeInBack);
                        });
                      },
                      child: const Text("NEXT",
                          style:
                              TextStyle(color: Colors.blueGrey, fontSize: 15)))
                ],
              ),
            ),
    );
  }
}

