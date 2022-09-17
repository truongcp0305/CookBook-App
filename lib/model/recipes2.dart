import 'package:cooking_book/widget/recipes/recipes_widget.dart';
import 'package:flutter/material.dart';

class Recipes2 {
  late int id;
  late String nameRecipes;
  late List<String> ingredians;
  late String directions;
  late List<String> iconsInfor;
  late String category;
  late int l;


  Recipes2({
    required this.id,
    required this.nameRecipes,
    required this.ingredians,
    required this.directions,
    required this.iconsInfor,
    required this.category,
    required this.l,
  });



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