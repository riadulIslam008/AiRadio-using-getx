import 'dart:math';

import 'package:ai_radio/Controller/HomeViewController.dart';
import 'package:flutter/material.dart';
// ignore: import_of_legacy_library_into_null_safe
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:get/get.dart';

class AlanCommand extends GetWidget<HomeViewController> {
  AlanCommand({Key? key}) : super(key: key);

  final List<String> alanCommandList = <String>[
    "Play",
    "Play Music",
    "Play Channel",
    'Stop',
    "Next Channel",
    "Next FM",
    "Previous FM",
    "Previous Channel",
  ];

  @override
  Widget build(BuildContext context) {
    return Swiper(
      index: 0,
      autoplay: true,
      autoplayDelay: 3000,
      curve: Curves.linear,
      viewportFraction: 0.3,
      itemCount: alanCommandList.length,
      itemBuilder: (context, int index) {
        return AnimatedContainer(
          duration: Duration(milliseconds: 5000),
          child: Chip(
            labelPadding: EdgeInsets.all(5),
            //========== Random Color ===========##
            backgroundColor:
                Colors.primaries[Random().nextInt(Colors.primaries.length)],
            clipBehavior: Clip.antiAlias,
            label: Text(
              alanCommandList[index],
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        );
      },
    );
  }
}
