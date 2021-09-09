import 'package:flutter/material.dart';
import '../DummyData.dart';


class MealDetailScreen extends StatelessWidget {

  static const routeName = 'meal-detail';
  final Function toggleFavorite;
  final Function isFavorite;
  MealDetailScreen(this.toggleFavorite, this.isFavorite);

  @override
  Widget build(BuildContext context) {
    final mealId = ModalRoute.of(context).settings.arguments as String;
    final selectedMeal = DUMMY_MEALS.firstWhere((meal) => meal.id == mealId );


    Widget buildSectionTitle(BuildContext context ,String text){
      return Container(
        margin: EdgeInsets.symmetric(vertical: 10.0),
        child: Text(text ,
          style: TextStyle(fontWeight: FontWeight.bold,
              fontSize: 20.0),
        ),
      );
    }

    Widget buildContainer(BuildContext context , Widget child){
      return Container(
          padding: EdgeInsets.all(20.0),
      decoration: BoxDecoration(
      color: Colors.white70,
      border: Border.all(color: Colors.black)
      ),
      height: 200.0,
      width:  400,
      child: child );
    }


    return Scaffold(
      appBar: AppBar(title: Text(selectedMeal.title),),
        body: Stack(
          children: [ SingleChildScrollView(
            child: Column(
              children: [
                Container(
                  height: 300,
                  width: double.infinity,
                  child: Image.network(selectedMeal.imageUrl,
                  fit: BoxFit.cover,)
                ),
                buildSectionTitle(context,'Ingredients'),
               buildContainer(context,
                  ListView.builder(
                    itemBuilder: (ctx,index) => Card(
                      color: Theme.of(context).accentColor,
                      child: Text(selectedMeal.ingredients[index], style: TextStyle(fontSize: 20.0),),
                    ),
                    itemCount: selectedMeal.ingredients.length,
                  ),
                ),
                buildSectionTitle(context,'Steps'),
                  buildContainer(context,
                  ListView.builder(
                    itemCount: selectedMeal.steps.length,
                    itemBuilder: (ctx,index) => Column(
                      children: [
                        ListTile(
                          leading: CircleAvatar(
                            child:Text('# ${index + 1}'),
                          ),
                          title: Text(selectedMeal.steps[index]),
                        ),
                        Divider(), // draw line (horizontal)
                      ],
                    ) ,

                    ),
                  ),
              ],
            ),
          ),
            FloatingActionButton(onPressed: () => toggleFavorite(mealId) ,
              child: Icon(
                  isFavorite(mealId) ? Icons.star : Icons.star_border
              ),
            ),
          ]
        ),
    );
  }
}
