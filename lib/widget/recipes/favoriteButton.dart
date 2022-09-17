import 'package:cooking_book/database/recipes_db.dart';
import 'package:flutter/material.dart';

import '../../model/recipes.dart';

class Favorite extends StatefulWidget {
  final Recipes recipes;
  const Favorite({required this.recipes,Key? key}) : super(key: key);

  @override
  State<Favorite> createState() => _FavoriteState(recipes);
}

class _FavoriteState extends State<Favorite> {
  var db = DatabaseConect();
  var recipes;
  _FavoriteState( this.recipes);
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: db.getFavoriteByID(recipes.id),
      initialData: const [],
      builder: (BuildContext context, AsyncSnapshot snapshot){
        Widget screen = const Center(
          child: CircularProgressIndicator(),
        );
        if(!snapshot.hasData){
          screen = IconButton(
              onPressed: (){
                setState(() {
                  db.insertFavoriteList(recipes);
                });
              },
              icon: const Icon(
                Icons.favorite,
                color: Colors.amberAccent,
                size: 40,
              ),
          );
        }
        if(snapshot.hasData){
          screen = IconButton(
            onPressed: (){
              setState(() {
                db.deleteRecipes2(recipes);
              });
            },
            icon: const Icon(
              Icons.favorite,
              color: Colors.redAccent,
              size: 40,
            ),
          );
        }
        return screen;
      },
    );
  }
}
