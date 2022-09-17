import 'package:cooking_book/widget/category/categoryPage_widget.dart';
import 'package:cooking_book/widget/favorite/favorite_widget.dart';
import 'package:cooking_book/widget/homePage/homePage_widget.dart';
import 'package:cooking_book/widget/search/search_widget.dart';
import 'package:cooking_book/widget/shoppingList/shoppingList_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {



  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState(){
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersiveSticky);
   // super initState();
  }
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        scaffoldBackgroundColor: const Color(0xFFBEDCE0)
      ),
      routes: {
        "/": (context) => const HomePage(),
        "categoryPage": (context) => CategoryPage(),
        "shoppingList": (context) => const ShoppingList(),
        'favoriteList': (context) => const FavoriteList(),
        'search': (context) => const Search()
      },
    );
  }
}
