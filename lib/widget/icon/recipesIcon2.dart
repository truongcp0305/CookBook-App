import 'package:flutter/material.dart';


class RecipesIcon2 extends StatelessWidget {
  final String time;
  const RecipesIcon2({required this.time,Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          padding: const EdgeInsets.all(5),
          decoration: BoxDecoration(
            color: const Color(0xFF47B43F),
            borderRadius: BorderRadius.circular(50),
          ),
          child:  const Icon(
            Icons.apple,
            color: Colors.white,
            size: 30,
          ),
        ),
        SizedBox(
          width: 50,
          height: 12,
          child: Center(
            child: Text(
              time,
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
                "Nấu",
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
