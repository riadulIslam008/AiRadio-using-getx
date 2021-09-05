import 'package:ai_radio/Controller/HomeViewController.dart';
import 'package:ai_radio/Utils/AiColor.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LeftDrawer extends StatelessWidget {
  LeftDrawer({Key? key}) : super(key: key);

  final ScrollController _scrollController = ScrollController();

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: GetBuilder<HomeViewController>(
        init: HomeViewController(),
        builder: (controller) {
          return Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  AiColor.primaryColor2!,
                  controller.selectedColor == null
                      ? AiColor.primaryColor!
                      : controller.selectedColor!,
                ],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
            ),
            child: Scrollbar(
              isAlwaysShown: true,
              controller: _scrollController,
              child: SingleChildScrollView(
                controller: _scrollController,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(height: 50),
                    Text(
                      "All Channel",
                      style: TextStyle(
                        fontSize: 25,
                        color: Colors.white,
                      ),
                    ),
                    for (var radio in controller.radios)
                      ListTile(
                        leading: CircleAvatar(
                          child: CachedNetworkImage(imageUrl: radio.icon),
                        ),
                        title: Text(
                          radio.name,
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        subtitle: Text(
                          radio.tagline,
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
