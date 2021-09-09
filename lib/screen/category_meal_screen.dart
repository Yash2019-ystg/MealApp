import 'package:flutter/material.dart';

import '../widget/Meal_Item.dart';
import '../model/meals.dart';

class CategoryMealScreen extends StatefulWidget {

static const routeName = '/category-meals';
final List<Meal> _availableMeals ;

CategoryMealScreen(this._availableMeals);

  @override
  _CategoryMealScreenState createState() => _CategoryMealScreenState();
}

class _CategoryMealScreenState extends State<CategoryMealScreen> {
  @override
  Widget build(BuildContext context) {

    final routeArgs = ModalRoute.of(context).settings.arguments as Map<String , String> ;
    final categoryTitle = routeArgs['title'];
    final categoryId = routeArgs['id'];

    final categoryMeal = widget._availableMeals.where((meal) {          // To make a list of meals according category given by the user
      return meal.categories.contains(categoryId);           // .contains checks if there is a particular elemnt present
    }                                                        // in categories that is matched with categories id
    ).toList();

    return Scaffold(
      appBar: AppBar(
        title: Text(categoryTitle),
        elevation: 20.0,
      ),
      body: ListView.builder(itemBuilder: (ctx , index) {
        return MealItem(
            id: categoryMeal[index].id,
            title: categoryMeal[index].title,
            imageUrl:categoryMeal[index].imageUrl,
            affordability: categoryMeal[index].affordability,
            complexity: categoryMeal[index].complexity,
            duration: categoryMeal[index].duration);
      },
        itemCount: categoryMeal.length,
      ),
    );
  }
}
