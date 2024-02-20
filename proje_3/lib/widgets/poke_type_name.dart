// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:proje_3/constants/constant.dart';
import 'package:proje_3/model/pokemon_model.dart';

class PokeTypeName extends StatelessWidget {
  final PokemonModel pokemon;
  const PokeTypeName({
    Key? key,
    required this.pokemon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 0.05.sh),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Expanded(
                child: Text(
                  pokemon.name!,
                  style: Constants.getPokemonTextStyle(),
                ),
              ),
              Text(
                "#${pokemon.num}",
                style: Constants.getPokemonTextStyle(),
              )
            ],
          ),
          SizedBox(
            height: 15.h,
          ),
          Chip(
            label:
                //liste elemanlarını gezip yan yan koyar, araya virgül atar
                Text(
              pokemon.type!.join(" , "),
              style: Constants.getTypeChipTextStyle(),
            ),
          )
        ],
      ),
    );
  }
}
