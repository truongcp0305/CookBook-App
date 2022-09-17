import 'package:cooking_book/database/recipes_db.dart';
import 'package:flutter/material.dart';
import '../recipes/recipes_widget.dart';


class AllRecipes extends StatelessWidget {
  const AllRecipes({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var db = DatabaseConect();

    return Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Row(
              children: const [
                Text(
                  "All Recipes",
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 25,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 15,),
          SingleChildScrollView(
            child: FutureBuilder(
                future: db.getRecipes(),
                initialData: const [],
                builder: (BuildContext context, AsyncSnapshot<List> snapshot){
                  var data = snapshot.data;



                  return data!.isEmpty
                      ?const Center(
                    child: Text("no data"),
                  )
                      :Column(
                    children: [
                      for(int i =0; i<8; i++)
                        InkWell(
                          onTap: () {
                            Navigator.push(context, MaterialPageRoute(
                                builder: (context) => RecipesPage( id: i) ));
                          },
                          child: Container(
                            width: 360,
                            height: 200,
                            margin: const EdgeInsets.symmetric(vertical: 10),
                            child: Stack(
                              children: <Widget>[
                                ClipRRect(
                                  borderRadius: BorderRadius.circular(15),
                                  child: Image.asset(
                                    "assets/mon$i.jpg",
                                    height: 200,
                                    width: 360,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                                Positioned.fill(
                                  child: Align(
                                    alignment: Alignment.center,
                                    child: Stack(
                                        children:[
                                          Text(
                                            data[i].nameRecipes,
                                            style: TextStyle(
                                              // color: Colors.white,
                                              fontSize: 22,
                                              fontWeight: FontWeight.w400,
                                              foreground: Paint()
                                                ..style = PaintingStyle.stroke
                                                ..strokeWidth = 1.5
                                                ..color = const Color(0xFF727170),
                                            ),
                                          ),
                                          Text(
                                            data[i].nameRecipes,
                                            style: const TextStyle(
                                              color: Colors.white,
                                              fontSize: 22,
                                              fontWeight: FontWeight.w400,

                                            ),
                                          ),

                                        ]
                                    ),
                                  ),
                                ),
                              ],

                            ),

                          ),
                        )
                    ],
                  );
                }
            ),
          ),
        ]
    );
  }
}

