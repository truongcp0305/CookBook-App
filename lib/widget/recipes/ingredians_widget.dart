import 'package:cooking_book/database/recipes_db.dart';
import 'package:flutter/material.dart';
import '../../model/recipes2.dart';

class Ingredians extends StatelessWidget {
  final int id;
  const Ingredians({required this.id,Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {


    return Container(
      height: 250,
      width: double.infinity,
      decoration: const BoxDecoration(
        color: Colors.white,
      ),
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: FutureBuilder (
          future: getData(),
          initialData: const [],
          builder: (BuildContext context, AsyncSnapshot snapshot) {
            var data = snapshot.data;
            Widget screen = const Center();
            if(snapshot.hasData) {
              screen = Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  for(int i = 0; i < data.length; i++)
                    SizedBox(
                      height: 25,
                      child: Row(
                        children: [
                          const Icon(
                            Icons.task_alt,
                            color: Colors.blue,
                            size: 20,
                          ),
                          const SizedBox(width: 10,),
                          Text(
                            data[i],
                            style: const TextStyle(
                              color: Colors.black,
                              fontSize: 15,
                            ),
                          ),
                        ],
                      ),
                    )
                ],
              );
            }

             return screen;

          }
        ),
      ),
    );
  }

  int getLength(Recipes2 recipes){
    int length = 0;
    length = recipes.l;
    return length;
  }
  List<String> getIngerdians(Recipes2 recipes){
    List<String> output = [];
    output = recipes.ingredians;
    return output;
  }

  Future<List<String>> getData() async{
    var db = DatabaseConect();
    List<String> output = [];
    var recipes = await db.getRecipeByID(id);
    output = recipes.ingredians;
    return output;
  }

}
