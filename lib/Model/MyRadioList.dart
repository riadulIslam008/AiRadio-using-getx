import 'dart:convert';

import 'package:ai_radio/Model/radio.dart';
import 'package:flutter/foundation.dart';


class MyRadioList {
  final List<MyRadio> radios;
  MyRadioList({
    required this.radios,
  });

  MyRadioList copyWith({
    List<MyRadio>? radios,
  }) {
    return MyRadioList(
      radios: radios ?? this.radios,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'radios': radios.map((x) => x.toMap()).toList(),
    };
  }

  factory MyRadioList.fromMap(Map<String, dynamic> map) {
    return MyRadioList(
      radios: List<MyRadio>.from(map['radios']?.map((x) => MyRadio.fromMap(x))),
    );
  }

  String toJson() => json.encode(toMap());

  factory MyRadioList.fromJson(String source) => MyRadioList.fromMap(json.decode(source));

  @override
  String toString() => 'MyRadioList(radios: $radios)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
  
    return other is MyRadioList &&
      listEquals(other.radios, radios);
  }

  @override
  int get hashCode => radios.hashCode;
}


