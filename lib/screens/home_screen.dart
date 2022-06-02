import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:weather_mobile/constants.dart';
import 'package:weather_mobile/screens/city_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  static const id = 'HomeScreen';

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  void showForecastBottomSheet() {
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
            height: height * 0.8,
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
                        width: width * 0.427,
                        height: height * 0.06,
                        decoration: kTransparentDecoration,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: const [
                            Text(
                              'Forecast report',
                              style: TextStyle(
                                  color: Colors.deepPurple, fontSize: 15),
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Icon(
                              Icons.keyboard_arrow_down_rounded,
                              color: Colors.deepPurple,
                            ),
                          ],
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
                    width: double.infinity,
                    height: height * 0.15,
                    decoration: BoxDecoration(
                        border: Border.all(color: kColorForecastBoxColor),
                        borderRadius: BorderRadius.circular(10)),
                  ),
                  kSpace,
                  kSpace,
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text('Next Forecast', style: kBottomSheetTextStyle),
                      Container(
                        width: width * 0.25,
                        height: height * 0.045,
                        decoration: BoxDecoration(
                            color: Colors.deepPurple,
                            borderRadius: BorderRadius.circular(10)),
                        child: const Center(
                            child: Text(
                          'Five Days',
                          style: TextStyle(color: Colors.white, fontSize: 15),
                        )),
                      )
                    ],
                  ),
                  kSpace,
                  Container(
                    width: double.infinity,
                    height: height * 0.3,
                    decoration: BoxDecoration(
                        border: Border.all(color: kColorForecastBoxColor),
                        borderRadius: BorderRadius.circular(10)),
                  ),
                ],
              ),
            ),
          ),
        ]);
      },
    );
  }

  void showNotificationBottomSheet() {
    showModalBottomSheet(
        backgroundColor: Colors.transparent,
        context: context,
        builder: (context) {
          var size = MediaQuery.of(context).size;
          var width = size.width;
          var height = size.height;
          return Wrap(
            children: [
              Container(
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
                            width: width * 0.427,
                            height: height * 0.06,
                            decoration: kTransparentDecoration,
                            child: const Center(
                              child: Text(
                                'Your Notifications',
                                style: TextStyle(
                                    color: Colors.deepPurple, fontSize: 15),
                              ),
                            ),
                          ),
                        ),
                      ),
                      kSpace,
                      const Text(
                        'New',
                        style: TextStyle(color: Color(0xFF737272)),
                      ),
                      const SizedBox(height: 5),
                      Container(
                        color: const Color(0x66b9bcf2),
                        height: height * 0.09,
                        width: double.infinity,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                Image.asset('images/vector_sun.png',
                                    width: width * 0.06, height: width * 0.06),
                                const SizedBox(width: 10),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: const [
                                    Text(
                                      '10 minutes ago',
                                      style: TextStyle(
                                          color: Color(0xFF737272),
                                          fontSize: 10),
                                    ),
                                    SizedBox(height: 5),
                                    Text(
                                      "It's a sunny day in your location",
                                      style: TextStyle(fontSize: 15),
                                    )
                                  ],
                                )
                              ],
                            )
                          ],
                        ),
                      ),
                      kSpace,
                      const Text(
                        'Earlier',
                        style: TextStyle(color: Color(0xFF737272)),
                      ),
                      kSpace,
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              Image.asset('images/vector_sun.png',
                                  width: width * 0.06, height: width * 0.06),
                              const SizedBox(width: 10),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: const [
                                  Text(
                                    '1 day ago',
                                    style: TextStyle(
                                        color: Color(0xFF737272), fontSize: 10),
                                  ),
                                  SizedBox(height: 5),
                                  Text(
                                    "It's a sunny day in your location",
                                    style: TextStyle(fontSize: 15),
                                  )
                                ],
                              )
                            ],
                          ),
                          const Divider(color: Color(0xFFEAEAEA), height: 30),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              Image.asset('images/vector_sun.png',
                                  width: width * 0.06, height: width * 0.06),
                              const SizedBox(width: 10),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: const [
                                  Text(
                                    '2 days ago',
                                    style: TextStyle(
                                        color: Color(0xFF737272), fontSize: 10),
                                  ),
                                  SizedBox(height: 5),
                                  Text(
                                    "It's a sunny day in your location",
                                    style: TextStyle(fontSize: 15),
                                  )
                                ],
                              )
                            ],
                          ),
                          const Divider(color: Color(0xFFEAEAEA), height: 30)
                        ],
                      ),
                    ],
                  ),
                ),
              )
            ],
          );
        });
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
                    GestureDetector(
                      onTap: () {
                        Navigator.pushNamed(context, CityScreen.id);
                      },
                      child: Container(
                        width: width * 0.427,
                        height: height * 0.060,
                        decoration: BoxDecoration(
                            color: kHomeScreenLocationButtonColor,
                            borderRadius: BorderRadius.circular(20)),
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
                              'Lagos, Nigeria',
                              style: TextStyle(color: Colors.white, fontSize: 15),
                            )
                          ],
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        showNotificationBottomSheet();
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
                Container(
                  width: width,
                  height: height * 0.43,
                  decoration: BoxDecoration(
                      color: kHomeScreenLocationButtonColor,
                      borderRadius: BorderRadius.circular(15),
                      border: Border.all(color: kBorderAndTextColor)),
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
                              children: const [
                                Text(
                                  'Today',
                                  style: TextStyle(
                                      fontSize: 25, color: Colors.white),
                                ),
                                Text(
                                  'Mon, 26 Apr',
                                  style: TextStyle(color: Colors.white),
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
                            const Text(
                              '28',
                              style:
                                  TextStyle(fontSize: 150, color: Colors.white),
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
                        const Text(
                          'Lagos, Nigeria • 2:00 p.m',
                          style: TextStyle(fontSize: 20, color: Colors.white),
                        )
                      ],
                    ),
                  ),
                ),
                Material(
                  borderRadius: BorderRadius.circular(8),
                  color: kHomeScreenLocationButtonColor,
                  child: MaterialButton(
                    onPressed: () {
                      showForecastBottomSheet();
                    },
                    elevation: 0,
                    height: height * 0.07,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: const [
                        Text(
                          'Forecast report',
                          style: TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold),
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
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
