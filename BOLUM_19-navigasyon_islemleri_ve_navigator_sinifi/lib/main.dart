import 'package:bolum_19/green_page.dart';
import 'package:bolum_19/orange_page.dart';
import 'package:bolum_19/red_page.dart';
import 'package:bolum_19/routes/route_generator.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Material App',
        // home: AnaSayfa(),
//       routes: {
//         "/redPage": (context) => RedPage(),
//         "/": (context) => AnaSayfa(),
//         "/orangePage": (context) => OrangePage(),
//       },
//       onUnknownRoute: (settings) {
//         //eğer bir rota bulunmazsa bu fonksiyon çalışır.
//         MaterialPageRoute(
//           builder: (context) => Scaffold(
//             appBar: AppBar(
//               title: Text("Error"),
//             ),
//             body: Center(
//               child: Text("404"),
//             ),
//           ),
//         );
//       },
        onGenerateRoute: RouteGenerator.routeGenerator);
  }
}

class AnaSayfa extends StatelessWidget {
  const AnaSayfa({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Navigation İşlemleri'),
      ),
      body: Center(
        child: Column(
          children: [
            ElevatedButton(
              onPressed: () async {
                //gidilen sayfadan veri çekmek için async await li kullanım
                int? _gelenSayi = await Navigator.push<int>(
                  //işlemin bitmesi için gidilen sayfadan dönülmesi beklenir
                  context,
                  CupertinoPageRoute(
                    //ios için geçiş tarzı
                    builder: (context) => RedPage(),
                  ),
                );
                print("Ana Sayfadan Gelen Sayi $_gelenSayi");
              },
              child: Text("Kırmızı Sayfaya Gir IOS"),
              style: ButtonStyle(
                  backgroundColor:
                      MaterialStatePropertyAll(Colors.red.shade300)),
            ),
            ElevatedButton(
                onPressed: () {
                  // Navigator.push(context, route); //iki kullanımda bire bir aynı
                  Navigator.of(context)
                      .push<int>(
                        MaterialPageRoute(
                          //android için geçiş tarzı

                          builder: (context) => RedPage(),
                        ),
                      )
                      .then((int? value) => debugPrint(
                          //gidilen sayfadan veri çekmek için then li kullanım
                          "Ana Sayfadan Gelen Sayi $value")); //navigation sınıfı içinde rotaların tutulduğu yığın yapısıdır
                },
                child: Text("Kırmızı Sayfaya Gir Android"),
                style: ElevatedButton.styleFrom(primary: Colors.red.shade600)),
            ElevatedButton(
                onPressed: () {
                  Navigator.maybePop(
                      context); //öncesinde bir eleman varsa pop yapsın yoksa çıkarmasın
                },
                child: Text("Maybe Pop Kullanımı"),
                style: ElevatedButton.styleFrom(primary: Colors.red.shade600)),
            ElevatedButton(
                onPressed: () {
                  if (Navigator.canPop(context)) {
                    //geri gelebilir mi diye kontrol yapıyoruz, öncesinde sayfa var mı?
                    print("Evet pop olabilir");
                  } else {
                    print("Hayır pop olamaz");
                  }
                },
                child: Text("Can Pop Kullanımı"),
                style: ElevatedButton.styleFrom(primary: Colors.red.shade600)),
            ElevatedButton(
                onPressed: () {
                  Navigator.pushReplacement(
                      // sıralamada en aşağıda ana sayfa varken burada gidilen sayfayı en aşağı alır
                      context,
                      MaterialPageRoute(builder: (context) => GreenPage()));
                },
                child: Text("Push Replacament Kullanımı"),
                style: ElevatedButton.styleFrom(primary: Colors.red.shade600)),
            ElevatedButton(
                onPressed: () {
                  Navigator.pushNamed(context, "/orangePage");
                },
                child: Text("PushNamed Kullanımı"),
                style:
                    ElevatedButton.styleFrom(primary: Colors.orange.shade600)),
            ElevatedButton(
                onPressed: () {
                  Navigator.pushNamed(context, "/yellowPage");
                },
                child: Text("PushNamed Kullanımı"),
                style:
                    ElevatedButton.styleFrom(primary: Colors.yellow.shade600)),
            ElevatedButton(
                onPressed: () {
                  Navigator.pushNamed(context, "/ogrenciListesi",
                      arguments: 80);
                },
                child: Text("Liste Oluştur"),
                style: ElevatedButton.styleFrom(primary: Colors.green.shade600))

            // Navigator.popUntil(context, (route) => route.isFirst)    kaç tane sayfa peş peşe de olsa tıklandığında ilk sayfaya döner
            // Navigator.popUntil(context, (route) => route.settings.name == "/red page")  rota ismi bu olana kadar geri döner
            // Navigator.of(context).pushAndRemoveUntil("/yellowPage", (route) => route.isFirst)  ilk sayfadan sonra sıraya sarıyı ekle
          ],
        ),
      ),
    );
  }
}
