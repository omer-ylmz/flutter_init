import 'package:flutter/material.dart';

class KisiselFont extends StatelessWidget {
  const KisiselFont({super.key});

  @override
  Widget build(BuildContext context) {
    return const Text(
      "Kişisel Font Kullanimi",
      style: TextStyle(
          // fontFamily: "Genel",
          fontSize: 36,
          fontWeight: FontWeight
              .w700), //eğer özel olarak yazı türü belirtmek istersek burada kullan
    );
  }
}
