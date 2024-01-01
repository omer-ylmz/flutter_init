import 'package:flutter/material.dart';

class DropDownButtonKullanimi extends StatefulWidget {
  const DropDownButtonKullanimi({super.key});

  @override
  State<DropDownButtonKullanimi> createState() =>
      _DropDownButtonKullanimiState();
}

class _DropDownButtonKullanimiState extends State<DropDownButtonKullanimi> {
  String? _secilenSehir = null;
  List<String> _tumSehirler = ["Ankara", "Bursa", "İstanbul", "İzmir"];
  @override
  Widget build(BuildContext context) {
    return Center(
      child: DropdownButton(
        hint: Text("Şehir Seçiniz"),
        icon: Icon(
          Icons.download_for_offline,
        ),
        style: TextStyle(color: Colors.red),
        // items: [
        //   DropdownMenuItem(
        //     child: Text("Ankara Şehri"),
        //     value: "Ankara",
        //   ),
        //   DropdownMenuItem(
        //     child: Text("İzmir Şehri"),
        //     value: "İzmir",
        //   ),
        //   DropdownMenuItem(
        //     child: Text("Bursa Şehri"),
        //     value: "Bursa",
        //   )
        // ],

        items: _tumSehirler
            .map(
              (String oAnkiSehir) => DropdownMenuItem(
                child: Text(oAnkiSehir),
                value: oAnkiSehir,
              ),
            )
            .toList(),
        value: _secilenSehir,
        onChanged: (String? yeni) {
          setState(() {
            print("Çalıştı $yeni");
            _secilenSehir = yeni!;
          });
        },
      ),
    );
  }
}
