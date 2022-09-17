import 'package:cooking_book/database/recipes_db.dart';
import 'package:cooking_book/widget/navbar_widget.dart';
import 'package:flutter/material.dart';
import '../../model/recipes.dart';
import '../recipes/recipes_widget.dart';


class Search extends StatefulWidget {
  const Search({Key? key}) : super(key: key);

  @override
  State<Search> createState() => _SearchState();
}

class _SearchState extends State<Search> {
  var db = DatabaseConect();
  var textController = TextEditingController();


  Future<List<Recipes>> Data(query) async{
    var db = DatabaseConect();
    var data;
    List<Recipes> output = [];
    data = await db.getRecipes();
    String input = query.toString().toLowerCase();
    for(int i =0; i<data.length; i++){
      var pare = data[i].nameRecipes.toLowerCase();
      if(pare.contains(input)){
        output.add(data[i]);
      }
    }
    return output;
  }
  void change(){
    setState(() {
      Data(textController.text);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            margin: const EdgeInsets.symmetric(vertical: 15, horizontal: 20),
            child: InkWell(
              onTap: (){
                Navigator.pop(context);
              },
              child: const Icon(
                Icons.arrow_back,
                color: Colors.black,
                size: 30,
              ),
            ),
          ),
          const SizedBox(height: 10,),
          Container(
            height: 60,
            padding: const EdgeInsets.all(10),
            margin: const EdgeInsets.symmetric(horizontal: 10),
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10)
            ),
            child: Row(
              children: [
                const Icon(Icons.search, size: 30,),
                Container(
                  width: 300,
                  margin: const EdgeInsets.only(left: 5),
                  child:
                  TextFormField(
                    style: const TextStyle(color: Colors.black),
                    controller: textController,
                    onChanged: (value) => change(),
                    decoration: const InputDecoration(
                      border: InputBorder.none,
                      hintText: "Search",
                      hintStyle: TextStyle(color: Colors.black26),
                    ),
                  ),
                ),

              ],
            ),
          ),
          Expanded(
            child: FutureBuilder(
                future: Data(textController.text),
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
            ),
          )
        ],
      ),
      bottomNavigationBar: const NavBar(),
    );
  }



}
