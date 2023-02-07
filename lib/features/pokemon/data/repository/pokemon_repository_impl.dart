part of 'pokemon_repository.dart';

class PokemonRoutes {
  Uri getList() => 
    Uri.parse("https://pokeapi.co/api/v2/pokemon-species");
  
  Uri getDetail(String id) => 
    Uri.parse("https://pokeapi.co/api/v2/pokemon-species/$id");
  
  Uri getAsset(String id) => 
    Uri.parse("https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/dreamworld/$id.svg");
}

class PokemonRepositoryImpl implements PokemonRepository {
  final PokemonRoutes pokeRoute = PokemonRoutes();

  @override
  Future<PokemonList> getPokemonList() async {
    final response = await http.get(pokeRoute.getList());
    
    return PokemonList.fromJson(jsonDecode(response.body));
  }

  @override
  Future<PokemonDetail> getPokemonById(String id) async {
    final response = await http.get(pokeRoute.getDetail(id));
    
    return PokemonDetail.fromJson(jsonDecode(response.body));
  }
}