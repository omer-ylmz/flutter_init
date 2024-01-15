import 'package:flutter/material.dart';
import 'package:proje_2/constants/app_constants.dart';

class OrtalamaHesaplaPage extends StatefulWidget {
  const OrtalamaHesaplaPage({super.key});

  @override
  State<OrtalamaHesaplaPage> createState() => _OrtalamaHesaplaPageState();
}

class _OrtalamaHesaplaPageState extends State<OrtalamaHesaplaPage> {
  List<String> harfNotlari = [
    //harf notları için dropdown butonda kullandığımız listeler
    "AA",
    "BA",
    "BB",
    "CB",
    "CC",
    "DC",
    "DD",
    "FD",
    "FF"
  ];
  String girilenDersAdi = ""; //girilen ders adini attığımız değişken
  String secilenHarf = ""; //seçilen harf notunu attığımız değişken
  List<int> krediPuanlari = [
    //krediler için dropdown butonda kullandığımız listeler
    1,
    2,
    3,
    4,
    5,
    6,
    7,
    8,
    9,
    10
  ];
  int secilenKredi = 0; //seçilen krediyi attığımız değişken
  int girilenDersSayisi = 0; //girilen ders sayısını tuttuğumuz değişken
  double ortalama = 0; //ortalamyı tuttuğumuz değişken
  double harfNotuDegeri = 0; //harf notlarının karşılığını tuttuğumuz değişken
  int toplamAlinanKredi = 0; //toplam alınan krediyi tuttuğumuz değişken
  double agirlikliKredi = 0; //ağırlıklı kredi değerini tuttuğumuz değişken
  double oAnkiAgirlikliKredi =
      0; //o an seçilen dersin ağrıklı kredisi = kredi * harf notu

  //Listview builder ile dönmek için oluşturduğum listeler

  List<String> secilenDersler = [];
  List<int> alinanKrediPuanlari = [];
  List<double> alinanNotDegerleri = [];
  List<double> alinanAgirlikliKredi = [];

  //formlara başka yerlerden erişmem gerekir diye oluşturduğum globalKeyler

  var dersAdiKey = GlobalKey<FormFieldState>();
  var harfNotuKey = GlobalKey<FormFieldState>();
  var krediPuaniKey = GlobalKey<FormFieldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0, //renk olarak tamamen kaybetmek için

