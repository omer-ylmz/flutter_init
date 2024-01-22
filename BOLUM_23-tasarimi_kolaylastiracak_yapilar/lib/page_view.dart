import 'package:flutter/material.dart';

class PageViewOrnek extends StatefulWidget {
  const PageViewOrnek({super.key});

  @override
  State<PageViewOrnek> createState() => _PageViewOrnekState();
}

class _PageViewOrnekState extends State<PageViewOrnek> {
  var myController = PageController(
    initialPage: 0, //hangi elemandan göstermeye başlayacağı
    keepPage: true, //bellekten silicek mi silinmeyecek mi
    viewportFraction: 1, //boyutunun ne olacağı
  );
  bool yatayEksen = true;
  bool pageSnapping = true;
  bool reverseEtme = false;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: PageView(
            scrollDirection: yatayEksen == true
                ? Axis.horizontal
                : Axis.vertical, //kaydırma yönü
            reverse: reverseEtme, //diziliş şekli
            controller: myController,
            pageSnapping:
                pageSnapping, //en ufak harakette diğer sayfasa geçsin mi
            onPageChanged: (value) {
              //geçilen sayfanın indeksi verir
              debugPrint("page change gelen index $value");
            },
            children: [
              Container(
                width: double.infinity,
                height: 300,
                color: Colors.indigo,
                child: Center(
                  child: Column(
                    children: [
                      const Text(
                        "Sayfa 0",
                        style: TextStyle(fontSize: 30),
                      ),
                      ElevatedButton(
                          onPressed: () {
                            // myController.jumpToPage(2); //controller kullanarak buradaki ekranlar arası geçiş yapılabilir
                            myController.jumpTo(200); //o kadar birim kayar
                          },
                          child: const Text("2. Sayfaya Git"))
                    ],
                  ),
                ),
              ),
              Container(
                width: double.infinity,
                height: 300,
                color: Colors.amberAccent,
                child: const Center(
                  child: Text(
                    "Sayfa 1",
                    style: TextStyle(fontSize: 30),
                  ),
                ),
              ),
              Container(
                width: double.infinity,
                height: 300,
                color: Colors.teal,
                child: const Center(
                  child: Text(
                    "Sayfa 2",
                    style: TextStyle(fontSize: 30),
                  ),
                ),
              ),
            ],
          ),
        ),
        Expanded(
          child: Container(
            width: double.infinity,
            height: 200,
            color: Colors.grey,
            child: Column(children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    const Text("Yatay Eksende Çalış"),
                    Checkbox(
                      value: yatayEksen,
                      onChanged: (value) {
                        setState(() {
                          yatayEksen = value!;
                        });
                      },
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    const Text("Page Snapping"),
                    Checkbox(
                      value: pageSnapping,
                      onChanged: (value) {
                        setState(() {
                          pageSnapping = value!;
                        });
                      },
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    const Text("Ters Çevir"),
                    Checkbox(
                      value: reverseEtme,
                      onChanged: (value) {
                        setState(() {
                          reverseEtme = value!;
                        });
                      },
                    ),
                  ],
                ),
              ),
            ]),
          ),
        )
      ],
    );
  }
}
