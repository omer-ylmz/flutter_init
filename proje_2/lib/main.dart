import 'package:flutter/material.dart';
import 'package:proje_2/constants/app_constants.dart';
import 'package:proje_2/widgets/ortalama_hesapla_page.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Dinamik Ortalama Hesapla',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Sabitler.anaRenk,
          visualDensity: VisualDensity
              .adaptivePlatformDensity, //diğer ortamlarda da o ortama uygun çalışır
        ),
        home: OrtalamaHesaplaPage());
  }
}
