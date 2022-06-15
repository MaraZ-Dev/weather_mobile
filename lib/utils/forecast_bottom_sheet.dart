import 'package:flutter/material.dart';
import 'package:weather_mobile/utils/utils.dart';

void showForecastBottomSheet(BuildContext context) {
  showModalBottomSheet(
    backgroundColor: Colors.transparent,
    isScrollControlled: true,
    context: (context),
    builder: (context) {
      var size = MediaQuery.of(context).size;
      var width = size.width;
      var height = size.height;
      return Wrap(alignment: WrapAlignment.center, children: [
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
                  padding: const EdgeInsets.all(5),
                  decoration: BoxDecoration(
                      border: Border.all(color: kColorForecastBoxColor),
                      borderRadius: BorderRadius.circular(10)),
                  child: Center(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        buildHourlyWeather(width, height),
                        buildHourlyWeather(width, height),
                        buildHourlyWeather(width, height),
                        buildHourlyWeather(width, height),
                        buildHourlyWeather(width, height)
                      ],
                    ),
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
                  decoration: BoxDecoration(
                      border: Border.all(color: kColorForecastBoxColor),
                      borderRadius: BorderRadius.circular(10)),
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: width * 0.09, vertical: height * 0.024),
                    child: Column(
                      children: [
                        buildDailyWeather(width, height),
                        buildDailyWeather(width, height),
                        buildDailyWeather(width, height),
                        buildDailyWeather(width, height),
                        buildDailyWeather(width, height)
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
