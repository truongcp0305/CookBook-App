import 'package:flutter/material.dart';

class RecipesIcon extends StatelessWidget {
  final String calories;
  const RecipesIcon({required this.calories,Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          padding: const EdgeInsets.all(5),
          decoration: BoxDecoration(
            color: const Color(0xFFCE3C51),
            borderRadius: BorderRadius.circular(50),
          ),
          child:  const Icon(
            Icons.local_fire_department_rounded,
            color: Colors.white,
            size: 30,
          ),
        ),
        SizedBox(
          width: 50,
          height: 12,
          child: Center(
            child: Text(
               calories,
              style: const TextStyle(
                color: Colors.black,
                fontSize: 12,
                fontStyle: FontStyle.italic,
              ),
            ),
          ),
        ),
        const SizedBox(
            width: 50,
            height: 12,
            child: Center(
              child:  Text(
                "calories",
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
