import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_bloc/business_logic/cubit/characters_cubit.dart';
import 'package:movie_bloc/constants/strings.dart';
import 'package:movie_bloc/data/repositry/character_repo.dart';
import 'package:movie_bloc/data/web_services/characters_web%20services.dart';
import 'package:movie_bloc/presentation/screens/character_details_screen.dart';
import 'package:movie_bloc/presentation/screens/characters_screens.dart';

class Routing{
late CharacterRepository characterRepository;
late CharactersCubit charactersCubit;

Routing(){
  characterRepository = CharacterRepository(CharactersWebServices());
  charactersCubit = CharactersCubit(characterRepository);
}


  Route? generateRoute(RouteSettings setting){
    switch(setting.name){
      case characterScreen: 
      return MaterialPageRoute(
        builder: (_)=> 
        BlocProvider(create: (BuildContext context)=> CharactersCubit(characterRepository),
        child: CharactersScreen(),
        )
        );
      
      case characterDetailsScreen: 
      return MaterialPageRoute(builder: (_)=> CharacterDetailsScreen());
      
     
    }

  }
}