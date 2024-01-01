import 'package:flutter/material.dart';

class StepperOrnek extends StatefulWidget {
  const StepperOrnek({super.key});

  @override
  State<StepperOrnek> createState() => _StepperOrnekState();
}

class _StepperOrnekState extends State<StepperOrnek> {
  int _aktifStep = 0;
  String isim = "", mail = "", sifre = "";
  List<Step> tumStepler = [];
  bool hata = false;
  var key0 = GlobalKey<FormFieldState>();
  var key1 = GlobalKey<FormFieldState>();
  var key2 = GlobalKey<FormFieldState>();

  @override
  void initState() {
    // TODO: implement initState
    tumStepler = _tumStepler();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Stepper Örnek"),
      ),
      body: SingleChildScrollView(
        child: Stepper(
          
          steps: _tumStepler(),
          currentStep:
              _aktifStep, //hangi stepe tıklandığı zaman aktif olmasını ayarlamak için
          /*
          onStepTapped: (tiklanilanStep) {
            //hangi stepin tıklandığında index ile aktiflik ayarlamak için
            setState(() {
              _aktifStep = tiklanilanStep;
            });
          },
          */

          onStepContinue: () {
            setState(() {
              _ileriButonuKontrolu();
            });
          },
          onStepCancel: () {
            //cancel butonuna bastığımızda yapılacak işlemler
            if (_aktifStep == 0) {
              //eğer listenin ilk elemanı ise cancel çalışmasın
              Null;
            } else {
              setState(() {
                _aktifStep--;
              });
            }
          },
        ),
      ),
    );
  }

  List<Step> _tumStepler() {
    //sadece formlarla ilgili kısım
    List<Step> stepler = [
      Step(
        title: Text("Username Giriniz"),
        subtitle: Text("Username altbaşlık"),
        state: _stateAyarla(0), //başındaki iconu ayarlama
        isActive: true,
        content: TextFormField(
          key: key0,
          decoration: InputDecoration(
            labelText: "UsernameLabel",
            hintText: "UsernameHint",
            border: OutlineInputBorder(),
          ),
          validator: (girilendeger) {
            if (girilendeger!.length < 6) {
              return "En az 6 karakter giriniz";
            }
          },
          onSaved: (girilenDeger) {
            isim = girilenDeger!;
          },
        ),
      ),
      Step(
        title: Text("Mail Giriniz"),
        subtitle: Text("Mail altbaşlık"),
        state: _stateAyarla(1), //başındaki iconu ayarlama
        isActive: true,
        content: TextFormField(
          key: key1,
          decoration: InputDecoration(
            labelText: "MailLabel",
            hintText: "MailHint",
            border: OutlineInputBorder(),
          ),
          validator: (girilenDeger) {
            if (girilenDeger!.length < 6 && !girilenDeger.contains("@")) {
              return "Geçerli mail adresi giriniz";
            }
          },
          onSaved: (girilenDeger) {
            mail = girilenDeger!;
          },
        ),
      ),
      Step(
        title: Text("Şifre Giriniz"),
        subtitle: Text("Şifre altbaşlık"),
        state: _stateAyarla(2), //başındaki iconu ayarlama
        isActive: true,
        content: TextFormField(
          key: key2,
          decoration: InputDecoration(
            labelText: "ŞifreLabel",
            hintText: "ŞifreHint",
            border: OutlineInputBorder(),
          ),
          validator: (girilendeger) {
            if (girilendeger!.length < 6) {
              return "Şifre en az 6 karakter olmalı";
            }
          },
          onSaved: (girilenDeger) {
            sifre = girilenDeger!;
          },
        ),
      ),
    ];
    return stepler;
  }

  StepState _stateAyarla(int oAnkiStep) {
    //ikonları hata ve edit durumlarına göre kontrol etme
    StepState state = StepState.complete;

    if (_aktifStep == oAnkiStep) {
      if (hata) {
        return StepState.error;
      } else {
        return StepState.editing;
      }
    } else {
      return StepState.complete;
    }
  }

  void _ileriButonuKontrolu() {
    switch (_aktifStep) {
      case 0:
        {
          if (key0.currentState!.validate()) {
            key0.currentState!.save();
            hata = false;
            _aktifStep++;
          } else {
            hata = true;
          }
        }
      case 1:
        {
          if (key1.currentState!.validate()) {
            key1.currentState!.save();
            hata = false;
            _aktifStep++;
          } else {
            hata = true;
          }
        }
      case 2:
        {
          if (key2.currentState!.validate()) {
            key2.currentState!.save();
            hata = false;
            formTamamlandi();
          } else {
            hata = true;
          }
        }
    }
  }

  void formTamamlandi() {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: Text("isim = > $isim mail = > $mail  sifre = > $sifre"),
    ));
  }
}
