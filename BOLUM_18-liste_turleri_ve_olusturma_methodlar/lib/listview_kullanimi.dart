import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';

class ListViewKullanimi extends StatelessWidget {
  ListViewKullanimi({super.key});

  List<Ogrenci> tumOgrenciler = List.generate(
      500,
      (index) => Ogrenci(index + 1, "Ogrenci adı ${index + 1}",
          "Ogrenci soyadı ${index + 1}"));
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text("Öğrenci Listesi")),
        body: ListView.separated(
          itemBuilder: (BuildContext context, int index) {
            var oAnkiOgrenci = tumOgrenciler[index];
            return Card(
              color: index % 2 == 0
                  ? Colors.orange.shade100
                  : Colors.purple.shade100,
              child: ListTile(
                onTap: () {
                  EasyLoading.showToast("Eleman Tıklandı",
                      duration: Duration(seconds: 3),
                      toastPosition: EasyLoadingToastPosition.bottom);
                },
                onLongPress: () {
                  _alertDialogIslemleri(context, oAnkiOgrenci);
                },
                title: Text(oAnkiOgrenci.isim),
                subtitle: Text(oAnkiOgrenci.soyisim),
                leading: CircleAvatar(child: Text(oAnkiOgrenci.id.toString())),
              ),
            );
          },
          itemCount: tumOgrenciler.length,
          separatorBuilder: (context, index) {
            var yeniIndex = index + 1;
            if (yeniIndex % 4 == 0) {
              return Divider(
                thickness: 2,
                color: Colors.teal,
              );
            }
            return SizedBox();
          },
        ));
  }

  ListView klasikListView() {
    return ListView(
      children: tumOgrenciler
          .map((Ogrenci ogr) => ListTile(
                title: Text(ogr.isim),
                subtitle: Text(ogr.soyisim),
                leading: CircleAvatar(child: Text(ogr.id.toString())),
              ))
          .toList(),
    );
  }

  void _alertDialogIslemleri(BuildContext myContext, Ogrenci secilen) {
    showDialog(
      context: myContext,
      builder: (context) {
        return AlertDialog(
          title: Text(secilen.toString()),
          content: SingleChildScrollView(
            child: ListBody(children: [
              Text("ömer" * 100),
              Text("ömer2" * 100),
              Text("ömer3" * 100)
            ]),
          ),
          actions: [
            ButtonBar(
              children: [
                TextButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: Text("Kapat")),
                TextButton(onPressed: () {}, child: Text("Tamam"))
              ],
            )
          ],
        );
      },
    );
  }
}

class Ogrenci {
  final int id;
  final String isim;
  final String soyisim;

  Ogrenci(this.id, this.isim, this.soyisim);

  @override
  String toString() {
    // TODO: implement toString
    return "Isim : $isim Soyisim : $soyisim";
  }
}
