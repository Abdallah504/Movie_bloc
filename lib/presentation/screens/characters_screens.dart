import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_bloc/business_logic/cubit/characters_cubit.dart';
import 'package:movie_bloc/constants/colors.dart';
import 'package:movie_bloc/presentation/widgets/characters_items.dart';

class CharactersScreen extends StatefulWidget {
  CharactersScreen({Key? key}) : super(key: key);

  @override
  State<CharactersScreen> createState() => _CharactersScreenState();
}

class _CharactersScreenState extends State<CharactersScreen> {
  late List<dynamic> allCharacters;
  @override
  void initState() {
    super.initState();
    allCharacters = BlocProvider.of<CharactersCubit>(context).getAllCharacters();
  }
  Widget buildBlocWidget(){
    return BlocBuilder<CharactersCubit,CharactersState>(builder: (context,state){
      if(state is CharactersLoaded){
        allCharacters = (state).characters;
        return buildLoadedWidget();
      }else{
        return Center(
          child: CircularProgressIndicator(
            color: MyColors.myYellow,
          ),
        );
      }
    });
  }
  Widget buildLoadedWidget(){
    return SingleChildScrollView(
      child: Container(
        color: MyColors.myGrey,
        child: Column(
          children: [
            buildCharactersList()
          ],
        ),
      ),
    );
  }
  Widget buildCharactersList(){
    return GridView.builder(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 2/3,
        crossAxisSpacing: 1,
        mainAxisSpacing: 1
        ),
       itemBuilder: (context,index){
        return CharactersItems();
       });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: MyColors.myYellow,
        title: Text('Characters',style: TextStyle(color: MyColors.myGrey),),
      ),
      body: buildBlocWidget(),
    );
  }
}