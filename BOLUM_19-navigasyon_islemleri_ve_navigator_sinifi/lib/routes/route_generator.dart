import 'package:bolum_19/main.dart';
import 'package:bolum_19/ogrenci_detay.dart';
import 'package:bolum_19/ogrenci_listesi.dart';
import 'package:bolum_19/orange_page.dart';
import 'package:bolum_19/red_page.dart';
import 'package:bolum_19/yellow_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class RouteGenerator {
  static Route<dynamic>? routeGenerator(RouteSettings settings) {
    switch (settings.name) {
      case "/":
        {
          return _sayfaGecisi(AnaSayfa(), settings);
        }

      case "/orangePage":
        {
          return _sayfaGecisi(OrangePage(), settings);
        }
      case "/yellowPage":
        {
          return _sayfaGecisi(YellowPage(), settings);
        }

      case "/ogrenciListesi":
        {
          return _sayfaGecisi(OgrenciListesi(), settings);
        }

      case "/ogrenciDetay":
        {
          var parametredekiOgrenci = settings.arguments as Ogrenci;   //önce burada veriyi al sonra detay sayfasında kullan
          return _sayfaGecisi(
              OgrenciDetay(secilenOgrenci: parametredekiOgrenci), settings);
        }

      default:
        {
          MaterialPageRoute(
            builder: (context) => Scaffold(
              appBar: AppBar(
                title: Text("404"),
              ),
              body: Center(
                child: Text("Sayfa Bulunumadı"),
              ),
            ),
          );
        }
    }
  }

  static PageRoute<dynamic> _sayfaGecisi(Widget sayfa, RouteSettings settings) {
    if (defaultTargetPlatform == TargetPlatform.iOS) {
      //platforma göre sayfa geçiş yapmak için
      return CupertinoPageRoute(
        settings: settings, //verileri göndermek için settings yapısı kullanılır
        builder: (context) => sayfa,
      );
    } else {
      return MaterialPageRoute(
        settings: settings,
        builder: (context) => sayfa,
      );
    }
  }
}
