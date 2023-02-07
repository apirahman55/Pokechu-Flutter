import 'package:flutter/material.dart';

class PokemonListComponent extends StatelessWidget {
  
  final String? image;
  final String? name;

  const PokemonListComponent({
    super.key, 
    this.image,
    this.name
  });
  
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        border: Border.all(color: const Color.fromARGB(45, 0, 0, 0), width: 1),
        borderRadius: const BorderRadius.all(Radius.circular(8)),
      ),
      child: Column(
        children: [
          Image.network(image ?? "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/shiny/1.png"),
          const SizedBox(height: 12),
          Text(name ?? "-", 
            style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w500,
              color: Colors.black,
            )
          )
        ],
      ),
    );
  }
}