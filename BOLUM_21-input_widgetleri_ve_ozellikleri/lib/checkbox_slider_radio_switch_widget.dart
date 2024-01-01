import 'package:flutter/material.dart';

class DigerFormElemanlari extends StatefulWidget {
  const DigerFormElemanlari({super.key});

  @override
  State<DigerFormElemanlari> createState() => _DigerFormElemanlariState();
}

class _DigerFormElemanlariState extends State<DigerFormElemanlari> {
  bool checkBoxState = false; //checkbox sonucunu tutan değişken
  String sehir = ""; //radio sonucunu tutan değişken
  bool switchState = false; //switch sonucunu tutan değişken
  double sliderDeger = 10;
  String secilenDeger = "kirmizi";
  List<String> sehirler = ["Ankara", "Bursa", "İzmir", "Hatay"];
  String secilenSehir = "Ankara";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Diğer Form Elemanları"),
      ),
      body: Padding(
        padding: EdgeInsets.all(20),
        child: ListView(
          children: [
            CheckboxListTile(
              //checkbox yapısı oluşturmak için gereken sınıf
              value: checkBoxState,
              onChanged: (value) {
                setState(() {
                  checkBoxState = value!;
                });
              },
              activeColor: Colors.red, //secilince olacak rengi seçmek için
              title: Text("CheckBox title"), // ana başlık şeklinde yazı eklemek
              subtitle: Text(
                  "Checkbox subtitle"), //alt başlık şeklinde yazı eklemek için
              secondary:
                  Icon(Icons.add), //genellikle ikon eklemek için kullanılır
              selected:
                  false, //varsayılan olarak true ya da false değerine sahip olmasını istersek
            ),
            RadioListTile<String>(
              value: "Ankara", //secilince alınacak value değeri
              groupValue:
                  sehir, //secenkleri bir arada gruplamak için kullanılan alan
              onChanged: (deger) {
                setState(
                  () {
                    sehir = deger!;
                    debugPrint("seçilen değer $deger");
                  },
                );
              },
              title: Text("Ankara"), //başlık alanı
              subtitle: Text("Radio subtitle"),
              secondary: Icon(
                Icons.map,
              ),
            ),
            RadioListTile<String>(
              value: "İstanbul",
              groupValue: sehir,
              onChanged: (deger) {
                setState(
                  () {
                    sehir = deger!;
                    debugPrint("seçilen değer $deger");
                  },
                );
              },
              title: Text("İstanbul"),
              subtitle: Text("Radio subtitle"),
              secondary: Icon(
                Icons.map,
              ),
            ),
            RadioListTile<String>(
              value: "İzmir",
              groupValue: sehir,
              onChanged: (deger) {
                setState(
                  () {
                    sehir = deger!;
                    debugPrint("seçilen değer $deger");
                  },
                );
              },
              title: Text("İzmir"),
              subtitle: Text("Radio subtitle"),
              secondary: Icon(
                Icons.map,
              ),
            ),
            SwitchListTile(
              value: switchState,
              onChanged: (deger) {
                setState(() {
                  switchState = deger!;
                  debugPrint("Anlaşma Onaylandı $deger");
                });
              },
              title: Text("Switch Title"),
              subtitle: Text("Switch Subtitle"),
              secondary: Icon(Icons.refresh),
            ),
            Text("Değeri Sliderden Seçiniz"),
            Slider(
              value: sliderDeger,
              onChanged: (deger) {
                setState(() {
                  sliderDeger = deger!;
                });
              },
              min: 10, //istenilen aralığı sayısal aralığı kısıtlamak için
              max: 20,
              divisions: 20, //istenilen aralığı kaç parçaya bölmek istersek
              label: sliderDeger.toString(),
            ),
            DropdownButton<String>(
              items: [
                DropdownMenuItem<String>(
                  child: Row(
                    children: [
                      Container(
                        width: 24,
                        height: 24,
                        color: Colors.red,
                      ),
                      SizedBox(
                        width: 20,
                      ),
                      Text("Kırmızı"),
                    ],
                  ),
                  value: "kirmizi",
                ),
                DropdownMenuItem<String>(
                  child: Row(
                    children: [
                      Container(
                        width: 24,
                        height: 24,
                        color: Colors.blue,
                      ),
                      SizedBox(
                        width: 20,
                      ),
                      Text("Mavi"),
                    ],
                  ),
                  value: "mavi",
                ),
                DropdownMenuItem<String>(
                  child: Row(
                    children: [
                      Container(
                        width: 24,
                        height: 24,
                        color: Colors.green,
                      ),
                      SizedBox(
                        width: 20,
                      ),
                      Text("Yeşil"),
                    ],
                  ),
                  value: "yesil",
                ),
              ],
              onChanged: (value) {
                setState(() {
                  secilenDeger = value!;
                });
              },
              hint: Text("Seçiniz"),
              value: secilenDeger,
            ),
            DropdownButton<String>(  //listeyi dönerek işlem yapmak için kullanabiliriz
              items: sehirler.map((oAnkiSehir) {
                return DropdownMenuItem<String>(
                  child: Text(oAnkiSehir),
                  value: oAnkiSehir,
                );
              }).toList(),
              onChanged: (s) {
                setState(
                  () {
                    secilenSehir = s!;
                  },
                );
              },
              value: secilenSehir,
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: Icon(Icons.add_circle),
        foregroundColor: Colors.black,
      ),
    );
  }
}
