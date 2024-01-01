import 'package:flutter/material.dart';

class TemelButonlar extends StatelessWidget {
  const TemelButonlar({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TextButton(onPressed: () {}, child: Text("textButton")),
        TextButton.icon(
            onPressed: () {},
            onLongPress: () {
              debugPrint("uzun basıldı");
            },
            style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(Colors.red)),
            icon: Icon(Icons.ac_unit_sharp),
            label: Text("text icon button")),
        ElevatedButton(
          onPressed: () {},
          child: Text("elevated button"),
          style: ElevatedButton.styleFrom(
            primary: Colors.red,
            onPrimary: Colors.yellow,
          ),
        ),
        ElevatedButton.icon(
            onPressed: () {},
            icon: Icon(Icons.add),
            label: Text("elevated icon")),
        OutlinedButton(onPressed: () {}, child: Text("outlined button")),
        OutlinedButton.icon(
          onPressed: () {},
          icon: Icon(Icons.access_time_filled_rounded),
          label: Text("outlined icon"),
          style: OutlinedButton.styleFrom(
              shape: StadiumBorder(),
              side: BorderSide(color: Colors.purple, width: 5)),
        ),
        OutlinedButton.icon(
            onPressed: () {},
            icon: Icon(Icons.access_time_filled_rounded),
            label: Text("outlined icon"),
            style: OutlinedButton.styleFrom(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(10))),
            )),
      ],
    );
  }
}
