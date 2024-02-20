// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:proje_3/constants/ui_helper.dart';

import 'package:proje_3/model/pokemon_model.dart';

class PokeImageAndBall extends StatelessWidget {
  final PokemonModel pokemon;

  const PokeImageAndBall({
    Key? key,
    required this.pokemon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Align(
          alignment: Alignment.bottomRight,
          child: Image.asset(
            "assets/images/pokeball.png",
            width: UIHelper.calculatePokeImageAndBallSize(),
            height: UIHelper.calculatePokeImageAndBallSize(),
            fit: BoxFit.fitHeight,
          ),
        ),
        Align(
          alignment: Alignment.bottomRight,
          child: Hero(
            tag: pokemon.id!,
            child: CachedNetworkImage(
                imageUrl: pokemon.img.toString(),
                width: UIHelper.calculatePokeImageAndBallSize(),
                height: UIHelper.calculatePokeImageAndBallSize(),
                fit: BoxFit.fitHeight,
                placeholder: (context, url) => const CircularProgressIndicator(
                      color: Colors.white,
                    )),
          ),
        )
      ],
    );
  }
}
