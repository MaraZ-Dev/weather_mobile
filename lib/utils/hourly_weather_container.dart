import 'package:flutter/material.dart';

Padding buildHourlyWeather(double width, double height) {
  return Padding(
    padding: EdgeInsets.symmetric(horizontal: width * 0.04 , vertical: height * 0.018),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('29', style: TextStyle(fontSize: 17)),
            Text('°C', style: TextStyle(fontSize: 8))
          ],
        ),
        Image.asset(
          'images/sun.png',
          width: width * 0.08,
        ),
        Text(
          '8 a.m',
          style: TextStyle(fontSize: 15),
        )
      ],
    ),
  );
}
