import 'package:cooking_book/database/recipes_db.dart';
import 'package:cooking_book/widget/navbar_widget.dart';
import 'package:flutter/material.dart';

import '../recipes/recipes_widget.dart';

class FavoriteList extends StatelessWidget {
  const FavoriteList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var db = DatabaseConect();
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
                  'Favorite',
                  style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.w400,
                    fontSize: 25,
                  ),
                ),
              ],
            ),
          ),
          Expanded(
              child: FutureBuilder(
                  future: db.getFavoriteList(),
                  initialData: const [],
                  builder: (BuildContext context, AsyncSnapshot<List> snapshot){
                    var data = snapshot.data;

                    return data!.isEmpty?
                    const Center(
                      child: Text("no data"),
                    )
                        :ListView(
                      children: <Widget>[
                        for(int i =0; i<data.length; i++)
                          InkWell(
                            onTap: (){
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => RecipesPage( id: data[i].id)
                                  )
                              );
                            },
                            child: Container(
                              height: 120,
                              width: double.infinity,
                              padding: const EdgeInsets.all(5),
                              child: Row(
                                children: [
                                  ClipRRect(
                                    borderRadius: BorderRadius.circular(15),
                                    child: Image.asset(
                                      'assets/mon${data[i].id}.jpg',
                                      height: 120,
                                      width: 120,
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                  Container(
                                    padding: const EdgeInsets.all(9),
                                    width: 260,
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          data[i].nameRecipes,
                                          overflow: TextOverflow.ellipsis,
                                          style: const TextStyle(
                                            color: Colors.black,
                                            fontSize: 20,
                                            fontWeight: FontWeight.w400,
                                          ),
                                        ),
                                        const SizedBox(height: 10,),
                                        Text(
                                          data[i].IconsData()[0]+' calories',
                                          style: const TextStyle(
                                            fontSize: 15,
                                            color: Colors.black,
                                          ),
                                        ),
                                        const SizedBox(height: 10,),
                                        Text(
                                          data[i].IconsData()[1],
                                          style: const TextStyle(
                                            fontSize: 15,
                                            color: Colors.black,
                                          ),
                                        )

                                      ],
                                    ),
                                  )
                                ],
                              ),
                            ),
                          )
                      ],
                    );
                  }
              )
          )
        ],
      ),
      bottomNavigationBar: const NavBar(),
    );
  }
}
