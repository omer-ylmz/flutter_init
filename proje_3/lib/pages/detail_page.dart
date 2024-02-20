// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:proje_3/constants/ui_helper.dart';

import 'package:proje_3/model/pokemon_model.dart';
import 'package:proje_3/widgets/poke_information.dart';
import 'package:proje_3/widgets/poke_type_name.dart';

class DetailPage extends StatefulWidget {
  final PokemonModel pokemon;
  const DetailPage({
    Key? key,
    required this.pokemon,
  }) : super(key: key);

  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  @override
  Widget build(BuildContext context) {
    return ScreenUtil().orientation == Orientation.portrait
        ? _buildPortraitBudy(context)
        : _buildLandspaceBudy(context);
  }

  Scaffold _buildLandspaceBudy(BuildContext context) {
    debugPrint("landspaceçalıştı.");
    return Scaffold(
      backgroundColor:
          UIHelper.getColorFromType(widget.pokemon.type![0].toString()),
      body: Column(
        children: [
          Align(
            alignment: Alignment.centerLeft,
            child: Padding(
              padding: UIHelper.getDefaultPadding(),
              child: IconButton(
                  iconSize: UIHelper.getIconSize(),
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  icon: const Icon(
                    Icons.arrow_back_ios,
                    color: Colors.white,
                  )),
            ),
          ),
          Expanded(
              child: Row(
            children: [
              Expanded(
                flex: 2,
                child: Column(
                  children: [
                    PokeTypeName(pokemon: widget.pokemon),
                    Hero(
                      tag: widget.pokemon.id!,
                      child: CachedNetworkImage(
                        imageUrl: widget.pokemon.img.toString(),
                        height: 0.25.sw,
                        fit: BoxFit.fitHeight,
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                  flex: 3, child: PokeInformation(pokemon: widget.pokemon)),
            ],
          ))
        ],
      ),
    );
  }

  Scaffold _buildPortraitBudy(BuildContext context) {
    return Scaffold(
      backgroundColor:
          UIHelper.getColorFromType(widget.pokemon.type![0].toString()),
      body: SafeArea(
          //uygulama üstteki bildirimlerin de altında çalışır
          child: Column(
        children: [
          Align(
            alignment: Alignment.centerLeft,
            child: Padding(
              padding: UIHelper.getDefaultPadding(),
              child: IconButton(
                  iconSize: UIHelper.getIconSize(),
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  icon: const Icon(
                    Icons.arrow_back_ios,
                    color: Colors.white,
                  )),
            ),
          ),
          PokeTypeName(pokemon: widget.pokemon),
          SizedBox(
            height: 20.h,
          ),
          Expanded(
            child: Stack(
              children: [
                Positioned(
                  top: 0,
                  right: 0,
                  child: Image.asset(
                    "assets/images/pokeball.png",
                    height: 0.15.sh,
                    fit: BoxFit.fitHeight,
                  ),
                ),
                Positioned(
                    bottom: 0,
                    left: 0,
                    right: 0,
                    top: 0.12.sh,
                    child: PokeInformation(pokemon: widget.pokemon)),
                Align(
                  alignment: Alignment.topCenter,
                  child: Hero(
                    tag: widget.pokemon.id!,
                    child: CachedNetworkImage(
                      imageUrl: widget.pokemon.img.toString(),
                      height: 0.25.sh,
                      fit: BoxFit.fitHeight,
                    ),
                  ),
                )
              ],
            ),
          ),
        ],
      )),
    );
  }
}
