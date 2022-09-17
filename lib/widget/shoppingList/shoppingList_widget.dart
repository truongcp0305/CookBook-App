import 'package:cooking_book/widget/navbar_widget.dart';
import 'package:cooking_book/widget/shoppingList/shoppingLV_widget.dart';
import 'package:flutter/material.dart';

class ShoppingList extends StatelessWidget {
  const ShoppingList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 15),
            child: Row(
              children: [
                InkWell(
                  onTap: (){
                    Navigator.pop(context);
                  },
                  child: const Icon(
                    Icons.arrow_back,
                    color: Colors.black,
                    size: 30,
                  ),
                ),
                const SizedBox(width: 20,),
                const Text(
                  'Shopping List',
                  style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.w400,
                    fontSize: 25,
                  ),
                ),
              ],
            ),
          ),
          const Expanded(
            child: ShoppingLV(),
          ),
        ],
      ),
      bottomNavigationBar: const NavBar(),
    );
  }
}
