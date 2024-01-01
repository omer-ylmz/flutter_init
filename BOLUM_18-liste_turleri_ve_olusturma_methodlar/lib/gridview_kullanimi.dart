import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';

class GridViewOrnek extends StatelessWidget {
  const GridViewOrnek({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("GridView Dersleri")),
      body: GridView.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
        ),
        itemCount: 100,
        itemBuilder: (BuildContext context, int index) {
          return GestureDetector(
            child: Container(
              margin: EdgeInsets.all(20),
              alignment: Alignment.center,
              decoration: BoxDecoration(
                border: Border.all(
                    color: Colors.black, width: 5, style: BorderStyle.solid),
                borderRadius: BorderRadius.all(Radius.circular(20)),
                boxShadow: [
                  BoxShadow(
                      color: Colors.red, offset: Offset(10, 10), blurRadius: 20)
                ],
                color: Colors.red[100 * ((index + 1) % 9)],
                gradient: LinearGradient(
                    colors: [Colors.black, Colors.white],
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter),
                image: DecorationImage(
                    image: AssetImage("assets/images/dugun.jpg"),
                    fit: BoxFit.fill),
              ),
              child: Text(
                "Ömer Yılmaz ${index}",
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.white),
              ),
            ),
            onTap: () {
              EasyLoading.showToast("Ömer Yılmaz $index",
                  toastPosition: EasyLoadingToastPosition.bottom,
                  dismissOnTap: true);
            },
            onDoubleTap: () {
              EasyLoading.showToast("Çift tıklandı",
                  toastPosition: EasyLoadingToastPosition.bottom,
                  dismissOnTap: true);
            },
            onLongPress: () {
              EasyLoading.showToast("Uzun basıldı",
                  toastPosition: EasyLoadingToastPosition.bottom,
                  dismissOnTap: true);
            },
            onHorizontalDragStart: (details) {
              EasyLoading.showToast("bişi olduindex $details",
                  toastPosition: EasyLoadingToastPosition.bottom,
                  dismissOnTap: true);
            },
          );
        },
      ),
    );
  }

  GridView gridViewCountKullanimi() {
    return GridView.count(
      crossAxisCount: 3, //satırda kaç eleman olacak
      primary: true, //sağda-solda çıkan efekt iptali
      scrollDirection: Axis.horizontal,
      padding: EdgeInsets.all(10),
      crossAxisSpacing: 20, //iki kutu yan yana boşluk
      mainAxisSpacing: 40, //iki kutu alt alta boşluk
      children: [
        Container(
          alignment: Alignment.center,
          color: Colors.teal.shade300,
          child: Text(
            "Merhaba Flutter",
            textAlign: TextAlign.center,
          ),
        ),
        Container(
          alignment: Alignment.center,
          color: Colors.teal.shade300,
          child: Text(
            "Merhaba Flutter",
            textAlign: TextAlign.center,
          ),
        ),
        Container(
          alignment: Alignment.center,
          color: Colors.teal.shade300,
          child: Text(
            "Merhaba Flutter",
            textAlign: TextAlign.center,
          ),
        ),
        Container(
          alignment: Alignment.center,
          color: Colors.teal.shade300,
          child: Text(
            "Merhaba Flutter",
            textAlign: TextAlign.center,
          ),
        ),
        Container(
          alignment: Alignment.center,
          color: Colors.teal.shade300,
          child: Text(
            "Merhaba Flutter",
            textAlign: TextAlign.center,
          ),
        ),
        Container(
          alignment: Alignment.center,
          color: Colors.teal.shade300,
          child: Text(
            "Merhaba Flutter",
            textAlign: TextAlign.center,
          ),
        ),
        Container(
          alignment: Alignment.center,
          color: Colors.teal.shade300,
          child: Text(
            "Merhaba Flutter",
            textAlign: TextAlign.center,
          ),
        ),
        Container(
          alignment: Alignment.center,
          color: Colors.teal.shade300,
          child: Text(
            "Merhaba Flutter",
            textAlign: TextAlign.center,
          ),
        ),
        Container(
          alignment: Alignment.center,
          color: Colors.teal.shade300,
          child: Text(
            "Merhaba Flutter",
            textAlign: TextAlign.center,
          ),
        ),
        Container(
          alignment: Alignment.center,
          color: Colors.teal.shade300,
          child: Text(
            "Merhaba Flutter",
            textAlign: TextAlign.center,
          ),
        ),
        Container(
          alignment: Alignment.center,
          color: Colors.teal.shade300,
          child: Text(
            "Merhaba Flutter",
            textAlign: TextAlign.center,
          ),
        ),
        Container(
          alignment: Alignment.center,
          color: Colors.teal.shade300,
          child: Text(
            "Merhaba Flutter",
            textAlign: TextAlign.center,
          ),
        ),
        Container(
          alignment: Alignment.center,
          color: Colors.teal.shade300,
          child: Text(
            "Merhaba Flutter",
            textAlign: TextAlign.center,
          ),
        ),
        Container(
          alignment: Alignment.center,
          color: Colors.teal.shade300,
          child: Text(
            "Merhaba Flutter",
            textAlign: TextAlign.center,
          ),
        ),
        Container(
          alignment: Alignment.center,
          color: Colors.teal.shade300,
          child: Text(
            "Merhaba Flutter",
            textAlign: TextAlign.center,
          ),
        ),
        Container(
          alignment: Alignment.center,
          color: Colors.teal.shade300,
          child: Text(
            "Merhaba Flutter",
            textAlign: TextAlign.center,
          ),
        )
      ],
    );
  }
}
