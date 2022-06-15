import 'package:flutter/material.dart';

Column buildDailyWeather(double width, double height) {
  return Column(
    children: [
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text('April 5'),
          Image.asset(
            'images/sun.png',
            width: width * 0.08,
          ),
          Row(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('29', style: TextStyle(fontSize: 17)),
              Text('°C', style: TextStyle(fontSize: 8))
            ],
          ),
        ],
      ),
      Divider()
    ],
  );
}