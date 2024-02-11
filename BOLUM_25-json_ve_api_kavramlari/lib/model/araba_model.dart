
import 'dart:convert';

Araba arabaFromJson(String str) => Araba.fromJson(json.decode(str));

String arabaToJson(Araba data) => json.encode(data.toJson());

class Araba {
    final String arabaAdi;
    final String ulke;
    final int kurulusYil;
    final List<Model> model;

    Araba({
        required this.arabaAdi,
        required this.ulke,
        required this.kurulusYil,
        required this.model,
    });

    factory Araba.fromJson(Map<String, dynamic> json) => Araba(
        arabaAdi: json["araba_adi"],
        ulke: json["ulke"],
        kurulusYil: json["kurulus_yil"],
        model: List<Model>.from(json["model"].map((x) => Model.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "araba_adi": arabaAdi,
        "ulke": ulke,
        "kurulus_yil": kurulusYil,
        "model": List<dynamic>.from(model.map((x) => x.toJson())),
    };
}

class Model {
    final String modelAdi;
    final int fiyat;
    final bool benzinli;

    Model({
        required this.modelAdi,
        required this.fiyat,
        required this.benzinli,
    });

    factory Model.fromJson(Map<String, dynamic> json) => Model(
        modelAdi: json["model_adi"],
        fiyat: json["fiyat"],
        benzinli: json["benzinli"],
    );

    Map<String, dynamic> toJson() => {
        "model_adi": modelAdi,
        "fiyat": fiyat,
        "benzinli": benzinli,
    };
}