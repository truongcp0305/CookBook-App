import 'package:flutter/material.dart';

class RecipesIcon3 extends StatelessWidget {
  const RecipesIcon3({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          padding: const EdgeInsets.all(5),
          decoration: BoxDecoration(
            color: const Color(0xFFE5D84D),
            borderRadius: BorderRadius.circular(50),
          ),
          child:  const Icon(
            Icons.fastfood,
            color: Colors.white,
            size: 30,
          ),
        ),
        const SizedBox(
          width: 50,
          child: Center(
            child: Text(
              "fast",
              style: TextStyle(
                color: Colors.black,
                fontSize: 12,
                fontStyle: FontStyle.italic,
              ),
            ),
          ),
        ),
        const SizedBox(
            width: 50,
            child: Center(
              child:  Text(
                "breakfast",
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 12,
                  fontStyle: FontStyle.italic,
                ),
              ),
            )
        ),
      ],
    );
  }
}
