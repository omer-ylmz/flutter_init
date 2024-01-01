import 'package:flutter/material.dart';

class CardveListtileKullanimi extends StatelessWidget {
  const CardveListtileKullanimi({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Card ve List Tile Kullanımı"),
      ),
      body: Center(
        child: ListView(
          reverse: true,
          children: [
            Column(
              children: [
                tekListeElemani(),
                tekListeElemani(),
                tekListeElemani(),
                tekListeElemani(),
                tekListeElemani(),
                tekListeElemani(),
                tekListeElemani(),
                tekListeElemani(),
                tekListeElemani()
              ],
            ),
            Text("merhaba"),
            ElevatedButton(onPressed: () {}, child: Text("Button"))
          ],
        ),
      ),
    );
  }

  SingleChildScrollView singleChildKullanimi() {
    return SingleChildScrollView(
      child: Column(
        children: [
          tekListeElemani(),
          tekListeElemani(),
          tekListeElemani(),
          tekListeElemani(),
          tekListeElemani(),
          tekListeElemani(),
          tekListeElemani(),
          tekListeElemani(),
          tekListeElemani()
        ],
      ),
    );
  }

  Column tekListeElemani() {
    return Column(
      children: [
        Card(
            color: Colors.blue.shade100,
            shadowColor: Colors.red,
            elevation: 10,
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
            child: ListTile(
              leading: CircleAvatar(
                child: Icon(Icons.add),
                backgroundColor: Colors.deepPurple,
              ),
              title: Text("Omer"),
              subtitle: Text("Yılmaz"),
              trailing: Icon(Icons.real_estate_agent_rounded),
            )),
        Divider(
          color: Colors.red,
          thickness: 1,
          indent: 20,
          endIndent: 20,
          height: 30,
        )
      ],
    );
  }
}
