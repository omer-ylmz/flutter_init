import 'package:bolum_23_tasarimi_kolaylastiracak_yapilar/custom_font_kullanimi.dart';
import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: Colors.amber,

        fontFamily:
            "Genel", //yazı türünü bütün uygulamada değiştirmek ve default yapmak için
      ),
      title: 'Material App',
      home: const CustomFontKullanimi(),
    );
  }
}
