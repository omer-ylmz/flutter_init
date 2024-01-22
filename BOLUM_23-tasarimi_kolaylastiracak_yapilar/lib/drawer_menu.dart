import 'package:flutter/material.dart';

class DrawerMenu extends StatefulWidget {
  const DrawerMenu({super.key});

  @override
  State<DrawerMenu> createState() => _DrawerMenuState();
}

class _DrawerMenuState extends State<DrawerMenu> {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      //appbardan açılan menü için
      child: Column(
        children: [
          UserAccountsDrawerHeader(
            //kullanici kısmı bilgileri için yapımız
            accountName: const Text("Omer Yilmaz"),
            accountEmail: const Text("omer.yilmaz.gru@hotmail.com"),
            currentAccountPicture: Image.network(
                "https://scontent.fszf2-1.fna.fbcdn.net/v/t1.6435-9/143263624_3583649415084300_2761494041749396333_n.jpg?_nc_cat=102&ccb=1-7&_nc_sid=be3454&_nc_ohc=xTr80bm_45MAX8hhH_d&_nc_ht=scontent.fszf2-1.fna&oh=00_AfA9BEl7MCx-uxQsnatt1H93WE-76APumzU0urD-korWHg&oe=65D30232"),
            // otherAccountsPictures: [],  birden fazla resim eklemek için
          ),
          Expanded(
            child: ListView(
              children: [
                const ListTile(
                  leading: Icon(Icons.home),
                  title: Text("Ana Sayfa"),
                  trailing: Icon(Icons.chevron_right),
                ),
                const ListTile(
                  leading: Icon(Icons.call),
                  title: Text("Ara"),
                  trailing: Icon(Icons.chevron_right),
                ),
                const ListTile(
                  leading: Icon(Icons.account_balance_wallet_sharp),
                  title: Text("Profil"),
                  trailing: Icon(Icons.chevron_right),
                ),
                const Divider(),
                InkWell(
                  //tıklanma özelliği kazandırmak için kullanılır
                  onTap: () {},
                  splashColor: Colors.cyan, //tıklanma rengi
                  child: const ListTile(
                    leading: Icon(Icons.account_balance_wallet_sharp),
                    title: Text("Profil"),
                    trailing: Icon(Icons.chevron_right),
                  ),
                ),
                const AboutListTile(
                  //lisans belirtmek için ancak lisans detaylarını değiştiremiyoruz
                  applicationName: "Flutter Dersleri",
                  applicationIcon: Icon(Icons.save),
                  applicationVersion: "3.0",
                  icon: Icon(Icons.keyboard),
                  aboutBoxChildren: [
                    Text("Child 1"),
                    Text("Child 2"),
                    Text("Child 3"),
                  ],
                  child: Text("About US"),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
