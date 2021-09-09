import 'package:flutter/material.dart';
import 'package:mealapp/widget/main_drawer.dart';

class FilterScreen extends StatefulWidget {

  static const routeName = '/filters' ;
  final Function saveFilters;
  final  Map<String,bool> currentFilters ;

  FilterScreen(this.currentFilters,this.saveFilters);

  @override
  _FilterScreenState createState() => _FilterScreenState();
}

class _FilterScreenState extends State<FilterScreen> {

  bool _gultenFree = false;
  bool _vegetarian = false;
  bool _vegan = false;
  bool _lactoseFree = false;

  @override
  initState() {
    _gultenFree = widget.currentFilters['gluten'];         // to see selected filters as it is initialized only once so it's values are kept
    _lactoseFree = widget.currentFilters['lactose'];
    _vegan = widget.currentFilters['vegan'];
    _vegetarian = widget.currentFilters['vegetarian'];
    super.initState();
  }

  Widget buildSwitchListTile(String title , bool check,Function state) {           //builder method
    return SwitchListTile(
      title: Text(title),
      value: check,
      onChanged: state,
    );
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Filters"),
        actions: [
          IconButton(icon: Icon(Icons.save), onPressed:
          () {
            final selectedFilters = {
              'gluten': _gultenFree,
              'lactose': _lactoseFree,
              'vegan': _vegan,
              'vegetarian': _vegetarian,
            };
            widget.saveFilters(selectedFilters);
          }
    )
        ],
      ),
      // drawer: MainDrawer(),
      body: Column(
        children: [
          Container(
            padding: EdgeInsets.all(20.0),
            child: Text('Adjust your meal selection'),
          ),
          Expanded(child: ListView(
            children: [
              buildSwitchListTile(
                  'GultenFree',
                _gultenFree,
                  (newvalue) {
                setState(() {
                  _gultenFree = newvalue;
                });
                  }
              ),
              buildSwitchListTile(
                  'LactoseFree',
                  _lactoseFree,
                      (newvalue) {
                    setState(() {
                      _lactoseFree = newvalue;
                    });
                  }
              ),
              buildSwitchListTile(
                  "Vegan" ,
                  _vegan,
                      (newvalue) {
                    setState(() {
                      _vegan = newvalue;
                    });
                  }
              ),
              buildSwitchListTile(
                  'Vegetarian' ,
                  _vegetarian,
                      (newvalue) {
                    setState(() {
                      _vegetarian = newvalue;
                    });
                  }
              ),
            ],
           ),
          ),
        ],
      ),
    );
  }
}
