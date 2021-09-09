import 'package:flutter/material.dart';

import '../screen/category_meal_screen.dart';

class CategoryItem extends StatelessWidget {

  final String title ;
  final Color color ;
  final String id ;

  CategoryItem(this.title , this.color,this.id);


  void selectCategory(BuildContext ctx){
    Navigator.of(ctx).pushNamed(
        CategoryMealScreen.routeName , arguments: {'id' : id , 'title'  : title}
    );
  }


  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => selectCategory(context) ,
      splashColor: Colors.black,
      borderRadius: BorderRadius.circular(15.0),
      child: Container(
        padding: const EdgeInsets.all(15.0),
        child: Text(title , style: TextStyle(
          fontSize: 20.0,
          fontWeight: FontWeight.bold,
          fontStyle: FontStyle.italic,
        ),
        ),
        decoration: BoxDecoration(
          gradient: LinearGradient(
              colors: [ color.withOpacity(0.7) , color],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
        ),
          borderRadius: BorderRadius.circular(15.0)         // for rounding og the corners
       ),
      ),
    );
  }
}
