import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:proje_3/model/pokemon_model.dart';
import 'package:proje_3/services/pokedex_api.dart';
import 'package:proje_3/widgets/pokelist_item.dart';

class PokemonList extends StatefulWidget {
  const PokemonList({super.key});

  @override
  State<PokemonList> createState() => _PokemonListState();
}

class _PokemonListState extends State<PokemonList> {
  late Future<List<PokemonModel>> _pokeList;

  @override
  void initState() {
    super.initState();
    _pokeList = PokeApi.getPokemonData();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<PokemonModel>>(
      future: _pokeList,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          List<PokemonModel> pokeList = snapshot.data!;
          return GridView.builder(
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount:
                    ScreenUtil().orientation == Orientation.portrait ? 2 : 3),
            itemCount: pokeList.length,
            itemBuilder: (context, index) {
              var oAnkiPokemon = pokeList[index];
              return PokeListItem(
                  pokemon: oAnkiPokemon); //buradaki bütün verileri erişmek için
            },
          );
        } else if (snapshot.hasError) {
          return Text(snapshot.error.toString());
        } else {
          return const CircularProgressIndicator();
        }
      },
    );
  }
}
