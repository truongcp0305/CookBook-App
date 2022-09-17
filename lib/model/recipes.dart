import 'package:cooking_book/widget/recipes/recipes_widget.dart';
import 'package:flutter/material.dart';

class Recipes {
  late int id;
  late String nameRecipes;
  late String ingredians;
  late String directions;
  late String iconsInfor;
  late String category;


  Recipes({
    required this.id,
    required this.nameRecipes,
    required this.ingredians,
    required this.directions,
    required this.iconsInfor,
    required this.category,
});

  List<String> ing(){
    List<String> c = [];
    c = ingredians.split(';');
    return c;
  }



  List<String> IconsData(){
    List<String> c = [];
    c = iconsInfor.split(';');
    return c;
  }

  Map<String, dynamic> toMap(){
    return{
      'id' : id,
      'name': nameRecipes,
      'ingredians': ingredians,
      'directions': directions,
      'iconsInfor': iconsInfor,
      'category': category
    };
  }




}