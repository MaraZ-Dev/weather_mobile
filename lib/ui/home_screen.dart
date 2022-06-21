import 'package:flutter/material.dart';
import 'package:weather_mobile/ui/city_screen.dart';
import 'package:weather_mobile/networking/networking.dart';
import 'package:intl/intl.dart';
import 'package:weather_mobile/utils/utils.dart';


///Initialize Weather class;
WeatherData _weatherData = WeatherData();

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  static const id = 'HomeScreen';

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  /// Declare all my needed variables
  int? temperature;
  String? city;
  String? country;
  int? conditionCode;
  String? currentDate;
  String? currentTime;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    ///Start all the processes at initial launch
    setState(() {
      DateTime dateTime = DateTime.now();
      getAllValues();
      currentDate = DateFormat('E, d MMM').format(dateTime);
      currentTime = DateFormat('h:mm a').format(dateTime);
    });
  }

  /// Get the required data from the API response
  void getAllValues() async {
    var finalWeatherData = await _weatherData.getCurrentWeatherData();
    try {
      setState(() {
        double? initialTemperature = finalWeatherData['main']['temp'];
        temperature = initialTemperature?.round();
        city = finalWeatherData['name'];
        country = finalWeatherData['sys']['country'];
        conditionCode = finalWeatherData['weather'].first['id'];
        print(conditionCode);
      });
    } catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    var height = size.height;
    var width = size.width;

    return Container(
      decoration: kScaffoldDecoration,
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: SafeArea(
          child: Padding(
            padding: EdgeInsets.fromLTRB(
                width / 16, height / 16, width / 16, height / 16),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    ///Search Location Button
                    GestureDetector(
                      onTap: () {
                        Navigator.pushNamed(context, CityScreen.id);
                      },
                      child: Container(
                        decoration: BoxDecoration(
                            color: kHomeScreenLocationButtonColor,
                            borderRadius: BorderRadius.circular(20)),
                        child: Padding(
                          padding: EdgeInsets.symmetric(
                              horizontal: width * 0.06,
                              vertical: height * 0.012),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: const [
                              Icon(
                                Icons.location_on,
                                color: Colors.white,
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              Text(
                                'Search Location',
                                style: TextStyle(
                                    color: Colors.white, fontSize: 15),
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                    ///Notifications Button
                    GestureDetector(
                      onTap: () {
                        showNotificationBottomSheet(context);
                      },
                      child: Container(
                        width: width * 0.130,
                        height: height * 0.060,
                        decoration: BoxDecoration(
                            color: kHomeScreenLocationButtonColor,
                            borderRadius: BorderRadius.circular(10)),
                        child: const Icon(
                          Icons.notifications,
                          color: Colors.white,
                        ),
                      ),
                    )
                  ],
                ),
                ///The Weather Container
                Container(
                  decoration: BoxDecoration(
                      color: kHomeScreenLocationButtonColor,
                      borderRadius: BorderRadius.circular(15),
                      border: Border.all(color: kBorderAndTextColor)),
                  child: Padding(
                    padding: EdgeInsets.symmetric(
                        horizontal: width * 0.12, vertical: height * 0.03),
                    child: Center(
                      child: temperature == null
                          ? const CircularProgressIndicator(
                              backgroundColor: Colors.transparent,
                              color: Colors.white,
                            )
                          : Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Image.asset(
                                      _weatherData.getWeatherIcon(conditionCode!),
                                      width: width * 0.35,
                                    ),
                                    const SizedBox(
                                      width: 10,
                                    ),
                                    Column(
                                      children: [
                                        const Text(
                                          'Today',
                                          style: TextStyle(
                                              fontSize: 25,
                                              color: Colors.white),
                                        ),
                                        Text(
                                          currentDate!,
                                          style: const TextStyle(color: Colors.white),
                                        )
                                      ],
                                    )
                                  ],
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Text(
                                      '$temperature',
                                      style: const TextStyle(
                                          fontSize: 145, color: Colors.white),
                                    ),
                                    Padding(
                                      padding:
                                          EdgeInsets.only(bottom: width * 0.26),
                                      child: const Text(
                                        '°C',
                                        style: TextStyle(
                                            fontSize: 25, color: Colors.white),
                                      ),
                                    )
                                  ],
                                ),
                                Text(
                                  '$city, $country • $currentTime',
                                  style: const TextStyle(
                                      fontSize: 20, color: Colors.white),
                                ),
                              ],
                            ),
                    ),
                  ),
                ),
                ///Forecast Report Button
                Material(
                  borderRadius: BorderRadius.circular(8),
                  color: kHomeScreenLocationButtonColor,
                  child: MaterialButton(
                    onPressed: () {
                      showForecastBottomSheet(context);
                    },
                    elevation: 0,
                    height: height * 0.07,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: const [
                        Text(
                          'Forecast report',
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 20,
                              fontWeight: FontWeight.bold),
                        ),
                        SizedBox(
                          width: 20,
                        ),
                        Icon(
                          Icons.keyboard_arrow_up_outlined,
                          color: Colors.white,
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
