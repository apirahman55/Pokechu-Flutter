part of 'pokemon_bloc.dart';

abstract class PokemonEvent extends Equatable {
  @override
  List<Object> get props => [];
}

class PokemonFetch extends PokemonEvent {}
class PokemonDetailFetch extends PokemonEvent {}
