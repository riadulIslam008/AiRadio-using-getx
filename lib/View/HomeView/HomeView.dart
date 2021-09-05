import 'package:ai_radio/Controller/HomeViewController.dart';
import 'package:ai_radio/Utils/AiColor.dart';
import 'package:ai_radio/View/HomeView/Widget/AlanCommand.dart';
import 'package:ai_radio/View/HomeView/Widget/AppDrawer.dart';
import 'package:ai_radio/View/HomeView/Widget/ShowChannel.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shimmer/shimmer.dart';

class HomeView extends StatelessWidget {
  HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: LeftDrawer(),
      body: Stack(
        alignment: Alignment.center,
        children: [
          //Todo ============== Graident Color Container =======##
          GetBuilder<HomeViewController>(
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
              );
            },
          ),

          //Todo ============== AppBar and Image Section =========##
          Column(
            children: [
              //* ============ AppBar ===========##
              AppBar(
                title: Shimmer.fromColors(
                    child: Text("Ai Radio"),
                    baseColor: Colors.white,
                    highlightColor: Colors.purple[300]!),
                centerTitle: true,
                backgroundColor: Colors.transparent,
                elevation: 0,
              ),
              //* ============ Song banner Section ============##
              SizedBox(height: 20),
              Text(
                "Start With -'Hey Alan' ",
                style: TextStyle(
                  color: Colors.white70,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 10),
              Container(child: Center(child: AlanCommand()), height: 40),
              SizedBox(height: Get.height * 0.10),
              ShowChannel(),
              SizedBox(height: Get.height * 0.10),
            ],
          ),
          GetBuilder<HomeViewController>(
            init: HomeViewController(),
            builder: (controller) {
              return controller.songName == null
                  ? Container()
                  : Positioned(
                      bottom: 110,
                      child: Text(
                        (controller.currentIndex > -1 &&
                                controller.currentIndex <
                                    controller.radios.length)
                            ? "Playing Now  -${controller.radios[controller.currentIndex].name} FM"
                            : "Try Again",
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    );
            },
          ),
          GetBuilder<HomeViewController>(
            init: HomeViewController(),
            builder: (controller) {
              return Positioned(
                bottom: 50,
                child: InkWell(
                  onTap: () {
                    controller.isPlaying
                        ? controller.stopMusic()
                        : controller.playMusic();
                  },
                  child: Icon(
                    controller.isPlaying
                        ? CupertinoIcons.stop_circle
                        : CupertinoIcons.play,
                    size: 50,
                    color: Colors.white,
                  ),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
