import 'package:flutter/material.dart';
import '../model/meals.dart';
import '../widget/Meal_Item.dart';

class FavoritesScreen extends StatelessWidget {

  final List<Meal> _favoriteMeal;
  FavoritesScreen(this._favoriteMeal);

  @override
  Widget build(BuildContext context) {
    if (_favoriteMeal.isEmpty) {
      return Center(child: Text('No favorite Meal'),);
    }
    else{
        return ListView.builder(itemBuilder: (ctx , index) {
          return MealItem(
              id: _favoriteMeal[index].id,
              title: _favoriteMeal[index].title,
              imageUrl:_favoriteMeal[index].imageUrl,
              affordability:_favoriteMeal[index].affordability,
              complexity: _favoriteMeal[index].complexity,
              duration: _favoriteMeal[index].duration);
        },
          itemCount: _favoriteMeal.length,
        );
    }

  }

}
