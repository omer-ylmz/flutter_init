import 'package:flutter/material.dart';

class PopupmenuKullanimi extends StatefulWidget {
  const PopupmenuKullanimi({super.key});

  @override
  State<PopupmenuKullanimi> createState() => _PopupmenuKullanimiState();
}

class _PopupmenuKullanimiState extends State<PopupmenuKullanimi> {
  String? _secilenSehir = null;
  List<String> _tumSehirler = ["Ankara", "Bursa", "İstanbul", "İzmir"];
  @override
  Widget build(BuildContext context) {
    return Center(
      child: PopupMenuButton(onSelected: (String sehir) {
        print("seçildi $sehir");
        _secilenSehir = sehir;
      }, itemBuilder: (BuildContext context) {
        // return <PopupMenuEntry<String>>[
        //   PopupMenuItem(
        //     child: Text("Ankara"),
        //     value: "Ankara",
        //   ),
        //   PopupMenuItem(
        //     child: Text("Bursa"),
        //     value: "Bursa",
        //   ),
        //   PopupMenuItem(
        //     child: Text("Van"),
        //     value: "Van",
        //   )
        // ];
        return _tumSehirler
            .map((String oAnkiSehir) => PopupMenuItem(
                  child: Text(oAnkiSehir),
                  value: oAnkiSehir,
                ))
            .toList();
      }),
    );
  }
}
