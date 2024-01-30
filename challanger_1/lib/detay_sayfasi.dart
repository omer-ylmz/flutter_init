// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';

class Detay extends StatefulWidget {
  //isimlendirilmiş değişkene veri göndermek için
  // ignore: prefer_typing_uninitialized_variables
  var imgpath;
  Detay({
    this.imgpath,
    super.key,
  });

  @override
  State<Detay> createState() => _DetayState();
}

class _DetayState extends State<Detay> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(children: [
        Hero(
          tag: widget
              .imgpath, //bu resmi animasyon olarak sayfa geçişinde kullan demek gerekli her iki yerde de,
          child: Container(
            //ekranın genişliği ve yüksekliği kadar yer kaplaması için
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            decoration: BoxDecoration(
                image: DecorationImage(
                    //bu sayfanın sahip olduğu widgete git o değişkeni oku
                    image: AssetImage(widget.imgpath),
                    fit: BoxFit.cover)),
          ),
        ),
        Positioned(
          bottom: 15,
          left: 15,
          right: 15,
          child: Container(
            decoration: BoxDecoration(
                color: Colors.white, borderRadius: BorderRadius.circular(20)),
            height: 225,
            width: MediaQuery.of(context).size.width - 30,
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                children: [
                  Row(
                    children: [
                      Expanded(
                        flex: 1,
                        child: Container(
                          width: 110,
                          height: 130,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            border: Border.all(width: 1, color: Colors.grey),
                            image: const DecorationImage(
                                image: AssetImage("assets/images/dress.jpg"),
                                fit: BoxFit.contain),
                          ),
                        ),
                      ),
                      const SizedBox(
                        width: 20,
                      ),
                      Expanded(
                        flex: 2,
                        child: SizedBox(
                          height: 130,
                          child: Expanded(
                            child: Column(
                              children: [
                                Container(
                                  alignment: Alignment.topLeft,
                                  child: const Text(
                                    "LAMINATED",
                                    style: TextStyle(
                                        fontFamily: "AnaYaziTipi",
                                        fontWeight: FontWeight.bold,
                                        fontSize: 20),
                                  ),
                                ),
                                const SizedBox(
                                  height: 5,
                                ),
                                Row(
                                  children: [
                                    const Text(
                                      "Louis vuitton ",
                                      style: TextStyle(
                                          fontFamily: "AnaYaziTipi",
                                          fontWeight: FontWeight.bold,
                                          color: Colors.grey),
                                    ),
                                    Container(
                                      width: 15,
                                      height: 15,
                                      decoration: const BoxDecoration(
                                          image: DecorationImage(
                                              image: AssetImage(
                                                  "assets/images/louisvuitton.jpg"),
                                              fit: BoxFit.cover)),
                                    ),
                                  ],
                                ),
                                const SizedBox(height: 20),
                                const Text(
                                    "Değişime açık ol, başarıya giden yol sürekli öğrenmekten geçer.",
                                    style: TextStyle(
                                      fontFamily: "AnaYaziTipi",
                                      fontWeight: FontWeight.bold,
                                      color: Colors.grey,
                                      fontSize: 12,
                                    ))
                              ],
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                  const Divider(
                    color: Colors.grey,
                  ),
                  Expanded(
                    child: ListTile(
                        leading: const Text(
                          "6500₺",
                          style: TextStyle(
                              fontFamily: "AnaYaziTipi",
                              fontWeight: FontWeight.bold,
                              fontSize: 20),
                        ),
                        trailing: FloatingActionButton(
                          onPressed: () {},
                          backgroundColor: Colors.brown,
                          child: const Center(
                            child: Icon(
                              Icons.arrow_forward_ios,
                              color: Colors.white,
                            ),
                          ),
                        )),
                  )
                ],
              ),
            ),
          ),
        ),
        Positioned(
            top: MediaQuery.of(context).size.height / 2,
            left: 50,
            child: Container(
              height: 40,
              width: 130,
              decoration: BoxDecoration(
                color: Colors.black.withOpacity(0.4),
                borderRadius: BorderRadius.circular(8),
              ),
              child: const Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Center(
                    child: Text(
                      "LAMINATED",
                      style: TextStyle(
                          fontFamily: "AnaYaziTipi",
                          color: Colors.white,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                  Icon(
                    Icons.arrow_forward_ios,
                    color: Colors.white,
                  )
                ],
              ),
            ))
      ]),
    );
  }
}
