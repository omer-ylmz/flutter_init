import 'package:flutter/material.dart';

class TabOrnek extends StatefulWidget {
  const TabOrnek({super.key});

  @override
  State<TabOrnek> createState() => _TabOrnekState();
}

class _TabOrnekState extends State<TabOrnek>
    with SingleTickerProviderStateMixin {
  //with anahtar kelimesi ile başka sınıfında özelliklerini kullanabiliyoruz
  late TabController tabControllerim;

  @override
  void initState() {
    super.initState();
    tabControllerim = TabController(length: 3, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.lightBlue,
        title: const Text(
          "Tab Kullanımı",
          style: TextStyle(color: Colors.white),
        ),
        bottom: tabBarim(),
      ),
      bottomNavigationBar: tabBarim(),
      body: TabBarView(
        controller:
            tabControllerim, //aşağıda geçilen tabbar ile burası arasında ilişki kurmak için controller gerekli
        children: [
          Container(
            //her bir tab için indekse göre çocuklar yazılır
            color: Colors.redAccent,
            child: const Center(
              child: Text(
                "Tab 1",
                style: TextStyle(fontSize: 48),
              ),
            ),
          ),
          Container(
            //her bir tab için indekse göre çocuklar yazılır
            color: Colors.blueAccent,
            child: const Center(
              child: Text(
                "Tab 2",
                style: TextStyle(fontSize: 48),
              ),
            ),
          ),
          Container(
            //her bir tab için indekse göre çocuklar yazılır
            color: Colors.greenAccent,
            child: const Center(
              child: Text(
                "Tab 3",
                style: TextStyle(fontSize: 48),
              ),
            ),
          ),
        ],
      ),
    );
  }

  TabBar tabBarim() {
    return TabBar(
      //tab kısmı için kullanıyoruz
      controller: tabControllerim, //controller kullanmak zorundayız

      tabs: const [
        Tab(
          icon: Icon(Icons.keyboard),
          text: "Tab 1",
        ),
        Tab(
          icon: Icon(Icons.lock),
          text: "Tab 2",
        ),
        Tab(
          icon: Icon(Icons.add_box),
          text: "Tab 3",
        )
      ],
    );
  }
}
