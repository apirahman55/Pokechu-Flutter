

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:list/features/pokemon/data/store/pokemon_bloc.dart';
import 'package:list/features/pokemon/presentation/widget/pokemon_list.dart';

class PokemonScreen extends StatefulWidget {
  const PokemonScreen({ super.key, required this.title });
  final String title;

  @override
  State<PokemonScreen> createState() => _PokemonScreen();
}

class _PokemonScreen extends State<PokemonScreen> {

  @override
  Widget build(BuildContext context) {
    MediaQueryData mediaQuery = MediaQuery.of(context);

    return Scaffold(
      body: BlocProvider(
        create: (_) => PokemonBloc()..add(PokemonFetch()),
        child: Padding(
          padding: EdgeInsets.only(top: mediaQuery.viewPadding.top),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Container(
                  padding: const EdgeInsets.only(left: 14, right: 14, top: 24, bottom: 24),
                  child: const Text("Pokechu", 
                    style: TextStyle(
                      color: Colors.black87,
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                    )
                  ),
                ),

                Expanded(
                  child: BlocBuilder<PokemonBloc, PokemonState>(
                    builder: (context, state) {
                      if(state.isLoading) {
                        return const Center(
                          child: CircularProgressIndicator(),
                        );
                      }

                      if(state.list.isEmpty) {
                        return const Center(
                          child: Text("Data is unavailable")
                        );
                      }

                      return GridView.count(
                        padding: const EdgeInsets.all(14),
                        mainAxisSpacing: 8,
                        crossAxisSpacing: 8,
                        crossAxisCount: 2,
                        scrollDirection: Axis.vertical,
                        childAspectRatio: (mediaQuery.size.height * .00105),
                        children: state.list.map((data) {
                          return PokemonListComponent(
                            image: data.imageUrl,
                            name: data.name
                          );
                        }).toList()
                      );
                    }
                  )
                )
              ],
          ) 
        )
      )    
    );
  }
}