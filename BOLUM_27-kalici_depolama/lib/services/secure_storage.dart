// ignore_for_file: no_leading_underscores_for_local_identifiers

import 'dart:convert';

import 'package:bolum_27_hive_kullanimi_ve_kalici_depolama/model/my_models.dart';
import 'package:bolum_27_hive_kullanimi_ve_kalici_depolama/services/local_storage.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

//verileri şifreli olarak kaydeder
class SecureStorageServices implements LocalStorageService{
  late final FlutterSecureStorage preferences;

  @override
  Future<void> verileriKaydet(UserInformation userInformation) async {
    //yazma işlemlerinde await gerekli
    await preferences.write(key: "isim", value: userInformation.isim);
    await preferences.write(
        key: "ogrenci", value: userInformation.ogrenciMi.toString());
    await preferences.write(
        key: "cinsiyet", value: userInformation.cinsiyet.index.toString());

    //liste elemanı jsona çevirip işlemi hatasız sürdürebiliriz
    await preferences.write(
        key: "renkler", value: jsonEncode(userInformation.renkler));
  }

  @override
  Future<UserInformation> verileriOku() async {
    //ilk nesneyi alma işlemlerinde herhangi bir async await kullanımı gerekli değil
    preferences = const FlutterSecureStorage();

//okuma ve yazmada await kullanmak zorundayız
    var _isim = await preferences.read(key: "isim") ?? " ";
    var _ogrenciString = await preferences.read(key: "ogrenci") ?? "false";
    var _cinsiyetString = await preferences.read(key: "cinsiyet") ?? "0";
    var _cinsiyet = Cinsiyet.values[int.parse(_cinsiyetString)];

    var _renklerString = await preferences.read(key: "renkler") ?? "";
    //string olan yapıyı listeye dönüştürür
    // ignore: unnecessary_null_comparison
    var _renkler = _renklerString == null
        ? <String>[]
        : List<String>.from(jsonDecode(_renklerString));
    var _ogrenci =
        _ogrenciString.toString().toLowerCase() == "true" ? true : false;

    return UserInformation(
        isim: _isim,
        cinsiyet: _cinsiyet,
        renkler: _renkler,
        ogrenciMi: _ogrenci);
  }
}
