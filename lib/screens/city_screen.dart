import 'package:flutter/material.dart';
import 'package:weather_mobile/constants.dart';

class CityScreen extends StatefulWidget {
  const CityScreen({Key? key}) : super(key: key);
  static const id = 'CityScreen';

  @override
  State<CityScreen> createState() => _CityScreenState();
}

class _CityScreenState extends State<CityScreen> {
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
                    style: TextStyle(color: Colors.white),
                    cursorColor: Colors.white,
                    decoration: InputDecoration(
                      fillColor: kHomeScreenLocationButtonColor,
                      filled: true,
                      prefixIcon: Icon(Icons.location_on, color: Colors.white,),
                      suffixIcon: Icon(Icons.search, color: Colors.white,),
                      hintText: 'Abuja, Nigera',
                      hintStyle: TextStyle(color: Colors.white, fontSize: 15),
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
                          '20',
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
                      'Abuja, Nigeria • 2:00 p.m',
                      style: TextStyle(fontSize: 20, color: Colors.white),
                    )
                  ],
                ),
              ),
            ),

          ]),
        ),
      ),
    );
  }
}
