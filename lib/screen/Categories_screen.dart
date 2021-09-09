import 'package:flutter/material.dart';
import 'file:///C:/Users/ysthe/AndroidStudioProjects/mealapp/lib/widget/category_item.dart';

import '../DummyData.dart';


class CategoriesScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return// Scaffold(
      //appBar: AppBar(
      //  elevation: 10.0,
       // title: const Text("Meal App"),
     // ),
           GridView(
            padding:const EdgeInsets.all(10.0),
          gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
              maxCrossAxisExtent: 200.0,  // isse decide hota hai kitte side by side lag sakte hai
              childAspectRatio: 3/2 ,
              crossAxisSpacing: 20.0,
              mainAxisSpacing: 20.0,
          ),
        children: [ ...DummyData.map((catData) => CategoryItem(catData.title, catData.color,catData.id) ).toList() ],
        //  children: DummyData.map((catData) => CategoryItem(catData.title, catData.color) ).toList(), could also be used

    );
  }
}
