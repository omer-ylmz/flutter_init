import 'package:flutter/material.dart';
import 'package:proje_1/data/strings.dart';

class detaySayfasi extends StatelessWidget {
  final int gelenParametre;
  const detaySayfasi({required this.gelenParametre, super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            expandedHeight: 200,
            flexibleSpace: FlexibleSpaceBar(
              centerTitle: true,
              title: Text(
                "${Strings.BURC_ADLARI[gelenParametre]} Burcu ve Özellikleri",
                style: TextStyle(
                  fontSize: 20,
                ),
              ),
              background: Image.asset(
                  "images/" +
                      "${Strings.BURC_ADLARI[gelenParametre].toLowerCase()}" +
                      "_buyuk" +
                      "${gelenParametre + 1}" +
                      ".png",
                  fit: BoxFit.cover),
            ),
          ),
          SliverPadding(
            padding: EdgeInsets.all(20),
            sliver: SliverList(
              delegate: SliverChildListDelegate(
                [
                  Container(
                    child: Text(Strings.BURC_GENEL_OZELLIKLERI[gelenParametre]),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
