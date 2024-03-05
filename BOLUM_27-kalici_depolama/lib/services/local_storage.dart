import 'package:bolum_27_hive_kullanimi_ve_kalici_depolama/model/my_models.dart';

abstract class LocalStorageService {
  Future<void> verileriKaydet(UserInformation userInformation);

  Future<UserInformation> verileriOku();
}
