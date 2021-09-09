import 'package:flutter/cupertino.dart';


import 'package:flutter/material.dart';
import '../screen/meal_detail_screen.dart';
import '../model/meals.dart';


class MealItem extends StatelessWidget {

  final String id;
  final String title;
  final String imageUrl ;
  final int duration;
  final Complexity complexity;
  final Affordability affordability;


  MealItem({
  @required this.id,
  @required this.title ,
  @required this.imageUrl ,
  @required this.affordability ,
  @required this.complexity ,
  @required this.duration ,
       }
      );

  String get complexityText {
    switch(complexity){
      case Complexity.Simple:
        return 'Simple' ;
      case Complexity.Challenging:
        return 'Challenging' ;
      case Complexity.Hard:
        return 'Hard';
      default:
        return 'Unknown' ;
    }
  }

  String get afford{
    switch(affordability){
      case Affordability.Affordable:
        return 'Affordable';
      case Affordability.Luxurious:
        return 'Luxurious';
      case Affordability.Pricey:
        return 'Pricey';

    }
  }

       // or

  //  String get complexityText {
  //   if (complexity == Complexity.Simple) {
  //        return 'Simple';
  //      }
  //    if (complexity == Complexity.Challenging) {
  //       return 'Challenging';
  //   }
  //    if (complexity == Complexity.Hard) {
  //          return 'Hard';
  //   }
                                                 //  }



  void selectMeal(BuildContext context){
   Navigator.of(context).pushNamed(MealDetailScreen.routeName, arguments: id );
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => selectMeal(context),
      child: Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15.0) ),
        elevation: 5.0,
        margin: EdgeInsets.all(10.0),
        child: Column(
          children: [
            Stack(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(15),
                    topRight: Radius.circular(15),
                  ),
                  child: Image.network(imageUrl , height: 250, width: double.infinity, fit: BoxFit.cover,),
                ),
                Positioned(
                  bottom: 20.0,
                  right: 10.0,
                  child: Container(
                    width: 300,
                    color: Colors.black54,
                    child: Text(title , style: TextStyle(
                        fontSize: 26.0 ,
                        color: Colors.white,
                        ),
                         softWrap: true,
                         overflow: TextOverflow.fade,
                    ),
                  ),
                ),
              ],
            ),
            Padding(
              padding: EdgeInsets.all(20.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                 children: [
                   Row(
                     children: [
                       Icon(Icons.schedule),
                       SizedBox(width: 6.0,),
                       Text('${duration} mins')
                     ],
                   ),
                   Row(
                     children: [
                       Icon(Icons.money),
                       SizedBox(width: 6.0,),
                       Text(afford),
                     ],
                   ),
                   Row(
                     children: [
                       Icon(Icons.work),
                       SizedBox(width: 6.0,),
                       Text(complexityText),
                     ],
                   ),
                 ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
