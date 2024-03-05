import 'dart:convert';
import 'dart:io';

import 'package:bolum_27_hive_kullanimi_ve_kalici_depolama/model/my_models.dart';
import 'package:bolum_27_hive_kullanimi_ve_kalici_depolama/services/local_storage.dart';
import 'package:path_provider/path_provider.dart';
import 'package:flutter/material.dart';

class FileStorageServices implements LocalStorageService {
  _getFilePath() async {
    var filePath = await getApplicationDocumentsDirectory();
    debugPrint("${filePath.path}buradaaaaa");
    return filePath.path;
  }

  FileStorageServices() {
    _createFile();
  }

  Future<File> _createFile() async {
    var file = File(await _getFilePath() + "/info.txt");
    return file;
  }

  @override
  Future<void> verileriKaydet(UserInformation userInformation) async {
    var file = await _createFile();
    await file.writeAsString(jsonEncode(userInformation));
  }

  @override
  Future<UserInformation> verileriOku() async {
    try {
      var file = await _createFile();
      var dosyaStringIcerik = await file.readAsString();
      var json = jsonDecode(dosyaStringIcerik);
      return UserInformation.fromJson(json);
    } catch (e) {
      debugPrint(e.toString());
    }
    return UserInformation(
        isim: "", cinsiyet: Cinsiyet.KADIN, renkler: [], ogrenciMi: false);
  }
}
