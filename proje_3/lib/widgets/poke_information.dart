// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:proje_3/constants/constant.dart';
import 'package:proje_3/constants/ui_helper.dart';

import 'package:proje_3/model/pokemon_model.dart';

class PokeInformation extends StatelessWidget {
  final PokemonModel pokemon;
  const PokeInformation({
    Key? key,
    required this.pokemon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(10.w)),
        color: Colors.white,
      ),
      child: Padding(
        padding: UIHelper.getDefaultPadding(),
        child: SingleChildScrollView(
          child: Column(
            children: [
              _buildInformationRow("Name", pokemon.name),
              _buildInformationRow("Height", pokemon.height),
              _buildInformationRow("Weight", pokemon.weight),
              _buildInformationRow("Spawn Time", pokemon.spawnTime),
              _buildInformationRow(
                  "Weakness", pokemon.weaknesses?.join(" , ") ?? "Not Avaible"),
              _buildInformationRow("Pre Evolution",
                  pokemon.prevEvolution?.join(" , ") ?? "Not Avaible"),
              _buildInformationRow("Next Evolution",
                  pokemon.nextEvolution?.join(" , ") ?? "Not Avaible")
            ],
          ),
        ),
      ),
    );
  }

  Padding _buildInformationRow(String baslik, var bilgi) {
    return Padding(
      padding: EdgeInsets.only(bottom: 10.w),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            baslik,
            style: Constants.getPokemonInformationTitleTextStyle(),
          ),
          Text(
            bilgi.toString(),
            style: Constants.getPokemonInformationTextStyle(),
          ),
        ],
      ),
    );
  }
}
