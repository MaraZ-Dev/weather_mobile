import 'package:flutter/material.dart';
import 'constants.dart';

void showNotificationBottomSheet(BuildContext context) {
  showModalBottomSheet(
      backgroundColor: Colors.transparent,
      context: (context),
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
                                  color: Colors.blueGrey, fontSize: 15),
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
