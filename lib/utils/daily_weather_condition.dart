import 'package:flutter/material.dart';


class BuildDailyWeather extends StatelessWidget {
  BuildDailyWeather({
    Key? key,
    this.width,
    this.height,
    this.temp,
    this.date,
    this.image
  }) : super(key: key);

  double? width;
  double? height;
  String? date;
  int? temp;
  String? image;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(date!),
            Image.asset(
              image!,
              width: width! * 0.09,
            ),
            Row(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('$temp', style: const TextStyle(fontSize: 17)),
                const Text('°C', style: TextStyle(fontSize: 8))
              ],
            ),
          ],
        ),
        const Divider()
      ],
    );
  }
}