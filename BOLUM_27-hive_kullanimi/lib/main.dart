import 'dart:convert';

import 'package:bolum_27_hive_kullanimi/model/ogrenci.dart';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

import 'package:hive_flutter/adapters.dart';

void main() async {
  //runapp çalışmadan önce diğer işlemleri atlamdan bekle sonra uygulamayı başlat diyoruz
  WidgetsFlutterBinding.ensureInitialized();

  //uyguluma adı altında ilk başlattığımız alan hive' i
  await Hive.initFlutter("uygulama");
  //bir kutu oluşturmak için
  await Hive.openBox("test");

  //önce OgrenciAdapteri çalıştırmamız gerekli
  Hive.registerAdapter(OgrenciAdapter());
  Hive.registerAdapter(GozRenkAdapter());
  await Hive.openBox<Ogrenci>("ogrenciler");

  //lazy box açmak için
  await Hive.openLazyBox<int>("sayilar");

  //encryted
  const FlutterSecureStorage secureStorage = FlutterSecureStorage();

  //key değeri var mı kontrol et
  var containsEncryptionKey = await secureStorage.containsKey(key: "key");
  if (!containsEncryptionKey) {
    var key = Hive.generateSecureKey();
    await secureStorage.write(key: "key", value: base64UrlEncode(key));
  }

  var encryptionKey =
      base64Url.decode(await secureStorage.read(key: "key") ?? "omer");
  print("Encryption Key: $encryptionKey");

  var sifreliKutu = await Hive.openBox("ozel",
      encryptionCipher: HiveAesCipher(encryptionKey));

  await sifreliKutu.put("secret", "Hive is cool");
  await sifreliKutu.put("sifre", "123456");
  print(sifreliKutu.get("secret"));
  print(sifreliKutu.get("sifre"));

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() async {
    var box = Hive.box("test"); //hangi kutuyu açmak istiyorsak
    await box.clear(); //onceden varolan içeriği sildik

    //atamıyı liste şeklinde yapar emre değeri indeks 0 altunbilek indeks 1 olur
    box.add("emre");
    box.add("altunilek");
    box.add(true); //index 2, key 2
    box.add(123); //index 3, key 3, value 123

    //bütün değerleri liste halinde atabiliriz
    /*
    await box.addAll(["liste1", "liste2", false, 9532]);
    */

    //kutu içeriği okumak için
    /*
    box.values.forEach((element) {
      debugPrint(element.toString());
    });
    */

    //atama işlemi aynı map gibi çalışır ve asenkron
    await box.put("tc", "12345678998");
    await box.put("tema", "dark");

    //bütün değerleri map şeklinde atmak için kullanılan yapı
    /*
    await box.putAll({"araba": "mercedes", "yıl": 2012});
    */

    /*
    box.values.forEach((element) {
      debugPrint(element.toString());
    });
    */

    debugPrint(box.toMap().toString());
    debugPrint(
        box.get("tema")); //key anahtarına göre erişmek istersek kullanabiliriz

    //index değeri ile erişim, add ile eklediklerimizde doğru çalışmaz, put ile koyduklarımızda
    debugPrint(box.getAt(4));
    debugPrint(box.length.toString()); //eleman sayısını yazdırmak için

    await box.delete("tc"); //keyi tc olan değeri silmek için
    await box.deleteAt(0); //indeksi 0 olanı silmek için

    await box.putAt(0, "yeni değer"); //güncelleme yapmak için

    debugPrint(box.toMap().toString());
  }

  void _customData() async {
    var omer = Ogrenci(5, "Omer", GozRenk.SIYAH);
    var hasan = Ogrenci(15, "Hasan", GozRenk.YESIL);

    var box = Hive.box<Ogrenci>("ogrenciler");
    await box.clear();

    box.add(omer);
    box.add(hasan);

    debugPrint(box.toMap().toString());
  }

  void _lazyAndEncrytedBox() async {
    var sayilar = Hive.lazyBox<int>("sayilar");
    for (int i = 0; i < 50; i++) {
      await sayilar.add(i * 50);
    }

    for (int i = 0; i < 50; i++) {
      debugPrint((await sayilar.getAt(i)).toString());
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _lazyAndEncrytedBox,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}
