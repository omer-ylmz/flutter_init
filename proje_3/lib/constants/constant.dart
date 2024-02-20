import 'package:flutter/material.dart';

class Constants {
  Constants._(); //sınıfın kurucu methodunu gizli yaptık başkası nesne üretmesin diye

  static const String title = "Pokedex";

  static TextStyle getTitleTextStyle() {
    return const TextStyle(
        color: Colors.white, fontWeight: FontWeight.bold, fontSize: 48);
  }

  static TextStyle getPokemonTextStyle() {
    return const TextStyle(
        color: Colors.white, fontWeight: FontWeight.bold, fontSize: 22);
  }

  static TextStyle getTypeChipTextStyle() {
    return const TextStyle(color: Colors.white, fontSize: 15);
  }

  static TextStyle getPokemonInformationTitleTextStyle() {
    return const TextStyle(
        color: Colors.black, fontWeight: FontWeight.bold, fontSize: 22);
  }

  static TextStyle getPokemonInformationTextStyle() {
    return const TextStyle(color: Colors.black, fontSize: 16);
  }

  // ignore: unused_element
  // static _calculateFondSize(int size) {
  //   if (ScreenUtil().orientation == Orientation.portrait) {
  //     return size
  //         .sp; //ayarlardan font değiştirdiğinde uygulama ona ayak uydurur
  //   } else {
  //     return size.sp;
  //   }
  // }
}
