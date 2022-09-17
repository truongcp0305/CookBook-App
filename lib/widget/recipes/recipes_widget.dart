import 'package:cooking_book/database/recipes_db.dart';
import 'package:cooking_book/widget/navbar_widget.dart';
import 'package:cooking_book/widget/recipes/favoriteButton.dart';
import 'package:cooking_book/widget/recipes/recipesButton_widget.dart';
import 'package:cooking_book/widget/recipes/ytPlay_widget.dart';
import 'package:flutter/material.dart';
import 'ingredians_widget.dart';

class RecipesPage extends StatelessWidget {
   final int id;
  const RecipesPage({required this.id, Key? key}) : super(key: key);

  RecipesPage createState() => RecipesPage(id: id);


  @override
  Widget build(BuildContext context) {
    var db = DatabaseConect();


    return Scaffold(
      body: SingleChildScrollView(
        child:FutureBuilder(
          future: db.getRecipes(),
            initialData: const [],
          builder: (BuildContext context, AsyncSnapshot<List> snapshot) {
            var data = snapshot.data;


            return data!.isEmpty
                ?const Center(
              child: Text("no data"),
            )
              :Column(
              children: [
                Stack(
                  children: [
                    Image.asset(
                      "assets/mon$id.jpg",
                      height: 200,
                      width: double.infinity,
                      fit: BoxFit.cover,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 20, horizontal: 15),
                      child: InkWell(
                        onTap: () {
                          Navigator.pop(context);
                        },
                        child: const Icon(
                          Icons.arrow_back,
                          color: Colors.black,
                          size: 30,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 170, vertical: 65),
                      child: IconButton(
                        icon: const Icon(
                          Icons.play_circle_outline,
                          color: Colors.red,
                          size: 60,
                        ),
                        onPressed: (){
                          Navigator.push(context, MaterialPageRoute(
                              builder: (context) => YoutubePlay(data: data[id].iconsInfor.split(';')[2]),
                          ));
                        },
                      )
                    ),
                  ],
                ),
                Container(
                  height: 180,
                  width: double.infinity,
                  decoration: const BoxDecoration(
                    color: Colors.white,
                  ),
                  child: Column(
                    children: [
                      const SizedBox(height: 5,),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            data[id].nameRecipes,
                            style: const TextStyle(
                              color: Colors.black,
                              fontSize: 25,
                              fontWeight: FontWeight.w300,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(right: 20),
                            child: Favorite(recipes: data[id]),
                          ),
                        ],
                      ),
                      const SizedBox(height: 30,),
                    Expanded(child: RecipesButtons(id: id)),
                    ],
                  ),
                ),
                Container(
                  height: 60,
                  decoration: const BoxDecoration(
                    color: Color(0xFFFA7D21),
                  ),
                  child: Row(
                    children: const [
                      Padding(
                        padding: EdgeInsets.all(10),
                        child: Icon(
                          Icons.bookmark_outline,
                          size: 35,
                          color: Colors.white,
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.all(10),
                        child: Text(
                          "Ingredians Required",
                          style: TextStyle(
                            fontSize: 18,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Ingredians(id: id),
                Container(
                  height: 60,
                  decoration: const BoxDecoration(
                    color: Color(0xFFFA7D21),
                  ),
                  child: Row(
                    children: const [
                      Padding(
                        padding: EdgeInsets.all(10),
                        child: Icon(
                          Icons.note_outlined,
                          size: 35,
                          color: Colors.white,
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.all(10),
                        child: Text(
                          "Directions to Prepare",
                          style: TextStyle(
                            fontSize: 18,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  width: double.infinity,
                  decoration: const BoxDecoration(
                    color: Colors.white,
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(20),
                    child: Text(
                      data[id].directions,
                      style: const TextStyle(
                        color: Colors.black,
                        fontSize: 20,
                      ),
                    ),
                  ),
                ),
              ],
            );

          }
        ),
      ),
      bottomNavigationBar: const NavBar(),
    );
  }
}
