import 'package:flutter/material.dart';
import './DummyData.dart';
import './screen/filter_screen.dart';
import './screen/tabs_screen.dart';


import './screen/meal_detail_screen.dart';
import 'screen/category_meal_screen.dart';
import './model/meals.dart';


void main()
{
  runApp(MyApp()) ;
}


 class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

  Map<String,bool> _filters = {
    'gluten' : false,
    'lactose' : false,
    'vegan' : false,
    'vegetarian' : false,
  };


  List<Meal> _availableMeals =DUMMY_MEALS ;
  List<Meal> _favoriteMeal = [];


  void _setFilters(Map<String,bool> filterData){       //will be called from filterScreen using action button
    setState(() {
      _filters = filterData ;

      _availableMeals = DUMMY_MEALS.where((meal)  {
        if(_filters['gluten'] && !meal.isGlutenFree){
          return false;
        }
        if(_filters['lactose'] && !meal.isLactoseFree){
          return false ;
        }
        if(_filters['vegan'] && !meal.isVegan){
          return false ;
        }
        if(_filters['vegetarian'] && !meal.isVegetarian){
          return false ;
        }
        return true ;
      }).toList();
    });
  }

  void toggleFavorite(String mealId){
    final existingMeal = _favoriteMeal.indexWhere((meal) => meal.id == mealId)  ;// check whether particular element are part of the meal and returns it's index
    if(existingMeal >= 0)
      {
        setState(() {
          _favoriteMeal.removeAt(existingMeal);
        });
      }
    else{
      setState(() {
        _favoriteMeal.add(DUMMY_MEALS.firstWhere((meal) => meal.id == mealId));
      });
    }
  }

  bool _isFavorite(String id)
  {
    return _favoriteMeal.any((element) => element.id == id);      // returns true if found
  }

   @override
   Widget build(BuildContext context) {
     return MaterialApp(
       title: "Meal",
       theme: ThemeData(
         primarySwatch: Colors.red,
         accentColor: Colors.tealAccent,
         canvasColor: Color.fromRGBO(255, 254, 229, 1)
       ),
       // home: CategoriesScreen(), since we have used initial route
       initialRoute: '/',
       routes: {
         '/':  (ctx) => TabsScreen(_favoriteMeal),
         CategoryMealScreen.routeName : (ctx) => CategoryMealScreen(  _availableMeals),    // static const routename = is writtern in widget whose name is given here
         MealDetailScreen.routeName : (ctx) => MealDetailScreen(toggleFavorite,_isFavorite),
         FilterScreen.routeName : (ctx) => FilterScreen(_filters ,_setFilters),
       },
     );
   }
}
 


