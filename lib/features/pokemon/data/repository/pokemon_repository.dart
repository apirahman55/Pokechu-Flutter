import 'dart:convert';
import 'package:list/features/pokemon/domain/pokemon_model.dart';
import 'package:http/http.dart' as http;

part 'pokemon_repository_impl.dart';

abstract class PokemonRepository {
  Future<PokemonList> getPokemonList();
  Future<PokemonDetail> getPokemonById(String id);
}