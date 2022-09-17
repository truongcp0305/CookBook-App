
import 'package:flutter/material.dart';

class NavBar extends StatelessWidget {
  const NavBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 65,
      padding: const EdgeInsets.symmetric(horizontal: 20),
      decoration: const BoxDecoration(
        color: Color(0xFFF6F3F3),
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(25),
          topRight: Radius.circular(25),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          InkWell(
            onTap: (){
              Navigator.popUntil(context, (route) => false);
              Navigator.pushNamed(context, "/");
            },
            child: const Icon(
                Icons.home,
                size: 35,
                color: Colors.black,
            ),

          ),
          InkWell(
            onTap: (){
              Navigator.pushNamed(context, "categoryPage");
            },
            child: const Icon(
              Icons.list,
              size: 35,
              color: Colors.black,
            ),

          ),
          InkWell(
            onTap: (){
              Navigator.pushNamed(context, 'shoppingList');
            },
            child: const Icon(
              Icons.shopping_cart,
              size: 35,
              color: Colors.black,
            ),

          ),
          InkWell(
            onTap: (){
              Navigator.pushNamed(context, 'favoriteList');
            },
            child: const Icon(
              Icons.favorite,
              size: 35,
              color: Colors.black,
            ),

          ),
        ],
      ),
    );
  }
}
