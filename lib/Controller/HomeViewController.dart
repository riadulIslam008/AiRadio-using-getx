import 'dart:math';

import 'package:ai_radio/Model/MyRadioList.dart';
import 'package:ai_radio/Model/radio.dart';
// ignore: import_of_legacy_library_into_null_safe
import 'package:alan_voice/alan_voice.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';


class HomeViewController extends GetxController {
  List<MyRadio> radios = <MyRadio>[];
  bool isPlaying = false;
  late int currentIndex;
  String? songName;
  Color? selectedColor;

  AudioPlayer audioPlayer = AudioPlayer();

  @override
  void onInit() {
    fectchRadioData();
    initALanAi();
    super.onInit();
  }

  //
  // ─── FETCH RADIO DATA ───────────────────────────────────────────────────────────
  //
  fectchRadioData() async {
    final radioJson = await rootBundle.loadString("assets/radio.json");
    radios = MyRadioList.fromJson(radioJson).radios;
    currentIndex = Random().nextInt(radios.length);

    print("currentIndex $currentIndex");

    update();
  }

  //
  // ─── DOUBLE TAP FUNCTION ────────────────────────────────────────────────────────
  //
  doubleTap(int index, {required String color}) {
    currentIndex = index;
    songName = radios[currentIndex].name;
    playMusic();
    isPlaying = true;
    selectedColor = Color(int.tryParse(color)!);

    update();
  }

//
// ─── PLAY MUSIC FUNCTION ────────────────────────────────────────────────────────
//
  playMusic() {
    songName = radios[currentIndex].name;
    audioPlayer.play(radios[currentIndex].url);
    isPlaying = true;

    update();
  }

//
// ─── STOP MUSIC ──────────────────────────────────────────────────────────────────
//
  stopMusic() {
    audioPlayer.stop();
    isPlaying = false;

    update();
  }

//
// ─── PLAY NEXT Channel FUNCTION ───────────────────────────────────────────────────
//
  nextMusic() {
    stopMusic();
    (currentIndex == radios.length) ? currentIndex = 0 : currentIndex++;

    playMusic();
  }

//
// ─── PLAY PREVIOOUS CHANNEL Function─────────────────────────────────────────────────────
//
  previousMusic() {
    stopMusic();
    (currentIndex == 0)
        ? currentIndex = radios.length
        : currentIndex = currentIndex - 1;

    playMusic();
    //update();
  }

  //
  // ─── ALAN AI ────────────────────────────────────────────────────────────────────
  //
  void initALanAi() {
    AlanVoice.addButton(
        "31addacfd9a82d5015d4779947a928c82e956eca572e1d8b807a3e2338fdd0dc/stage",
        buttonAlign: AlanVoice.BUTTON_ALIGN_RIGHT);
    AlanVoice.callbacks.add((command) {
      _hadleCommand(command.data);
    });
  }

  void _hadleCommand(Map<String, dynamic> data) {
    switch (data["command"]) {
      //=== Play ====##
      case "play":
        playMusic();
        break;

      //=== Stop ====##
      case "stop":
        stopMusic();
        break;
      //=== Next ====##
      case "next":
        nextMusic();
        break;
      //=== Prev ====##
      case "prev":
        previousMusic();
        break;
      default:
        print("Commmand was ${data['command']}");
    }
  }

  @override
  void dispose() {
    audioPlayer.dispose();
    super.dispose();
  }
}
