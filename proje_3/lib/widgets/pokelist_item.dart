// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:proje_3/constants/constant.dart';
import 'package:proje_3/constants/ui_helper.dart';
import 'package:proje_3/model/pokemon_model.dart';
import 'package:proje_3/pages/detail_page.dart';
import 'package:proje_3/widgets/poke_img_and_ball.dart';

class PokeListItem extends StatelessWidget {
  final PokemonModel pokemon;
  const PokeListItem({
    Key? key,
    required this.pokemon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.of(context).push(MaterialPageRoute(
          builder: (context) => DetailPage(pokemon: pokemon),
        ));
      },
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15.w),
        ),
        elevation: 3,
        shadowColor: Colors.white,
        color: UIHelper.getColorFromType(pokemon.type![0].toString()),
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.only(left: 8.w),
              child: Align(
                alignment: FractionalOffset.topLeft,
                child: Text(
                  pokemon.name.toString(),
                  style: Constants.getPokemonTextStyle(),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: 8.w),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Chip(
                    label: Text(
                  pokemon.type![0],
                  style: Constants.getTypeChipTextStyle(),
                )),
              ),
            ),
            Expanded(
                child: Padding(
              padding: EdgeInsets.only(bottom: 8.h, right: 8.w),
              child: PokeImageAndBall(pokemon: pokemon),
            ))
          ],
        ),
      ),
    );
  }
}
