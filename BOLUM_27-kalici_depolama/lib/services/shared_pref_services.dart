// ignore_for_file: unused_local_variable, no_leading_underscores_for_local_identifiers, duplicate_ignore

import 'package:bolum_27_hive_kullanimi_ve_kalici_depolama/model/my_models.dart';
import 'package:bolum_27_hive_kullanimi_ve_kalici_depolama/services/local_storage.dart';
import 'package:shared_preferences/shared_preferences.dart';

//daha temiz işlem yapmak için bu dosyayı kullandık
class SharedPreferenceService implements LocalStorageService {
  @override
  Future<void> verileriKaydet(UserInformation userInformation) async {
    // ignore: no_leading_underscores_for_local_identifiers
    final _name = userInformation.isim;
    //sharedpreferences oluşturmak için
    final preferences = await SharedPreferences.getInstance();

    //name yi dosyaya "isim" karşılığı olarak gönder
    preferences.setString("isim", userInformation.isim);
    preferences.setBool("ogrenci", userInformation.ogrenciMi);
    preferences.setInt("cinsiyet", userInformation.cinsiyet.index);
    preferences.setStringList("renkler", userInformation.renkler);
  }

  @override
  Future<UserInformation> verileriOku() async {
    final preferences = await SharedPreferences.getInstance();
    var _isim = preferences.getString("isim") ?? " ";
    var _ogrenci = preferences.getBool("ogrenci") ?? false;
    var _cinsiyet = Cinsiyet.values[preferences.getInt("cinsiyet") ?? 0];
    var _renkler = preferences.getStringList("renkler") ?? <String>[];

    return UserInformation(
        isim: _isim,
        cinsiyet: _cinsiyet,
        renkler: _renkler,
        ogrenciMi: _ogrenci);
  }
}
