// ignore_for_file: deprecated_member_use, prefer_final_fields, no_leading_underscores_for_local_identifiers

import 'package:bolum_27_hive_kullanimi_ve_kalici_depolama/model/my_models.dart';
import 'package:bolum_27_hive_kullanimi_ve_kalici_depolama/services/file_storage.dart';
import 'package:bolum_27_hive_kullanimi_ve_kalici_depolama/services/local_storage.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class SharedPreferenceKullanimi extends StatefulWidget {
  const SharedPreferenceKullanimi({super.key});

  @override
  State<SharedPreferenceKullanimi> createState() =>
      _SharedPreferenceKullanimiState();
}

class _SharedPreferenceKullanimiState extends State<SharedPreferenceKullanimi> {
  var _secilenCinsiyet = Cinsiyet.KADIN;
  var _secilenRenkler = <String>[];
  var _ogrenciMi = false;
  TextEditingController _nameController = TextEditingController();
  final LocalStorageService _preferenceService = FileStorageServices();

  //önceden girilen verileri program başlarken okusun diye burada çalıştırdık
  @override
  void initState() {
    super.initState();
    _verileriOku();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Shared Preference"),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      body: ListView(
        children: [
          ListTile(
            title: TextField(
              controller: _nameController,
              decoration: const InputDecoration(labelText: "Adınızı Giriniz"),
            ),
          ),
          //sınıfları tekrar tekrar çağırmayalım diye
          for (var item in Cinsiyet.values)
            _buildRadioListTiles(describeEnum(item), item),
          for (var item in Renkler.values) _buildCheckboxListTile(item),
          SwitchListTile(
            title: const Text("Ogrenci Misin ?"),
            value: _ogrenciMi,
            onChanged: (value) {
              setState(() {
                _ogrenciMi = value;
              });
            },
          ),
          TextButton(
              onPressed: () {
                var _userInformation = UserInformation(
                    isim: _nameController.text,
                    cinsiyet: _secilenCinsiyet,
                    renkler: _secilenRenkler,
                    ogrenciMi: _ogrenciMi);
                _preferenceService.verileriKaydet(_userInformation);
              },
              child: const Text("Kaydet"))
        ],
      ),
    );
  }

  CheckboxListTile _buildCheckboxListTile(Renkler renk) {
    return CheckboxListTile(
      //enum dosyasında arama yapmak için
      title: Text(describeEnum(renk)),
      value: _secilenRenkler.contains(describeEnum(renk)),
      onChanged: (bool? deger) {
        if (deger == false) {
          _secilenRenkler.remove(describeEnum(renk));
        } else {
          _secilenRenkler.add(describeEnum(renk));
        }
        setState(() {});
      },
    );
  }

  RadioListTile<Cinsiyet> _buildRadioListTiles(
      String cinsiyet, Cinsiyet cinsiyettype) {
    return RadioListTile(
      title: Text(cinsiyet),
      value: cinsiyettype,
      groupValue: _secilenCinsiyet,
      onChanged: (secilmisCinsiyet) {
        setState(() {
          _secilenCinsiyet = secilmisCinsiyet!;
        });
      },
    );
  }

  void _verileriOku() async {
    var info = await _preferenceService.verileriOku();

    setState(() {
      _nameController.text = info.isim;
      _secilenCinsiyet = info.cinsiyet;
      _secilenRenkler = info.renkler;
      _ogrenciMi = info.ogrenciMi;
    });
  }
}
