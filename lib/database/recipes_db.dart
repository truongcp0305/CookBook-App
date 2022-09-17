import 'package:cooking_book/database/query.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import '../model/recipes.dart';
import '../model/recipes2.dart';


class DatabaseConect{
   Database? _database;

   //String getAll = "SELECT * FROM recipes";

  Future<Database> get database async{
    final dbpath = await getDatabasesPath();
    const dbName = "cookbook30";
    final path = join(dbpath, dbName);
    _database = await openDatabase(path, version: 1, onCreate: _createTable);
    return _database!;
  }

  Future<void> _createTable(Database db, int version) async{
    await db.execute(Query().createTable0);
    await db.execute(Query().insertData1 );
    await db.execute(Query().insertData2 );
    await db.execute(Query().insertData3 );
    await db.execute(Query().createTableShoppingList);
    await db.execute(Query().createTableFavoriteList);
  }

  Future<List<Recipes>> getRecipes ()async{
    final db = await database;
    List<Recipes> output = [];
    List<Map<String, dynamic>> items =await db.query('recipes');
    List.generate(items.length, (i) => {
    });

      List.generate(items.length,
            (i) => {
        output.add(Recipes(
            id: items[i]['id'],
            nameRecipes:  items[i]['name'],
            ingredians: items[i]['ingredians'],
            directions: items[i]['directions'],
            iconsInfor: items[i]['iconsInfor'],
            category: items[i]['category']
        ))
      }
    );
      return output;

  }

  Future<Recipes2> getRecipeByID(id) async{
    final db = await database;
    List<Map<String, dynamic>> items = await db.query('recipes', where: 'id = ?', whereArgs: [id] );
    List<Recipes2> output = [];
    List.generate(items.length,
            (i) => {
          output.add(Recipes2(
              id: items[i]['id'],
              nameRecipes:  items[i]['name'],
              ingredians: items[i]['ingredians'].split(';'),
              directions: items[i]['directions'],
              iconsInfor: items[i]['iconsInfor'].split(';'),
              category: items[i]['category'],
              l: items[i]['ingredians'].split(';').length,
          ))
        }
    );
    return Recipes2(
        id: items[0]['id'],
        nameRecipes:  items[0]['name'],
        ingredians: items[0]['ingredians'].split(';'),
        directions: items[0]['directions'],
        iconsInfor: items[0]['iconsInfor'].split(';'),
        category: items[0]['category'],
        l: items[0]['ingredians'].split(';').length,
    );
  }

   Future<Recipes> getRecipeByID2 (int id)async{
     final db = await database;
     List<Map<String, dynamic>> items = await db.query('recipes', where: 'id = ?', whereArgs: [id] );
    List.generate(items.length,
             (i) => {
           Recipes(
               id: items[i]['id'],
               nameRecipes:  items[i]['name'],
               ingredians: items[i]['ingredians'],
               directions: items[i]['directions'],
               iconsInfor: items[i]['iconsInfor'],
               category: items[i]['category'])
         }
     );
     return  Recipes(
         id: items[0]['id'],
         nameRecipes:  items[0]['name'],
         ingredians: items[0]['ingredians'],
         directions: items[0]['directions'],
         iconsInfor: items[0]['iconsInfor'],
         category: items[0]['category']
     );

   }



   Future<List<Recipes>> getCategory (String key)async{
     final db = await database;
     List<Recipes> output = [];
     List<Map<String, dynamic>> items =await db.query('recipes', where: 'category =?', whereArgs: [key]);
     List.generate(items.length,
             (i) => {
           output.add(Recipes(
               id: items[i]['id'],
               nameRecipes:  items[i]['name'],
               ingredians: items[i]['ingredians'],
               directions: items[i]['directions'],
               iconsInfor: items[i]['iconsInfor'],
               category: items[i]['category']
           ))
         }
     );
     return output;
   }

   Future<void> insertShoppingList(Recipes recipes) async{
    final db = await database;
    await db.insert("shoppinglist", recipes.toMap(), conflictAlgorithm:  ConflictAlgorithm.replace);
   }

   Future<List<Recipes>> getShoppingList ()async{
     final db = await database;
     List<Recipes> output = [];
     List<Map<String, dynamic>> items =await db.query('shoppinglist');

     List.generate(items.length,
             (i) => {
           output.add(Recipes(
               id: items[i]['id'],
               nameRecipes:  items[i]['name'],
               ingredians: items[i]['ingredians'],
               directions: items[i]['directions'],
               iconsInfor: items[i]['iconsInfor'],
               category: items[i]['category']
           ))
         }
     );
     return output;
   }

   Future<void> deleteRecipes(Recipes recipes) async{
    final db = await database;
    await db.delete(
      'shoppinglist',
      where: 'id == ?',
      whereArgs: [recipes.id],
    );
   }

   Future<void> insertFavoriteList(Recipes recipes) async{
     final db = await database;
     await db.insert("favoritelist", recipes.toMap(), conflictAlgorithm:  ConflictAlgorithm.replace);
   }

   Future<List<Recipes>> getFavoriteList ()async{
     final db = await database;
     List<Recipes> output = [];
     List<Map<String, dynamic>> items =await db.query('favoritelist');

     List.generate(items.length,
             (i) => {
           output.add(Recipes(
               id: items[i]['id'],
               nameRecipes:  items[i]['name'],
               ingredians: items[i]['ingredians'],
               directions: items[i]['directions'],
               iconsInfor: items[i]['iconsInfor'],
               category: items[i]['category']
           ))
         }
     );
     return output;
   }

   Future<void> deleteRecipes2(Recipes recipes) async{
     final db = await database;
     await db.delete(
       'favoritelist',
       where: 'id == ?',
       whereArgs: [recipes.id],
     );
   }

   Future<Recipes> getFavoriteByID (int id)async{
     final db = await database;
     List<Map<String, dynamic>> items = await db.query('favoritelist', where: 'id = ?', whereArgs: [id] );
     List.generate(items.length,
             (i) => {
           Recipes(
               id: items[i]['id'],
               nameRecipes:  items[i]['name'],
               ingredians: items[i]['ingredians'],
               directions: items[i]['directions'],
               iconsInfor: items[i]['iconsInfor'],
               category: items[i]['category'])
         }
     );
     return  Recipes(
         id: items[0]['id'],
         nameRecipes:  items[0]['name'],
         ingredians: items[0]['ingredians'],
         directions: items[0]['directions'],
         iconsInfor: items[0]['iconsInfor'],
         category: items[0]['category']
     );

   }


   Future<List<Recipes>> getRecipesByQuery (String query)async{
     final db = await database;
     List<Recipes> output = [];
     List<Map<String, dynamic>> items =await db.query('select * from recipes where name glob ?', whereArgs: [query]);

     List.generate(items.length,
             (i) => {
           output.add(Recipes(
               id: items[i]['id'],
               nameRecipes:  items[i]['name'],
               ingredians: items[i]['ingredians'],
               directions: items[i]['directions'],
               iconsInfor: items[i]['iconsInfor'],
               category: items[i]['category']
           ))
         }
     );
     return output;
   }

}