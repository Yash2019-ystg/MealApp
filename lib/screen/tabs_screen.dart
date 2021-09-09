import 'package:flutter/material.dart';
import './favorites_screen.dart';
import '../widget/main_drawer.dart';
import './Categories_screen.dart';
import '../model/meals.dart';


class TabsScreen extends StatefulWidget {

  final List<Meal> favoriteMeal ;
  TabsScreen(this.favoriteMeal);

  @override
  _TabsScreenState createState() => _TabsScreenState();
}

class _TabsScreenState extends State<TabsScreen> {

  List<Widget> _pages ;
  //    = [
  //  CategoriesScreen(),
  //  FavoritesScreen(widget.favoriteMeal)   //"widget"  //The instance member 'widget' can't be accessed in an initializer.
   // Try replacing the reference to the instance member with a different expression  //widget could be used in build method
  // ];    // u cannot initialize in properties

// final List<Map<String,Object>> _pages = [           // if u want title to change with cgande of screen
 //  {
  //   'page' : CategoriesScreen(),
   //  'title' : "Categories"
 //  },
 //  {
   //  'pages' : FavoritesScreen(),
  //   'title' : 'Favorites'
  // }
 // ];

  @override
  void initState(){                        // widget problem solved here
    _pages =  [
    CategoriesScreen(),
    FavoritesScreen(widget.favoriteMeal)
  ];
    super.initState();
  }


 int _selectedPageIndex = 0 ;


  void _selectPage(int index){                //  here we passs index of selected Tab
    setState(() {
      _selectedPageIndex = index ;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Meal'),    // title: Text(_pages[_selectedPageIndex]['title'])
      ),
      drawer: MainDrawer(),
      body: _pages[_selectedPageIndex],         // _pages[_selectedPageIndex]['page']
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: Colors.white ,
        unselectedItemColor: Colors.black,
        backgroundColor: Theme.of(context).primaryColor,
        currentIndex: _selectedPageIndex, // to see white color on selected branch , without it , selected colors will not change
      //  type: BottomNavigationBarType.shifting,
        onTap: _selectPage,
        items: [
          BottomNavigationBarItem
            (icon: Icon(Icons.category)
              , title: Text('Categories'),
            //  backgroundColor: Theme.of(context).primaryColor, can be used with type:
          ),
          BottomNavigationBarItem(icon: Icon(Icons.star) ,
              title: Text('Favorites'),
           // backgroundColor: Theme.of(context).primaryColor, can be used with type:
          ),
        ],
      ),
    );
  }
}
    //  DefaultTabController(                                    // for having tab at top
     // length: 2,    // how many tabs in tab bar
     // child: Scaffold(
      //  appBar: AppBar(
      //    title: Text("Meals"),
       //   bottom: TabBar(tabs: [
        //    Tab(icon : Icon(Icons.category),text: 'Categories' ,),
         //   Tab(icon : Icon(Icons.star),text: 'Favorites' ,)
         // ],
        //  ),
       // ),
       // body: TabBarView(children: [
        //  CategoriesScreen(),
         // FavoritesScreen(),
      //  ]),
    //  ),
   // );
 // }
//}
