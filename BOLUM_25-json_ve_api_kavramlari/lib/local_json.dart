import 'dart:convert';

import 'package:bolum_25_json_ve_api_kavramlari/model/araba_model.dart';
import 'package:flutter/material.dart';

class LocalJson extends StatefulWidget {
  const LocalJson({super.key});

  @override
  State<LocalJson> createState() => _LocalJsonState();
}

class _LocalJsonState extends State<LocalJson> {
  String _title = "Local Json İşlemleri";
  late Future<List<Araba>> _listeyiDoldur;

  @override
  void initState() {
    super.initState();
    _listeyiDoldur = arabalarJsonOku();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(
            _title,
            style: const TextStyle(color: Colors.white),
          ),
          backgroundColor: Colors.blue,
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            setState(() {
              _title = "Buton Tıklandı";
              debugPrint("buton tıklandı");
            });
          },
        ),
        body: FutureBuilder<List<Araba>>(
          //future ya geriye data döndürür ya da hata döndürür
          //awaitli bir fonkisyon beklerken future builder kullanılır
          future:
              _listeyiDoldur, //set state yaparken bu kısmı sadece bir kez çalıştırsın diye initstate de atama yaptık
          initialData: [
            //veriler gelen kadar ekranda bir nesne göstermek için kullanılır
            Araba(arabaAdi: "Ford", ulke: "Amerika", kurulusYil: 1920, model: [
              Model(modelAdi: "Connect", fiyat: 18000, benzinli: false)
            ])
          ],
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              //future eğer geriye data döndürüyorsa
              List<Araba> arabaListesi =
                  snapshot.data!; //verilere snahshot.data ile erişilir
              return ListView.builder(
                itemCount: arabaListesi.length,
                itemBuilder: (context, index) {
                  var oankiAraba = arabaListesi[index];
                  return ListTile(
                    title: Text(oankiAraba.arabaAdi),
                    subtitle: Text(oankiAraba.ulke),
                    leading: CircleAvatar(
                      child: Text(oankiAraba.model[0].fiyat.toString()),
                    ),
                  );
                },
              );
            } else if (snapshot.hasError) {
              return Center(
                child: Text(snapshot.error.toString()), //hatayı yazdırır
              );
            } else {
              return const Center(
                child:
                    CircularProgressIndicator(), //internetten veri çekerken uzun sürerse dönen işaret çıkar
              );
            }
          },
        ));
  }

  Future<List<Araba>> arabalarJsonOku() async {
    try {
      await Future.delayed(
          const Duration(seconds: 5)); //5 saniye bekle fonksiyonu işleme
      // ignore: use_build_context_synchronously
      String okunanString = await DefaultAssetBundle.of(context).loadString(
          "assets/data/arabalar.json"); //json dosyası okumak için kullandığımız method
      var jsonObject = jsonDecode(
          okunanString); //string olarak okuduğumuz yapıyı json formatında işlemek için

      /*
    debugPrint(okunanString);    //direk localden okuma, model oluşturmadan
    debugPrint("********************");
    List arabaListesi = jsonObject;
    debugPrint(arabaListesi[1]["model"][0]["fiyat"].toString());
*/
      List<Araba> tumArabalar =
          (jsonObject as List) //Araba nesnesini tanıtmak için kullandık
              .map((arabaMap) => Araba.fromJson(arabaMap))
              .toList();

      return tumArabalar;
    } catch (e) {
      debugPrint(e.toString());
      return Future.error(e.toString());
    }
  }
}
