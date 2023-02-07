import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:list/features/pokemon/data/repository/pokemon_repository.dart';
import 'package:list/features/pokemon/data/store/pokemon_bloc.dart';

class PokemonService {
  PokemonService({
    required this.state
  });

  final PokemonState state;
  final PokemonRepository _repo = PokemonRepositoryImpl();

  Future<void> onFetchPokemon(
    PokemonFetch event,
    Emitter<PokemonState> emit
  ) async {
    emit(state.copyWith(isLoading: true));
    
    final fetchPokemon = await _repo.getPokemonList();
    emit(state.copyWith(
      isLoading: false,
      list: fetchPokemon.result,
      total: fetchPokemon.count,
      page: 1,
    ));
  }
}