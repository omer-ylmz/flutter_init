import 'package:flutter/material.dart';
import 'package:proje_1/data/strings.dart';
import 'package:proje_1/model/burc.dart';

class AnaSayfa extends StatelessWidget {
  AnaSayfa({super.key});
  // List<Burc> tumBurclar = veriKaynaginiHazirla();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(Strings.APP_NAME),
      ),
      body: ListView.builder(
        itemBuilder: (context, index) {
          return Container(
            margin: EdgeInsets.all(4),
            padding: EdgeInsets.all(8),
            decoration: BoxDecoration(
              border: Border.all(
                color: Colors.black12,
                width: 2,
              ),
              borderRadius: BorderRadius.all(
                Radius.circular(10),
              ),
            ),
            child: listeTasarimi(context, index),
          );
        },
        itemCount: 12,
      ),
    );
  }

  ListTile listeTasarimi(BuildContext context, index) {
    return ListTile(
      leading: CircleAvatar(
        backgroundImage: AssetImage("images/" +
            "${Strings.BURC_ADLARI[index].toLowerCase()}" +
            "${index + 1}" +
            ".png"),
        backgroundColor: Colors.white,
      ),
      title: Text(Strings.BURC_ADLARI[index]),
      subtitle: Text(Strings.BURC_TARIHLERI[index]),
      trailing: ElevatedButton(
        style: ButtonStyle(
            backgroundColor: MaterialStatePropertyAll(Colors.white)),
        onPressed: () {
          var secilen = index;
          Navigator.pushNamed(context, "/detaySayfasi", arguments: secilen);
        },
        child: Icon(
          Icons.new_label_outlined,
          color: Colors.pink,
        ),
      ),
    );
  }

  // static List<Burc> veriKaynaginiHazirla() {
  //   List<Burc> gecici = [];
  //   for (int i = 0; i <= 12; i++) {
  //     Burc eklenecekBurc = Burc(burcAdi: Strings., burcTarihi: burcTarihi, burcDetay: burcDetay, burcKucukResim: burcKucukResim, burcBuyukReesim: burcBuyukReesim)
  //     gecici.add(eklenecekBurc);
  //   }
  //   return gecici;
  // }
}
