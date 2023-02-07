
class PokemonResult {
  const PokemonResult({
    required this.name,
    required this.id,
  });

  final String name;
  final String id;

  String get imageUrl => "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/shiny/$id.png";

  factory PokemonResult.fromJson(Map<String, dynamic> json) {
    String id = "";

    // remove "slash" from last value
    var url = json['url'] as String;
    url = url.substring(0, url.length-1);
    
    // find id with regexp
    var findIdMatches = RegExp(r'\d+$').allMatches(url);
    for (var element in findIdMatches) {
      id = element.group(0) as String;
    }

    return PokemonResult(name: json['name'], id: id);
  }
}

class PokemonList {
  const PokemonList({
    required this.count,
    required this.next,
    this.previous,
    required this.result,
  });
  
  final int count;
  final String next;
  final String? previous;
  final List<PokemonResult> result;

  factory PokemonList.fromJson(Map<String, dynamic> json) {
    return PokemonList(
      count: json['count'] as int,
      next: json['next'],
      previous: json['previous'],
      result: (json['results'] as List)
        .map((pokemon) => PokemonResult.fromJson(pokemon))
        .toList(),
    );
  }
}

class PokemonDetail {
  const PokemonDetail({
    required this.baseHappiness, 
    required this.captureRate, 
    required this.genderRate, 
    required this.generation, 
    required this.growthRate, 
    required this.habitat, 
    required this.hasGenderDifferences, 
    required this.batchCounter, 
    required this.id, 
    required this.isBaby, 
    required this.isLegendary, 
    required this.isMythical, 
    required this.name
  });

  final int baseHappiness;
  final int captureRate;
  final int genderRate;
  final String generation;
  final String growthRate;
  final String habitat;
  final bool hasGenderDifferences;
  final int batchCounter;
  final int id;
  final bool isBaby;
  final bool isLegendary;
  final bool isMythical;
  final String name;

  factory PokemonDetail.fromJson(Map<String, dynamic> json) {
    return PokemonDetail(
      baseHappiness:  json['base_happiness'],
      captureRate:  json['capture_rate'],
      genderRate:  json['gender_rate'],
      generation:  json['generation']['name'],
      growthRate:  json['growth_rate']['name'],
      habitat:  json['habitat'],
      hasGenderDifferences:  json['has_gender_differences'],
      batchCounter:  json['batch_counter'],
      id:  json['id'],
      isBaby:  json['is_baby'],
      isLegendary:  json['is_legendary'],
      isMythical:  json['is_mythical'],
      name:  json['name']
    );
  }
}