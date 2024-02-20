import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:proje_3/model/pokemon_model.dart';

class PokeApi {
  static const url =
      "https://raw.githubusercontent.com/Biuni/PokemonGO-Pokedex/master/pokedex.json";

  static Future<List<PokemonModel>> getPokemonData() async {
    // ignore: no_leading_underscores_for_local_identifiers
    List<PokemonModel> _list = [];
    try {
      var veriAl = await Dio().get(url);
      // ignore: no_leading_underscores_for_local_identifiers
      var _pokeList = jsonDecode(veriAl.data)["pokemon"];

      if (veriAl.statusCode == 200) {
        _list =
            (_pokeList as List).map((e) => PokemonModel.fromJson(e)).toList();
      }
      return _list;
    } on DioException catch (e) {
      return Future.error(e.message.toString());
    }
  }
}
