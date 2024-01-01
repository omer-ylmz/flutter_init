import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:proje_1/burc_listesi.dart';
import 'package:proje_1/detay_sayfasi.dart';

class RouteGenerator {
  static Route<dynamic>? routeGenerator(RouteSettings veri) {
    switch (veri.name) {
      case "/":
        {
          if (defaultTargetPlatform == TargetPlatform.iOS) {
            return CupertinoPageRoute(
                builder: (context) => AnaSayfa(), settings: veri);
          } else {
            return MaterialPageRoute(
             
              builder: (context) => AnaSayfa(),
            );
          }
        }
      case "/detaySayfasi":
        {
          var parametre = veri.arguments as int;
          if (defaultTargetPlatform == TargetPlatform.iOS) {
            return CupertinoPageRoute(
              builder: (context) => detaySayfasi(
                gelenParametre: parametre,
              ),
            );
          } else {
            return MaterialPageRoute(
              builder: (context) => detaySayfasi(
                gelenParametre: parametre,
              ),
            );
          }
        }
    }
  }
}
