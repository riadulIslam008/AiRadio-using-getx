import 'package:ai_radio/Controller/HomeViewController.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ShowChannel extends StatelessWidget {
  ShowChannel({Key? key}) : super(key: key);

  final double _height = Get.height * 0.35;
  final ScrollController _channelScrollController = ScrollController();
  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeViewController>(
      init: HomeViewController(),
      builder: (controller) {
        return Container(
          height: _height,
          child: Scrollbar(
            controller: _channelScrollController,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              controller: _channelScrollController,
              shrinkWrap: true,
              itemCount: controller.radios.length,
              itemBuilder: (context, index) {
                final _myRadio = controller.radios[index];

                return InkWell(
                  onDoubleTap: () {
                    controller.currentIndex = index;
                    controller.doubleTap(index, color: _myRadio.color);
                  },
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: Stack(
                      alignment: Alignment.center,
                      children: [
                        //Todo ============ Image ================ ##
                        Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15),
                            border: Border.all(
                              color: Colors.black,
                              width: 5,
                            ),
                          ),
                          child: CachedNetworkImage(
                            imageUrl: _myRadio.image,
                            height: _height,
                            width: Get.width * 0.60,
                            fit: BoxFit.cover,
                            colorBlendMode: BlendMode.darken,
                          ),
                        ),
                        //Todo ============= CateGory widget ============##
                        Positioned(
                          top: 0,
                          right: 0,
                          child: Container(
                            padding: EdgeInsets.all(10),
                            decoration: BoxDecoration(
                              color: Colors.black,
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Text(
                              _myRadio.category,
                              style: TextStyle(color: Colors.white),
                            ),
                          ),
                        ),
                        //Todo ============Play Icon===========##
                        Container(
                          alignment: Alignment.center,
                          child: Icon(
                            CupertinoIcons.play_circle,
                            size: 50,
                            color: Colors.white.withOpacity(0.8),
                          ),
                        ),
                        //Todo ============ Double Tap to Play ===========##
                        Positioned(
                          top: _height / 2 + 30,
                          child: Text(
                            "Double Tap to Play",
                            style:
                                TextStyle(color: Colors.white.withOpacity(0.5)),
                          ),
                        ),
                        //Todo ============ Fm Name ===========##
                        Positioned(
                          bottom: 25,
                          child: Text(
                            _myRadio.name,
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.white),
                          ),
                        ),
                        //Todo ============ Tagline ===========##
                        Positioned(
                          bottom: 5,
                          child: Text(
                            _myRadio.tagline,
                            style: TextStyle(
                                fontSize: 15,
                                // fontWeight: FontWeight.bold,
                                color: Colors.white),
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
        );
      },
    );
  }
}
