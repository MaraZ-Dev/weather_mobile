import 'package:flutter/material.dart';

class BuildHourlyForecast extends StatelessWidget {
  BuildHourlyForecast({
    Key? key,
    this.width,
    this.height,
    this.temp,
    this.time,
    this.image
  }) : super(key: key);

  double? width;
  double? height;
  int? temp;
  String? time;
  String? image;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: width! * 0.02 , vertical: height! * 0.018),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('$temp', style: const TextStyle(fontSize: 17, fontWeight: FontWeight.bold)),
                  const Text('°C', style: TextStyle(fontSize: 8, fontWeight: FontWeight.bold))
                ],
              ),
              //SizedBox(height: height * 0.02),
              Image.asset(
                image!,
                width: width! * 0.08,
              ),
              //SizedBox(height: height * 0.02),
              Text(
                time!,
                style: const TextStyle(fontSize: 14),
              )
            ],
          ),
        ),
        SizedBox(width: width! * 0.001,)
      ],
    );
  }
}