        title: Center(
          child: Text(
            Sabitler.baslikText,
            style: Sabitler.baslikStyle,
          ),
        ),
      ),
      body: Column(
        children: [
          Row(
            children: [
              Expanded(
                flex: 2, //alanı eşit payday bölmek için kullandım
                child: Container(
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(
                            left: 8), //alanı dışarıdan uzaklaştırmak için
                        child: TextFormField(
                          key: dersAdiKey,
                          decoration: InputDecoration(
                            //kenarlık ve kenar yumşatma için
                            border: OutlineInputBorder(
                              borderSide: BorderSide.none,
                              borderRadius:
                                  BorderRadius.all(Radius.circular(20)),
                            ),
                            filled:
                                true, //arkaplan eklemek için true yapmanız gerekiyor.
                            fillColor: Colors.grey.shade300,
                          ),
                          onChanged: (value) {
                            //girilen değeri almak için
                            setState(() {
                              girilenDersAdi = value;
                            });
                          },
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(
                            bottom: 8), //sadece alltan boşluk eklemek için
                        child: Row(
                          children: [
                            Expanded(
                              child: Padding(
                                padding: const EdgeInsets.only(left: 8, top: 8),
                                child: DropdownButtonFormField(
                                  //dropdown button oluşturmak için
                                  key: harfNotuKey,
                                  isExpanded: true,
                                  items: harfNotlari.map((secilenHarf) {
                                    return DropdownMenuItem(
                                      child: Center(
                                        child: Text(secilenHarf),
                                      ),
                                      value: secilenHarf,
                                    );
                                  }).toList(),
                                  onChanged: (value) {
                                    setState(() {
                                      secilenHarf = value!;
                                    });
                                  },
                                  decoration: InputDecoration(
                                    border: OutlineInputBorder(
                                      borderSide: BorderSide.none,
                                      borderRadius:
                                          BorderRadius.all(Radius.circular(20)),
                                    ),
                                    filled: true,
                                    fillColor: Colors.grey.shade300,
                                  ),
                                ),
                              ),
                            ),
                            Expanded(
                              child: Padding(
                                padding: const EdgeInsets.only(left: 8, top: 8),
                                child: DropdownButtonFormField(
                                  key: krediPuaniKey,
                                  items: krediPuanlari.map((secilenKredi) {
                                    return DropdownMenuItem(
                                      child: Center(
                                        child: Text(
                                          secilenKredi.toString(),
                                          style: TextStyle(),
                                        ),
                                      ),
                                      value: secilenKredi,
                                    );
                                  }).toList(),
                                  onChanged: (value) {
                                    setState(() {
                                      secilenKredi = value!;
                                    });
                                  },
                                  decoration: InputDecoration(
                                    border: OutlineInputBorder(
                                      borderSide: BorderSide.none,
                                      borderRadius:
                                          BorderRadius.all(Radius.circular(20)),
                                    ),
                                    filled: true,
                                    fillColor: Colors.grey.shade300,
                                  ),
                                ),
                              ),
                            ),
                            Expanded(
                              child: Padding(
                                padding: const EdgeInsets.only(top: 8),
                                child: IconButton(
                                  iconSize: 50,
                                  isSelected: false,
                                  onPressed: ortalamaHesaplama,
                                  icon: Icon(
                                    Icons.navigate_next,
                                    // size: 50,
                                    color: Sabitler.anaRenk,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ),
              Expanded(
                flex: 1,
                child: Container(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        "${girilenDersSayisi} Ders Girildi",
                        style: Sabitler.yaziStyle,
                      ),
                      Text(
                        "${ortalama.toStringAsFixed(2)}",
                        style: Sabitler.ortalamaStyle,
                      ),
                      Text(
                        "Ortalama",
                        style: Sabitler.yaziStyle,
                      )
                    ],
                  ),
                ),
              )
            ],
          ),
          Expanded(
              child: ListView.builder(
            itemCount: secilenDersler.length,
            itemBuilder: (context, index) {
              if (secilenDersler.length == 0) {
                return Container(
                  alignment: Alignment.center,
                  child: Text(
                    "Lütfen Ders Ekleyin",
                    style: Sabitler.baslikStyle,
                  ),
                );
              } else if (secilenDersler.length != 0) {
                return listeleme(index);
              }
            },
          ))
        ],
      ),
    );
  }

  Dismissible listeleme(
    int index,
  ) {
    return Dismissible(
        key: UniqueKey(),
        direction: DismissDirection.startToEnd,
        onDismissed: (direction) {
          girilenDersSayisi--;

          agirlikliKredi = agirlikliKredi -
              (alinanNotDegerleri[index] * alinanKrediPuanlari[index]);
          toplamAlinanKredi = toplamAlinanKredi - alinanKrediPuanlari[index];
          ortalama = agirlikliKredi / toplamAlinanKredi;

          if (girilenDersSayisi == 0) {
            ortalama = 0.00;
          } else {
            Null;
          }

          setState(() {});
        },
        child: Container(
          decoration: BoxDecoration(
              border: Border.all(color: Sabitler.anaRenk, width: 2),
              borderRadius: BorderRadius.all(Radius.circular(20))),
          padding: EdgeInsets.all(2),
          margin: EdgeInsets.all(2),
          alignment: Alignment.bottomCenter,
          child: ListTile(
            leading: CircleAvatar(
              child: Text("${alinanAgirlikliKredi[index].toInt()}"),
            ),
            title: Text(secilenDersler[index]),
            subtitle: Text(
                "${alinanKrediPuanlari[index]} Kredi, Not Değeri ${alinanNotDegerleri[index]}"),
          ),
        ));
  }

  void ortalamaHesaplama() {
    girilenDersSayisi++;
    toplamAlinanKredi = toplamAlinanKredi + secilenKredi;

    secilenDersler.insert(
        0, girilenDersAdi); //listenin başına eleman eklemek için

    alinanKrediPuanlari.insert(0, secilenKredi);

    switch (secilenHarf) {
      case "AA":
        {
          harfNotuDegeri = 4.00;
        }
      case "BA":
        {
          harfNotuDegeri = 3.50;
        }
      case "BB":
        {
          harfNotuDegeri = 3.00;
        }
      case "CB":
        {
          harfNotuDegeri = 2.50;
        }
      case "CC":
        {
          harfNotuDegeri = 2.00;
        }
      case "DC":
        {
          harfNotuDegeri = 1.50;
        }
      case "DD":
        {
          harfNotuDegeri = 1.00;
        }
      case "FD":
        {
          harfNotuDegeri = 0.50;
        }
      case "FF":
        {
          harfNotuDegeri = 0.00;
        }
    }
    oAnkiAgirlikliKredi = secilenKredi * harfNotuDegeri;
    alinanAgirlikliKredi.insert(0, oAnkiAgirlikliKredi);
    alinanNotDegerleri.insert(0, harfNotuDegeri);

    agirlikliKredi = agirlikliKredi + (harfNotuDegeri * secilenKredi);
    ortalama = agirlikliKredi / toplamAlinanKredi;

    setState(() {
      secilenDersler.reversed;
      ortalama;
      girilenDersSayisi;
    });
  }
}
