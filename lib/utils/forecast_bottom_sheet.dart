import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:weather_mobile/networking/daily_forecast_model.dart';
import 'package:weather_mobile/utils/utils.dart';
import 'package:weather_mobile/networking/networking.dart';

DateTime get dateTime => DateTime.now();
WeatherData _weatherData = WeatherData();

void showForecastBottomSheet(BuildContext context) async {
  List<Hourly> _hourlyWeather = await _weatherData.getHourlyWeather();
  List<Daily> _dailyWeather = await _weatherData.getDailyWeather();

  showModalBottomSheet(
    backgroundColor: Colors.transparent,
    isScrollControlled: true,
    context: (context),
    builder: (context) {
      var size = MediaQuery.of(context).size;
      var width = size.width;
      var height = size.height;
      return Wrap(children: [
        Container(
          //height: height * 0.8,
          decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(30),
                topRight: Radius.circular(30),
              )),
          child: Padding(
            padding: EdgeInsets.symmetric(
                vertical: width / 40, horizontal: width / 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Divider(
                  indent: width * 0.33,
                  endIndent: width * 0.33,
                  color: Colors.grey,
                  thickness: 3,
                ),
                kSpace,
                Center(
                  child: GestureDetector(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: Container(
                      decoration: kTransparentDecoration,
                      child: Padding(
                        padding: EdgeInsets.symmetric(
                            horizontal: width * 0.11, vertical: height * 0.012),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: const [
                            Text(
                              'Forecast report',
                              style: TextStyle(
                                  color: Colors.blueGrey, fontSize: 15),
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Icon(
                              Icons.keyboard_arrow_down_rounded,
                              color: Colors.blueGrey,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
                kSpace,
                const Text(
                  'Today',
                  style: kBottomSheetTextStyle,
                ),
                kSpace,
                Container(
                  height: height * 0.15,
                  width: double.infinity,
                  padding: const EdgeInsets.all(5),
                  decoration: BoxDecoration(
                      border: Border.all(color: kColorForecastBoxColor),
                      borderRadius: BorderRadius.circular(10)),
                  child: _hourlyWeather.isEmpty
                      ? const CircularProgressIndicator(
                          backgroundColor: Colors.transparent,
                          color: Colors.blueGrey,
                        )
                      : Row(
                          mainAxisSize: MainAxisSize.min,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            ListView.builder(
                              shrinkWrap: true,
                              physics: const NeverScrollableScrollPhysics(),
                              scrollDirection: Axis.horizontal,
                              itemCount: 5,
                              itemBuilder: (context, index) {
                                return BuildHourlyForecast(
                                  width: width,
                                  height: height,
                                  temp: _hourlyWeather[index].temp?.toInt(),
                                  time: DateFormat('h:mm a').format(
                                      dateTime.add(Duration(hours: 1 + index))),
                                  image: _weatherData.getWeatherIcon(
                                      _hourlyWeather[index].weather?.first.id ??
                                          800),
                                );
                              },
                            ),
                          ],
                        ),
                ),
                kSpace,
                kSpace,
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text('Next Forecast', style: kBottomSheetTextStyle),
                    Container(
                      decoration: BoxDecoration(
                          color: Colors.blueGrey,
                          borderRadius: BorderRadius.circular(10)),
                      child: Padding(
                        padding: EdgeInsets.symmetric(
                            vertical: height * 0.01, horizontal: width * 0.07),
                        child: const Center(
                            child: Text(
                          'Five Days',
                          style: TextStyle(color: Colors.white, fontSize: 15),
                        )),
                      ),
                    )
                  ],
                ),
                kSpace,
                Container(
                  height: height * 0.38,
                  decoration: BoxDecoration(
                      border: Border.all(color: kColorForecastBoxColor),
                      borderRadius: BorderRadius.circular(10)),
                  child: Padding(
                    padding: EdgeInsets.symmetric(
                        horizontal: width * 0.09, vertical: height * 0.01),
                    child: _dailyWeather.isEmpty
                        ? const CircularProgressIndicator(
                            backgroundColor: Colors.transparent,
                            color: Colors.blueGrey,
                          )
                        : Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              ListView.builder(
                                physics: const NeverScrollableScrollPhysics(),
                                shrinkWrap: true,
                                itemCount: 5,
                                itemBuilder: (context, index) {
                                  return BuildDailyWeather(
                                    date: DateFormat('d MMMM').format(dateTime
                                        .add(Duration(days: 1 + index))),
                                    width: width,
                                    height: height,
                                    temp:
                                        _dailyWeather[index].temp?.day?.toInt(),
                                    image: _weatherData.getWeatherIcon(
                                        _dailyWeather[index]
                                                .weather
                                                ?.first
                                                .id ??
                                            800),
                                  );
                                },
                              ),
                            ],
                          ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ]);
    },
  );
}
