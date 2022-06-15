import 'package:flutter/material.dart';
import 'package:weather_mobile/utils/constants.dart';
import 'package:intl/intl.dart';
import 'package:weather_mobile/networking/networking.dart';

DateTime dateTime = DateTime.now();

class CityScreen extends StatefulWidget {
  const CityScreen({Key? key}) : super(key: key);
  static const id = 'CityScreen';

  @override
  State<CityScreen> createState() => _CityScreenState();
}

class _CityScreenState extends State<CityScreen> {

  final WeatherData _weatherData = WeatherData();

  String? _cityName;
  int? temperature;
  String? city;
  String? country;
  final TextEditingController _controller = TextEditingController();
  String currentDate = DateFormat('E, d MMM').format(dateTime);
  String currentTime = DateFormat('h:mm a').format(dateTime);
  var cityTime;

  void getAllValues() async{
    var finalCityData = await _weatherData.getCityWeatherData(_cityName);
    try {
      setState(() {
        double? initialTemp = finalCityData['main']['temp'];
        temperature = initialTemp?.round();
        city = finalCityData['name'];
        country = finalCityData['sys']['country'];
        print(temperature);
        print(city);
        print(country);
      });
    } catch (e) {
      print(e);
    }
  }

  void getTime() async{
    var finalTimeData = await _weatherData.getCityTime(_cityName);
    try {
      setState(() {
        String? initialCityTime = finalTimeData['datetime'];
        cityTime = initialCityTime?.substring(11, 16);
      });
    } catch (e) {
      print(e);
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
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
        body: Padding(
          padding: EdgeInsets.fromLTRB(
              width / 16, height / 12, width / 16, height / 16),
          child: Column(children: [
            Row(
              children: [
                IconButton(
                  padding: const EdgeInsets.only(right: 15),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  icon: const Icon(Icons.arrow_back_ios_rounded),
                  color: Colors.white,
                ),
                Container(
                  padding: const EdgeInsets.all(5.0),
                  width: width * 0.6,
                  child: TextFormField(
                    controller: _controller,
                    onChanged: (value) {
                      _cityName = value;
                    },
                    style: const TextStyle(color: Colors.white),
                    cursorColor: Colors.white,
                    decoration: InputDecoration(
                      fillColor: kHomeScreenLocationButtonColor,
                      filled: true,
                      prefixIcon: const Icon(Icons.location_on, color: Colors.white,),
                      suffixIcon: IconButton(
                        onPressed: () {
                          _controller.clear();
                          getAllValues();
                          getTime();
                        },
                        icon: const Icon(
                          Icons.search,
                          color: Colors.white,
                        ),
                      ),
                      hintText: 'e.g Abuja, Nigeria',
                      hintStyle: const TextStyle(color: Colors.white54, fontSize: 15),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                        borderSide: BorderSide.none
                      ),
                      contentPadding: const EdgeInsets.all(10)
                    ),
                  ),
                )
              ],
            ),
            SizedBox(height: height * 0.12),
            Container(
              decoration: BoxDecoration(
                  color: kHomeScreenLocationButtonColor,
                  borderRadius: BorderRadius.circular(15),
                  border: Border.all(color: kBorderAndTextColor)),
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: width * 0.12, vertical: height * 0.05),
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.asset(
                            'images/cloud_pic.png',
                            width: width * 0.21,
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          Column(
                            children: [
                              const Text(
                                'Today',
                                style: TextStyle(
                                    fontSize: 25, color: Colors.white),
                              ),
                              Text(
                                currentDate,
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
                            temperature == null ? '--' : temperature.toString(),
                            style:
                            const TextStyle(fontSize: 150, color: Colors.white),
                          ),
                          Padding(
                            padding: EdgeInsets.only(bottom: width * 0.26),
                            child: const Text(
                              '°C',
                              style: TextStyle(
                                  fontSize: 25, color: Colors.white),
                            ),
                          )
                        ],
                      ),
                      Text(
                        temperature == null ? '-- -- • -- --' : '$city, $country • $cityTime',
                        style: const TextStyle(fontSize: 20, color: Colors.white),
                      )
                    ],
                  ),
                ),
              ),
            ),
          ]),
        ),
      ),
    );
  }
}
