import 'package:bolum_23_tasarimi_kolaylastiracak_yapilar/ana_sayfa.dart';
import 'package:bolum_23_tasarimi_kolaylastiracak_yapilar/arama_sayfasi.dart';
import 'package:bolum_23_tasarimi_kolaylastiracak_yapilar/drawer_menu.dart';
import 'package:bolum_23_tasarimi_kolaylastiracak_yapilar/page_view.dart';
import 'package:bolum_23_tasarimi_kolaylastiracak_yapilar/tabs.dart';
import 'package:flutter/material.dart';

class CustomFontKullanimi extends StatefulWidget {
  const CustomFontKullanimi({super.key});

  @override
  State<CustomFontKullanimi> createState() => _CustomFontKullanimiState();
}

class _CustomFontKullanimiState extends State<CustomFontKullanimi> {
  int secilenMenuItem = 0;
  List<Widget> tumSayfalar = [];
  late AnaSayfa sayfaAna;
  late AramaSayfasi sayfaArama;
  late PageViewOrnek sayfaEkleme;

//  ONEMLİ

// sayfada kaldığımız yerleri saklamak için kullanılır, her bir sayfa değişikliğinde önceki sayfa 0 dan açılmaz
// en son nasıl bıraktıysanız kaldığı yerden devam eder
  var keyAnaSayfa = const PageStorageKey("key_ana_sayfa");
  var keyArama = const PageStorageKey("key_arama_sayfa");

  @override
  void initState() {
    super.initState();
    //ardından keyleri sayfalara geçmemiz gerekmekte
    sayfaAna = AnaSayfa(keyAnaSayfa);
    sayfaArama = AramaSayfasi(keyArama);
    sayfaEkleme = const PageViewOrnek();
    tumSayfalar = [sayfaAna, sayfaArama, sayfaEkleme];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const DrawerMenu(),
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: const Text("Custom Font Kullanimi"),
      ),
      body: tumSayfalar[secilenMenuItem],
      bottomNavigationBar: bottomNavMenu(),
    );
  }

  BottomNavigationBar bottomNavMenu() {
    return BottomNavigationBar(
      //en altta geçişler için kullanılır
      items: const [
        //itemleri dizi halinde vermek gerekir
        BottomNavigationBarItem(
          icon: Icon(Icons.home),
          label: "Ana Sayfa",
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.search),
          label: "Ara",
          activeIcon: Icon(
              Icons.call), //aktif olan elemanın iconunu değiştirmek istersek
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.add),
          label: "Page View",
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.account_box),
          label: "Profil",
        ),
      ],
      type: BottomNavigationBarType
          .fixed, //4 ten fazla shiping moda girmesini engellemek için kullanılır,
      // eğer shifting modda olursa hepsine arkaplan rengi vermek gerekli
      currentIndex:
          secilenMenuItem, //seçilenin rengi değişsin diye yaptığımız işlem
      onTap: (value) {
        setState(() {
          if (value != 3) {
            secilenMenuItem = value;
          } else if (value == 3) {
            Navigator.of(context)
                .push(MaterialPageRoute(
                  builder: (context) => const TabOrnek(),
                ))
                .then((bb) => secilenMenuItem = 0);
          }
        });
      },
      selectedItemColor:
          Colors.amber, //seçilen elemanın rengini değiştirmek için
    );
  }
}
