import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:list/features/pokemon/application/pokemon_service.dart';
import 'package:list/features/pokemon/domain/pokemon_model.dart';
import 'package:stream_transform/stream_transform.dart';
import 'package:bloc_concurrency/bloc_concurrency.dart';

part 'pokemon_event.dart';
part 'pokemon_state.dart';

const throttleDuration = Duration(milliseconds: 100);

EventTransformer<E> throttleDroppable<E>(Duration duration) {
  return (events, mapper) {
    return droppable<E>().call(events.throttle(duration), mapper);
  };
}

class PokemonBloc extends Bloc<PokemonEvent, PokemonState> {
  PokemonBloc() : super(const PokemonState()) {
    PokemonService service = PokemonService(state: state);

    on<PokemonFetch>(
      service.onFetchPokemon,
      transformer: throttleDroppable(throttleDuration),
    );
  }
}