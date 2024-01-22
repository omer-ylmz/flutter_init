import 'package:bolum_23_tasarimi_kolaylastiracak_yapilar/models/veri.dart';
import 'package:flutter/material.dart';

class AnaSayfa extends StatefulWidget {
  const AnaSayfa(Key k) : super(key: k);  //keyleri sınıfa tanıtmak için constracter gerekmekte

  @override
  State<AnaSayfa> createState() => _AnaSayfaState();
}

class _AnaSayfaState extends State<AnaSayfa> {
  List<Veri> tumVeriler = [
    Veri("Biz Kimiz?", "Biz kimizin içeriği buraya gelecek", false),
    Veri("Biz Neredeyiz?", "Biz neredeyizin içeriği buraya gelecek", false),
    Veri("Misyonumuz", "Misyonumuz içeriği buraya gelecek", false),
    Veri("Vizyonumuz", "Vizyonumuz içeriği buraya gelecek", false),
    Veri("İletişim", "İletişim içeriği buraya gelecek", false),
    Veri("İletişim", "İletişim içeriği buraya gelecek", false),
    Veri("İletişim", "İletişim içeriği buraya gelecek", false),
    Veri("İletişim", "İletişim içeriği buraya gelecek", false),
    Veri("İletişim", "İletişim içeriği buraya gelecek", false)
  ];

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: 9,
      itemBuilder: (context, index) {
        return ExpansionTile(
          //liste elemanları oluşturma yöntemi
          //üzerine tıkladığımızda aşağı yönlü içerik kısmı açılır, ayrı sayfaya gitmeden
          initiallyExpanded: tumVeriler[index]
              .expanded, //eğer bilgi kısmı açıksa true olarak değiştirecek
          key: PageStorageKey(
              "$index"), //storage bilgisi tutarken her biri farklı olduğudan ayırmamız gerekmekte
          title: Text(tumVeriler[index].baslik),
          children: [
            Container(
              color:
                  index % 2 == 0 ? Colors.red.shade200 : Colors.yellow.shade300,
              height: 100,
              width: double.infinity,
              child: Text(tumVeriler[index].icerik),
            ),
          ],
        );
      },
    );
  }
}
