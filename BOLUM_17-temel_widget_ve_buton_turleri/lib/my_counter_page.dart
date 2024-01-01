import 'package:flutter/material.dart';

class MyCounterPage extends StatefulWidget {
  const MyCounterPage({super.key});

  @override
  State<MyCounterPage> createState() => _MyCounterPageState();
}

class _MyCounterPageState extends State<MyCounterPage> {
  int _sayac = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("My Counter App Bar")),
      body: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          MyNewTextWidget(),
          Text(_sayac.toString(),
              style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold))
        ],
      )),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          debugPrint("Sayaca Tıklandı");
          sayaciArtir();
        },
        child: Icon(Icons.add),
      ),
    );
  }

  void sayaciArtir() {
    setState(() {});
    _sayac++;
  }
}

class MyNewTextWidget extends StatelessWidget {
  const MyNewTextWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      "Butona Basılma Miktari",
      style: TextStyle(fontSize: 24),
    );
  }
}
