import 'package:cooking_book/widget/homePage/allRecipes_widget.dart';
import 'package:cooking_book/widget/homePage/mayYouLike_widget.dart';
import 'package:cooking_book/widget/navbar_widget.dart';
import 'package:flutter/material.dart';




class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:
       Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(
                vertical: 18,
                horizontal: 10,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    children: const [
                      Text("CookBook App",
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 28,
                          fontWeight: FontWeight.w500,
                        ),)
                    ],
                  ),
                  ClipRRect(
                    child: Image.asset("assets/user.png", height: 60, width: 60,) ,
                  ),
                ],
              ),
            ),
            InkWell(
              onTap: (){
                Navigator.pushNamed(context, 'search');
              },
              child: Container(
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
                        onTap: (){
                          Navigator.pushNamed(context, 'search');
                        },
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
            ),
            Expanded(
                child: ListView(
                  children: const <Widget>[
                    SizedBox(height: 30,),
                    MayYouLike(),
                    SizedBox(height: 40,),
                    AllRecipes(),
                  ],
                ),
            ),
            const NavBar(),
            // SizedBox(height: 30,),
            // MayYouLike(),
            // SizedBox(height: 40,),
            // AllRecipes(),
          ],
        ),

    );
  }
}
