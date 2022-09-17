import 'package:cooking_book/database/recipes_db.dart';
import 'package:flutter/material.dart';


class ShoppingLV extends StatefulWidget {
  const ShoppingLV({Key? key}) : super(key: key);

  @override
  State<ShoppingLV> createState() => _ShoppingLVState();
}

class _ShoppingLVState extends State<ShoppingLV> {
  @override
  Widget build(BuildContext context) {
    var db = DatabaseConect();
    return FutureBuilder(
        future: db.getShoppingList(),
        initialData: const [],
        builder: (BuildContext context, AsyncSnapshot<List> snapshot){
          var data = snapshot.data;
          return data!.isEmpty?
          const Center(
            child: Text("no data"),
          )
              :ListView(
            children: [
              for (int j=0; j<data.length; j++)
              Stack(
                children: [
                  Container(
                      padding: const EdgeInsets.all(20),
                      margin: const EdgeInsets.symmetric(vertical: 10),
                      width: double.infinity,
                      height: 280,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        shape: BoxShape.rectangle,
                        borderRadius: BorderRadius.circular(35),
                      ),
                      child: FutureBuilder(
                        future: getData(data[j].id),
                        initialData: const [],
                        builder: (BuildContext context, AsyncSnapshot snapshot){
                          var data = snapshot.data;
                          return snapshot.data==null?
                          const Center(
                            child: Text('Cant get data'),
                          ):
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                findLast(data),
                                style: const TextStyle(
                                  fontWeight: FontWeight.w500,
                                  fontSize: 25,
                                ),
                              ),
                              const SizedBox(height: 7,),
                              for(int i = 0; i < data.length-1; i++)
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
                        },
                      )
                  ),
                  Positioned(
                    right: 10,
                      top: 10,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(50),
                        child: IconButton(
                          icon: const Icon(
                              Icons.disabled_by_default,
                            size: 30,
                            color: Colors.blue,
                          ),
                          onPressed: (){
                            setState(() {
                              db.deleteRecipes(data[j]);
                            });
                          },
                        ),
                      ),
                  ),
                ],
              ),
            ],
          );
        }
    );
  }
  Future<List<String>> getData(id) async{
    var db = DatabaseConect();
    List<String> output = [];
    var recipes = await db.getRecipeByID(id);
    output = recipes.ingredians;
    output.add(recipes.nameRecipes);
    return output;
  }

  String findLast(list){
    String output = 'nodata';
    for(int i =1 ; i<= list.length-1 ; i++){
      if(i ==  list.length-1  ){
        output = list[i];
      }
    }
    return output;
  }
}
