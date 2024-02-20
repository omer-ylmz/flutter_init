import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:proje_3/pages/ana_ekran.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      //ekranları response yapmak için kullanılır
      designSize: const Size(412,
          732), //hangi boyuta göre kodladığınızı yazarız, oranlama ile yükseklik genişilik ayarlanır
      //builder zorunlu kullanımı
      builder: (context, child) => MaterialApp(
        theme: ThemeData.dark().copyWith(
          //koyu temanın bütün özelliklerini al ama ben bazı değişiklikler yapacağım
          textTheme: GoogleFonts.latoTextTheme(),
        ),
        debugShowCheckedModeBanner: false,
        title: 'Poke Dex',
        home: const AnaEkran(),
      ),
    );
  }
}
