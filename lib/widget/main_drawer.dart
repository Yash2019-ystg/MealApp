import 'package:flutter/material.dart' ;
import 'package:mealapp/screen/filter_screen.dart';

class MainDrawer extends StatelessWidget {

  Widget buildListTile(String title , IconData icon,Function tap){
    return ListTile(
      leading: Icon(icon , size: 25,),
      title: Text(title , style: TextStyle(fontSize: 20 , fontWeight: FontWeight.w800),),
      onTap: tap,
    );
  }


  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          Container(
            height: 100,
            width: double.infinity,
            child: Text('Cooking' , style: TextStyle(fontSize: 35.0,
            ),),
            alignment: Alignment.centerLeft,
            color:Colors.deepPurpleAccent ,
          ),
          SizedBox(height: 20.0,),
          buildListTile('Meals', Icons.restaurant,() => Navigator.of(context).pushNamed('/')),
          buildListTile('Filters', Icons.settings, () =>Navigator.of(context).pushNamed(FilterScreen.routeName)),
        ],
      ),
    );
  }
}
