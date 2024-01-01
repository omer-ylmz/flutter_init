class Burc {
  final String _burcAdi;
  final String _burcTarihi;
  final String _burcDetay;
  final String _burcKucukResim;
  final String _burcBuyukReesim;

  Burc(
      {required String burcAdi,
      required String burcTarihi,
      required String burcDetay,
      required String burcKucukResim,
      required String burcBuyukReesim})
      : _burcAdi = burcAdi,
        _burcTarihi = burcTarihi,
        _burcDetay = burcDetay,
        _burcKucukResim = burcKucukResim,
        _burcBuyukReesim = burcBuyukReesim;
}
