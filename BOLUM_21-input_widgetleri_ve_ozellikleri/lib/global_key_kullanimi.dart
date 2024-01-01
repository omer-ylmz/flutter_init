import 'package:flutter/material.dart';

class GlobalKeykullanimi extends StatelessWidget {
  GlobalKeykullanimi({super.key});
  final sayacWidgetKey = GlobalKey<
      __SayacWidgetStateState>(); //erişmek istediğimiz sınıf türüne göre global key tanımladık, global keyler benzersizdir.

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Global Key Kullanimi"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("Butona Basılma Miktarı:"),
            _SayacWidgetState(
              key:
                  sayacWidgetKey, //fonksiyonda key olarak global keyi tanımladık
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          sayacWidgetKey.currentState!
              .arttir(); //o fonksiyonun methodutuna önce state ardından methodu yazarak eriştik
        },
        child: Icon(Icons.add),
      ),
    );
  }
}

class _SayacWidgetState extends StatefulWidget {
  const _SayacWidgetState({super.key});

  @override
  State<_SayacWidgetState> createState() => __SayacWidgetStateState();
}

class __SayacWidgetStateState extends State<_SayacWidgetState> {
  int _sayac = 0;
  void arttir() {
    setState(() {
      //bütün yapıyı set etmektense global key sayesinde küçük bir fonksiyonu set ediyoruz (işlevsel ve performanslı)
      _sayac++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Text(
      _sayac.toString(),
      style: Theme.of(context).textTheme.headlineLarge,
    );
  }
}
