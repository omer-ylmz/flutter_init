import 'package:flutter/material.dart';
import 'package:intl/intl.dart'; //intl kütüphanesini kullanmak için

class DateTimePicker extends StatefulWidget {
  const DateTimePicker({super.key});

  @override
  State<DateTimePicker> createState() => _DateTimePickerState();
}

class _DateTimePickerState extends State<DateTimePicker> {
  @override
  Widget build(BuildContext context) {
    DateTime suan = DateTime.now(); //saunki kullanıcının tarihi
    DateTime ucAyOncesi = DateTime(2024, suan.month - 3); //üç ay öncesini aldık
    DateTime yirmiGunSonrasi =
        DateTime(2024, 1, suan.day + 20); //yirmi gün sonrasını aldık

    TimeOfDay suAnkiSaat = TimeOfDay.now(); //suanki kullanıcın saati

    return Scaffold(
      appBar: AppBar(
        title: Text("Date Time Picker"),
      ),
      body: Center(
        child: Column(
          children: [
            ElevatedButton(
              onPressed: () {
                showDatePicker(
                  //tarih seçme yapısı için (daha fazlası için date_format kütüphanesine bakılabilir)
                  context:
                      context, //benim widget ağacımda nerede açılacağını flutter kendi içinde belirlemek için kullanır
                  initialDate: suan, //tarih ne ile başlasın
                  firstDate: ucAyOncesi, //bir aralık seçmek için
                  lastDate: yirmiGunSonrasi, //kaç gün sonrasına gidebilmek için
                ).then((secilenTarih) {
                  //secildikten sonra (future nesnesi) buradan veri döneceği için then ile kullanıyoruz
                  debugPrint(secilenTarih.toString());
                  debugPrint(secilenTarih!.toIso8601String());
                  debugPrint(secilenTarih.millisecondsSinceEpoch
                      .toString()); //1970 ile şuan ki tarih arasındaki mili saniye farkını bize veriyor, firabasede genellikle bu kullanılır
                  debugPrint(
                    secilenTarih.toUtc().toIso8601String(),
                  );
                  var tarih = DateFormat('dd/MM/yyyy hh:mm a');
                  print(tarih.format(
                      secilenTarih)); //intl kütüphanesi ile birlikte daha güzel ifade alabilmek için
                });
              },
              child: Text("Tarih Seç"),
              style: ButtonStyle(
                backgroundColor: MaterialStatePropertyAll(Colors.green),
              ),
            ),
            ElevatedButton(
              onPressed: () {
                showTimePicker(context: context, initialTime: suAnkiSaat)
                    .then((secilenSaat) {
                  debugPrint(secilenSaat!.format(context));
                  debugPrint("${secilenSaat.hour} : ${secilenSaat.minute}");
                });
              },
              child: Text("Saat Seç"),
            )
          ],
        ),
      ),
    );
  }
}
