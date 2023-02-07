part of 'pokemon_bloc.dart';

class PokemonState extends Equatable {
  const PokemonState({
    this.total = 0,
    this.page = 0,
    this.list = const <PokemonResult>[],
    this.detail,
    this.isLoading = false
  });

  final int total;
  final int page;
  final List<PokemonResult> list;
  final PokemonDetail? detail;
  final bool isLoading;
  
  PokemonState copyWith({
    int? total,
    int? page,
    List<PokemonResult>? list,
    PokemonDetail? detail,
    bool? isLoading
  }) {
    return PokemonState(
      total: total ?? this.total,
      page: page ?? this.page,
      list: list ?? this.list,
      detail: detail ?? this.detail,
      isLoading: isLoading ?? this.isLoading
    );
  }
  
  @override
  List<Object?> get props => [total, page, list, detail, isLoading];

  @override
  String toString() {
    return '''PostState { total: $total, page: $page, list: ${list.length}, detail: ${detail?.id}, isLoading: $isLoading }''';
  }
}