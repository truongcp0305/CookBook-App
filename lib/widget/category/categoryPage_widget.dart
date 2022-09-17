import 'package:cooking_book/widget/navbar_widget.dart';
import 'package:flutter/material.dart';
import 'onList_widget.dart';

class CategoryPage extends StatelessWidget {
  List<String> list = ['Món Việt dễ làm', 'Bữa ăn sáng','Đồ ăn chay','Đồ ăn biển',
  'Thịt lợn ngon','Thịt gà','Rau củ quả','Đồ ngọt','Cơm ngon','Món ăn tiết kiệm','Bữa ăn lành mạnh','Đồ ăn quốc tế'];
  List<String> queryKey =['việt','sáng','chay','biển','lợn','gà','rau','ngọt','cơm','cheap','helthy'];
   CategoryPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                  padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 15),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
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
                      const SizedBox(height: 30,),
                      const Text(
                        "Category",
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 30,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 15),
                child: Column(
                  children: [
                    for(int i =0; i<11; i++)
                    Padding(
                        padding: const EdgeInsets.symmetric(vertical: 20,),
                      child: Row(
                        children: [
                          InkWell(
                            onTap: (){
                              Navigator.push(context, MaterialPageRoute(
                                  builder: (context) => OnList( title:  list[i], queryKey: queryKey[i],) )
                              );
                            },
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(10),
                              child: Image.asset(
                                "assets/cat$i.jpg",
                                height: 70, width: 90,
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                          const SizedBox(width: 10,),
                          Text(
                            list[i],
                            style: const TextStyle(
                              fontSize: 22,
                              color: Colors.black
                            ),
                          ),
                          const Spacer(),
                          InkWell(
                            onTap: (){
                              Navigator.push(context, MaterialPageRoute(
                                  builder: (context) => OnList( title:  list[i], queryKey: queryKey[i],) )
                              );
                            },
                            child: const Icon(
                              Icons.arrow_forward_ios,
                              color: Colors.black,
                              size: 23,
                            ),
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: const NavBar(),
    );
  }
}
