import 'package:bolum_21/checkbox_slider_radio_switch_widget.dart';
import 'package:bolum_21/date_time_picker.dart';
import 'package:bolum_21/global_key_kullanimi.dart';
import 'package:bolum_21/stepper_kullanimi.dart';
import 'package:bolum_21/text_field_kullaimi.dart';
import 'package:bolum_21/text_form_field_kullanimi.dart';
import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Material App',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: StepperOrnek(),
    );
  }
}
