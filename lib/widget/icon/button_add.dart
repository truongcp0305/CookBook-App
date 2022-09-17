import 'package:cooking_book/database/recipes_db.dart';
import 'package:flutter/material.dart';

class ButtonAdd extends StatelessWidget {
   var data;
   ButtonAdd({required this.data,Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var db = DatabaseConect();
    return Padding(
        padding: EdgeInsets.only(right: 15),
      child:InkWell(
        onTap: (){
          SnackBar mySnackbar = SnackBar(content: Text('Added to shopping list!'));
          db.insertShoppingList(data);
          Scaffold.of(context).showSnackBar(mySnackbar);
        },
        child:  Container(
          padding: EdgeInsets.all(8),
          decoration: BoxDecoration(
            color: Color(0xFF2662E3),
            borderRadius: BorderRadius.circular(5),
          ),
          child:  Icon(
            Icons.shopping_cart,
            color: Colors.white,
            size: 30,
          ),
        ),
      )
    );
  }
}
