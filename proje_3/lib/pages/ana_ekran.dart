import 'package:flutter/material.dart';

import 'package:proje_3/widgets/app_title.dart';
import 'package:proje_3/widgets/pokemon_list.dart';

class AnaEkran extends StatelessWidget {
  const AnaEkran({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: OrientationBuilder(
      //oritation kuralları etkin olsun diye
      builder: (context, orientation) => const Column(
        children: [
          AppTitle(),
          Expanded(child: PokemonList()),
        ],
      ),
    ));
  }
}
