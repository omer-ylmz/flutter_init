import 'package:challanger_1/detay_sayfasi.dart';
import 'package:flutter/material.dart';

class AnaEkran extends StatefulWidget {
  const AnaEkran({super.key});

  @override
  State<AnaEkran> createState() => _AnaEkranState();
}

class _AnaEkranState extends State<AnaEkran>
    with SingleTickerProviderStateMixin {
  late TabController tabController;

  @override
  void initState() {
    super.initState();
    tabController = TabController(length: 4, vsync: this);  //tabbar için zorunlu olan controller tanımladık
  }

  @override
  void dispose() {
    tabController.dispose();  //kullanıldıktan sonra bellekten silinmesi için kullanılan alan
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Moda Uygulaması",
          style:
              TextStyle(fontFamily: "AnaYaziTipi", fontWeight: FontWeight.bold),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 10),
            child: IconButton(
              icon: const Icon(Icons.photo_camera),
              iconSize: 30,
              onPressed: () {},
            ),
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: 140,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: [
                  avatarTakip("assets/images/model1.jpeg",
                      "assets/images/chanellogo.jpg"),
                  avatarTakip("assets/images/model2.jpeg",
                      "assets/images/chloelogo.png"),
                  avatarTakip("assets/images/model3.jpeg",
                      "assets/images/louisvuitton.jpg"),
                  avatarTakip("assets/images/model1.jpeg",
                      "assets/images/chanellogo.jpg"),
                  avatarTakip("assets/images/model2.jpeg",
                      "assets/images/chloelogo.png"),
                ],
              ),
            ),
            ilanAlani(),
          ],
        ),
      ),
      bottomNavigationBar: Material(
        color: Colors.white,
        child: TabBar(controller: tabController, tabs: const [
          Tab(
            icon: Icon(
              Icons.more,
              color: Colors.grey,
              size: 22,
            ),
          ),
          Tab(
            icon: Icon(
              Icons.play_arrow,
              color: Colors.grey,
              size: 22,
            ),
          ),
          Tab(
            icon: Icon(
              Icons.navigation,
              color: Colors.grey,
              size: 22,
            ),
          ),
          Tab(
            icon: Icon(
              Icons.supervised_user_circle,
              color: Colors.grey,
              size: 22,
            ),
          )
        ]),
      ),
    );
  }

  Padding ilanAlani() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Material(
        borderRadius: BorderRadius.circular(15), //köşeleri yumuşatmak için
        elevation: 4,  //gçlgelendirme yapmak için
        child: SizedBox(
          height: 500,
          width: double.infinity,  //bütün alana sığdırmak için
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                const Row(
                  children: [
                    CircleAvatar(
                      foregroundImage: AssetImage("assets/images/model1.jpeg"),  //assetden resim çekmek için kullanılır
                      maxRadius: 30,  //avatarın boyutu büyütmek için kullanılır
                    ),
                    Expanded(
                      child: ListTile(
                        title: Text(
                          "Daisy",
                          style: TextStyle(
                            fontFamily: "AnaYaziTipi",
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        subtitle: Text("34 Mins ago"),
                        trailing: Icon(Icons.dehaze_outlined),
                      ),
                    )
                  ],
                ),
                const Text(
                  "Keşfetmeye hazır olun! Mağazamızda aradığınız her şeyi bulabilirsiniz. Son teknoloji ürünlerden şık ev dekorasyonuna kadar geniş bir seçenek sizi bekliyor.",
                  style: TextStyle(fontFamily: "AnaYaziTipi"),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 5, bottom: 5),
                  child: SizedBox(
                    height: 200,
                    child: Row(
                      children: [
                        Expanded(
                          flex: 1,  //oranlarla yapıları sığdırmak için
                          child: Padding(
                            padding: const EdgeInsets.only(right: 5),
                            child: InkWell(  //tıklanma özelliği kazandırmak için
                              onTap: () {
                                Navigator.of(context).push(MaterialPageRoute(
                                  builder: (context) => Detay(
                                      imgpath: "assets/images/modelgrid1.jpeg"),
                                ));
                              },
                              child: Hero(
                                //animasyonlu geçiş sağlar
                                tag:
                                    "assets/images/modelgrid1.jpeg", //bu resmi animasyon olarak sayfa geçişinde kullan demek gerekli her iki yerde de
                                child: Container(
                                  width: double.infinity,
                                  height: double.infinity,
                                  decoration: const BoxDecoration(
                                    image: DecorationImage(
                                        image: AssetImage(
                                            "assets/images/modelgrid1.jpeg"),
                                        fit: BoxFit.cover),
                                    borderRadius: BorderRadius.all(
                                      Radius.circular(10),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                        Expanded(
                          flex: 1,
                          child: Column(
                            children: [
                              Expanded(
                                child: Padding(
                                  padding:
                                      const EdgeInsets.only(left: 5, bottom: 5),
                                  child: InkWell(
                                    onTap: () {
                                      Navigator.of(context)
                                          .push(MaterialPageRoute(
                                        builder: (context) => Detay(
                                            imgpath:
                                                "assets/images/modelgrid2.jpeg"),
                                      ));
                                    },
                                    child: Hero(
                                      tag: "assets/images/modelgrid2.jpeg",
                                      child: Container(
                                        width: double.infinity,
                                        decoration: const BoxDecoration(
                                          image: DecorationImage(
                                              image: AssetImage(
                                                  "assets/images/modelgrid2.jpeg"),
                                              fit: BoxFit.cover),
                                          borderRadius: BorderRadius.all(
                                            Radius.circular(10),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              Expanded(
                                child: Padding(
                                  padding:
                                      const EdgeInsets.only(left: 5, top: 5),
                                  child: InkWell(
                                    onTap: () {
                                      Navigator.of(context)
                                          .push(MaterialPageRoute(
                                        builder: (context) => Detay(
                                            imgpath:
                                                "assets/images/modelgrid3.jpeg"),
                                      ));
                                    },
                                    child: Hero(
                                      tag: "assets/images/modelgrid3.jpeg",
                                      child: Container(
                                        width: double.infinity,
                                        decoration: const BoxDecoration(
                                          image: DecorationImage(
                                              image: AssetImage(
                                                  "assets/images/modelgrid3.jpeg"),
                                              fit: BoxFit.cover),
                                          borderRadius: BorderRadius.all(
                                            Radius.circular(10),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 8),
                  child: Row(
                    children: [
                      Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5),
                            color: Colors.grey.shade400),
                        child: const Padding(
                          padding: EdgeInsets.only(
                              top: 3, bottom: 3, left: 6, right: 6),
                          child: Text(
                            "# Louis vuittion",
                            style: TextStyle(
                              fontFamily: "AnaYaziTipi",
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(
                        width: 5,
                      ),
                      Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5),
                            color: Colors.grey.shade400),
                        child: const Padding(
                          padding: EdgeInsets.only(
                              top: 3, bottom: 3, left: 6, right: 6),
                          child: Text(
                            "# Chloe",
                            style: TextStyle(
                              fontFamily: "AnaYaziTipi",
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.only(top: 8, bottom: 8),
                  child: Divider(),
                ),
                const Row(
                  children: [
                    Icon(Icons.share),
                    SizedBox(
                      width: 4,
                    ),
                    Text(
                      "1.7k",
                      style: TextStyle(fontFamily: "AnaYaziTipi"),
                    ),
                    SizedBox(
                      width: 20,
                    ),
                    Icon(Icons.chat),
                    SizedBox(
                      width: 4,
                    ),
                    Text(
                      "325",
                      style: TextStyle(fontFamily: "AnaYaziTipi"),
                    ),
                    Expanded(
                      child: SizedBox(),
                    ),
                    Icon(
                      Icons.favorite_rounded,
                      color: Colors.red,
                    ),
                    SizedBox(
                      width: 4,
                    ),
                    Text(
                      "2.3k",
                      style: TextStyle(fontFamily: "AnaYaziTipi"),
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  Padding avatarTakip(String resim, String logo) {
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: Column(
        children: [
          Padding(
              padding: const EdgeInsets.only(bottom: 5),
              child: Stack(
                children: [
                  Container(
                    height: 80,
                    width: 80,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(40),
                      image: DecorationImage(
                        fit: BoxFit.cover,
                        image: AssetImage(
                          resim,
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    top: 55,
                    left: 55,
                    child: Container(
                      width: 25,
                      height: 25,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        image: DecorationImage(
                            image: AssetImage(logo), fit: BoxFit.contain),
                      ),
                    ),
                  )
                ],
              )),
          GestureDetector(
            onTap: () {
              debugPrint("Tıklandı");
            },
            child: Container(
              alignment: Alignment.center,
              height: 30,
              width: 75,
              decoration: BoxDecoration(
                color: Colors.brown,
                borderRadius: BorderRadius.circular(20),
              ),
              child: const Text(
                "Fallow",
                style:
                    TextStyle(fontFamily: "AnaYaziTipi", color: Colors.white),
              ),
            ),
          )
        ],
      ),
    );
  }
}
