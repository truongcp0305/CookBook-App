import 'package:cooking_book/database/recipes_db.dart';
import 'package:cooking_book/widget/icon/button_add.dart';
import 'package:cooking_book/widget/icon/recipesIcon3.dart';
import 'package:cooking_book/widget/icon/recipesIcon_widget.dart';
import 'package:flutter/material.dart';

import '../../model/recipes.dart';
import '../../model/recipes2.dart';
import '../icon/recipesIcon2.dart';

class RecipesButtons extends StatelessWidget {
  final int id;
  const RecipesButtons({required this.id,Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var db = DatabaseConect();
    return FutureBuilder(
      future: db.getRecipeByID2(id),
      initialData: const [],
      builder: (BuildContext context, AsyncSnapshot snapshot){
        return snapshot.data == null?
            const Center(
              child: Text(
                'no data'
              )
            ):
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: const [
                Padding(
                  padding: EdgeInsets.only(left: 20),
                  child: RecipesIcon(calories: '1000',),
                ),
                Padding(
                  padding: EdgeInsets.only(left: 20),
                  child: RecipesIcon2(time: '45phut',),
                ),
                Padding(
                  padding: EdgeInsets.only(left: 20),
                  child: RecipesIcon3(),
                ),
              ],
            ),
            ButtonAdd(data: snapshot.data),
          ],
        );

      },
    );

  }

  Future<List<String>> getData()async{
    var db = DatabaseConect();
    Recipes2 recipes = await db.getRecipeByID(id);
    List<String> output = [];
    output = recipes.iconsInfor;
    return output;
  }

  Future<Recipes> getRecipes()async{
    var db = DatabaseConect();
    Recipes recipes = await db.getRecipeByID2(id);
    return recipes;
  }
}
