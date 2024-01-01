import 'package:bolum_17/dropdown_button_kullanimi.dart';
import 'package:bolum_17/image_widgets.dart';
import 'package:bolum_17/my_counter_page.dart';
import 'package:bolum_17/popupmenu_kullanimi.dart';
import 'package:bolum_17/temel_button.dart';
import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "My Counter App",
      theme: ThemeData(primarySwatch: Colors.teal),
      home: Scaffold(
        appBar: AppBar(
          title: Text("Buton Örnekleri"),
          actions: [PopupmenuKullanimi()],
        ),
        body: PopupmenuKullanimi(),
      ),
    );
  }
}
