import 'package:flutter/material.dart';

class AramaSayfasi extends StatelessWidget {
  const AramaSayfasi(Key k) : super(key: k);  //keyleri sınıfa tanıtmak için constracter gerekmekte

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemExtent: 200,
      itemBuilder: (context, index) {
        return Container(
          padding: const EdgeInsets.all(5),
          margin: const EdgeInsets.all(5),
          child: Material(
            elevation: 4,
            borderRadius: const BorderRadius.all(Radius.circular(10)),
            color: index % 2 == 0
                ? Colors.orangeAccent.shade200
                : Colors.indigo.shade200,
            child: Center(
              child: Text(index.toString()),
            ),
          ),
        );
      },
    );
  }
}
