import 'dart:math';

import 'package:flutter/material.dart';

class RedPage extends StatelessWidget {
  RedPage({super.key});
  int _rastgeleSayi = 0;

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () {
        print("onWillPop çalıştı");

        _rastgeleSayi = Random().nextInt(100);
        Navigator.pop(context, _rastgeleSayi);
        return Future.value(
            false); //geri tuşu ve ikonundan geri dönmeyi engellemek için kullanılır
      },
      child: Scaffold(
        appBar: AppBar(
          title: Text("Red Page"),
          backgroundColor: Colors.red,
          // automaticallyImplyLeading:false,    //appbarda çıkan geri dön ikonunu kaldırmak için
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Red Page",
                style: TextStyle(fontSize: 24),
              ),
              ElevatedButton(
                  onPressed: () {
                    _rastgeleSayi = Random().nextInt(100);
                    print("Uretilen sayi $_rastgeleSayi");
                    Navigator.of(context).pop(_rastgeleSayi); //geri dönmek için
                  },
                  child: Text("Geri Dön"))
            ],
          ),
        ),
      ),
    );
  }
}
