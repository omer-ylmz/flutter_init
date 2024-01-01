import 'package:flutter/material.dart';

class TextFieldIslemleri extends StatefulWidget {
  final String title;
  const TextFieldIslemleri({super.key, required this.title});

  @override
  State<TextFieldIslemleri> createState() => _TextFieldIslemleriState();
}

class _TextFieldIslemleriState extends State<TextFieldIslemleri> {
  late TextEditingController _emailController;
  late FocusNode
      _focusNode; //autofocus ile ilgili daha detaylı işlem yapmak istersek
  int maxLineCount = 1;

  void initState() {
    super.initState(); //ilk değer atanır, atamalar genellikle burada yapılır.
    _emailController = TextEditingController(
        text: "omer@omer.com"); //ilk durumda bunu kullansın
    _focusNode = FocusNode();
    _focusNode.addListener(
      //focus olduğunda alanı büyütmek için kullanılabilir
      () {
        setState(() {
          if (_focusNode.hasFocus) {
            maxLineCount = 3;
          } else {
            maxLineCount = 1;
          }
        });
      },
    );
  }

  @override
  void dispose() {
    // yok etmek istediğiniz ifadeleri buraya yazarız
    _emailController
        .dispose(); //sayfa yenilemede her şey silinirken controller silinmez bunun elle silinmesi gerekir yoksa bellek sızıntısına sebep olur
    _focusNode
        .dispose(); //bu da otomatik silinmez elle silmek gerekir bellek için
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              //kullanıcadan veri almak için kullanılan yapı

              focusNode: _focusNode,

              controller:
                  _emailController, //controlleri textfile de kullanmak için

              keyboardType: TextInputType
                  .number, //klavyeden istenilen veriyi sınırlamak için

              textInputAction:
                  TextInputAction //klavyede enter tuşu sembolü değiştirmek için
                      .next,

              autofocus:
                  true, //başlangıçta kullanıcı buradan başlamaya zorlarız
              maxLines: maxLineCount, //5 satırlık yazı yazma alanı verir

              maxLength: 30, // maksimum uzunluğu sınırlamak için kullanılır

              onChanged: (String deger) {
                // setState(() {
                //   _emailController.text = deger;
                // });

                setState(() {
                  _emailController.value = TextEditingValue(
                    text: deger,
                    selection: TextSelection.collapsed(
                        offset: deger
                            .length), //imlecin konumu ile de ilgilenmek istersek
                  );
                });
              }, //bir şey değiştiğinde calışır, girilen veriyi okumak için ya da arama ekranlarında

              onSubmitted: (String deger) {
                print(deger);
              }, //onChanged gibi çalışır ancak sadece onaylandığı zaman veriyi yazdırır

              decoration: InputDecoration(
                //görsel düzenleme yapmak için kullanılır

                labelText: "Adınız", //başlık alanı ekler

                hintText:
                    "Adınızı bu alana giriniz", //alanda ne yapılacağını tarif edebileceğimiz kısım
                // icon: Icon(Icons.add),

                prefixIcon: Icon(Icons
                    .account_balance_rounded), //iconu alanın başına içine eklemek istersek

                suffixIcon: Icon(
                    Icons.abc), //iconu alanın sonuna içine eklemek istersek

                // filled: true, //arka plan rengi değiştirmek istersek
                // fillColor: Colors.red,

                border: OutlineInputBorder(
                  //kenarlıklarla oynamak istersek
                  borderRadius: BorderRadius.all(Radius.circular(20)),
                ),
              ),
              cursorColor: Colors.red,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(_emailController.text),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              //kullanıcadan veri almak için kullanılan yapı
              keyboardType: TextInputType
                  .number, //klavyeden istenilen veriyi sınırlamak için
              textInputAction:
                  TextInputAction //klavyede enter tuşu sembolü değiştirmek için
                      .next,
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // _emailController.text =
          //     "omer.yilmaz.gru@hotmail.com"; //controller ile text alanını güncelleyebiliriz, böyle kullansak bütün ekran güncellenemez

          setState(() {
            //ekranı günceller
            _emailController.text = "omer.yilmaz.gru@hotmail.com";
          });
        },
        child: Icon(Icons.edit),
      ),
    );
  }
}
