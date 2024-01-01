import 'package:flutter/material.dart';
import 'package:email_validator/email_validator.dart';

class TextFormFieldKullanimi extends StatefulWidget {
  const TextFormFieldKullanimi({super.key});

  @override
  State<TextFormFieldKullanimi> createState() => _TextFormFieldKullanimiState();
}

class _TextFormFieldKullanimiState extends State<TextFormFieldKullanimi> {
  String _email = "", _password = "", _username = "";
  final _formKey = GlobalKey<FormState>(); //key tanımı için
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Textform Field Kullanımı"),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Form(
            //yenileme, veri alma gibi işlemler için form ile sarmalıyoruz
            key:
                _formKey, //forma herhangi bir yerden erişmek için key ataması yapmak gerekir

            // autovalidateMode: AutovalidateMode
            //     .always, // durum kontrolunu her zaman aktif etmek için bunu yapmak gerekir

            autovalidateMode: AutovalidateMode.onUserInteraction,  //kullanıca etkileşime girdiği zaman durum kontrolleri çalışır

            child: Column(
              children: [
                TextFormField(
                  // initialValue:
                  //     "omeryilmaz", //ilk olarak bu değer yazılı gelir, test yaparken kullanılabilir
                  decoration: InputDecoration(
                    // errorStyle: TextStyle(color: Colors.orange), //hata rengini değiştirmek istersek
                    labelText: "Username",
                    hintText: "Username",
                    border: OutlineInputBorder(
                      borderSide: BorderSide(width: 1),
                    ),
                  ),
                  onSaved: (deger) {
                    _username = deger!;
                  },

                  validator: (value) {
                    //karakter sınırlamalarını kontrol etmek için kullanırız
                    if (value!.length < 4) {
                      return "Username en az 4 karakter olmalı";
                    } else {
                      return null;
                    }
                  },
                ),
                SizedBox(
                  height: 10,
                ),
                TextFormField(
                  // initialValue:
                  //     "omer.yilmaz.gru@hotmail.com", //ilk olarak bu değer yazılı gelir, test yaparken kullanılabilir
                  keyboardType: TextInputType.emailAddress,
                  decoration: InputDecoration(
                    // errorStyle: TextStyle(color: Colors.orange), //hata rengini değiştirmek istersek
                    labelText: "Email",
                    hintText: "Email",
                    border: OutlineInputBorder(
                      borderSide: BorderSide(width: 1),
                    ),
                  ),
                  onSaved: (deger) {
                    _email = deger!;
                  },

                  validator: (value) {
                    //karakter sınırlamalarını kontrol etmek için kullanırız
                    if (EmailValidator.validate(value!)) {
                      //mail kontrolu yapan sınıfı kullanarak işlem yaptık
                      return null;
                    } else {
                      return "Hatalı mail adresi girişi yaptınız";
                    }
                  },
                ),
                SizedBox(
                  height: 10,
                ),
                TextFormField(
                  // initialValue:
                  //     "omer.yilmaz.gru@hotmail.com", //ilk olarak bu değer yazılı gelir, test yaparken kullanılabilir
                  keyboardType: TextInputType.text,
                  decoration: InputDecoration(
                    // errorStyle: TextStyle(color: Colors.orange), //hata rengini değiştirmek istersek
                    labelText: "Password",
                    hintText: "Password",
                    border: OutlineInputBorder(
                      borderSide: BorderSide(width: 1),
                    ),
                  ),
                  onSaved: (deger) {
                    //değerleri almak için kullanıyoruz bir değişkene
                    _password = deger!;
                  },

                  validator: (value) {
                    //karakter sınırlamalarını kontrol etmek için kullanırız
                    if (value!.length < 6) {
                      return "Password en az 6 karakter olmalı";
                    } else {
                      return null;
                    }
                  },
                ),
                SizedBox(
                  height: 10,
                ),
                ElevatedButton(
                    onPressed: () {
                      bool _validate = _formKey.currentState!
                          .validate(); //karakter kontrolu sağlar
                      if (_validate) {
                        //eğer true dönerse
                        _formKey.currentState!.save(); //onSaved lar çalışır

                        String result =
                            "username: $_username\nemail: $_email\npassword: $_password ";

                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            backgroundColor: Colors.blue,
                            content: Text(
                              result,
                              style: TextStyle(fontSize: 20),
                            ), //küçük bir barda ekrana alınan verileri basmak için kullandık
                          ),
                        );
                        _formKey.currentState!
                            .reset(); //formu sıfırlamak için kullanılır
                      }
                    },
                    child: Text("Onayla"))
              ],
            ),
          ),
        ),
      ),
    );
  }
}
