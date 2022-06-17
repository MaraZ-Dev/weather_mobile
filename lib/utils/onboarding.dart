import 'package:flutter/material.dart';

class BuildOnboarding extends StatelessWidget {
  const BuildOnboarding({
    Key? key,
    required this.width,
    required this.image,
    required this.title,
    required this.description,
  }) : super(key: key);

  final double width;
  final String image;
  final String title;
  final String description;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Image.asset(image, fit: BoxFit.contain),
          Column(
            children: [
              Text(
                title,
                style: const TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                    color: Colors.blueGrey),
              ),
              Padding(
                padding: EdgeInsets.all(width * 0.05),
                child: Text(
                  description,
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    fontSize: 15,
                  ),
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
