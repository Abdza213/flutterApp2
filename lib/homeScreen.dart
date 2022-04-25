import 'package:flutter/material.dart';
import 'package:sampleproject/Database/dummy_data.dart';
import 'package:sampleproject/homePage/CardPageScreen.dart';
import 'package:sampleproject/homePage/homePageScreen.dart';

import 'Database/Meal.dart';

class homeScreen extends StatefulWidget {
  static const routeName = '/homeScreen';
  final List<Meal> favoriteMeals;

  homeScreen({required this.favoriteMeals});
  @override
  State<homeScreen> createState() => _homeScreenState();
}

class _homeScreenState extends State<homeScreen> {
  int nextPage = 0;
  _next(int index) {
    setState(() {
      nextPage = index;
    });
  }

  late List<Widget> getBodyInf = [
    homePageScreen(),
    cardPageScreen(favoriteMeals: widget.favoriteMeals),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: getBodyInf[nextPage],
      appBar: AppBar(
        title: Text(
          'Home Page',
          style: Theme.of(context).textTheme.bodyText1,
        ),
        centerTitle: true,
      ),
      bottomNavigationBar: BottomNavigationBar(
        elevation: 10,
        items: [
          BottomNavigationBarItem(
            backgroundColor: Theme.of(context).accentColor,
            icon: Icon(Icons.home),
            label: 'Home Page',
          ),
          BottomNavigationBarItem(
            backgroundColor: Theme.of(context).accentColor,
            icon: Icon(Icons.star),
            label: 'Favorites',
          ),
        ],
        onTap: _next,
        currentIndex: nextPage,
        selectedLabelStyle: TextStyle(
          fontSize: 18,
          color: Colors.white,
        ),
        unselectedIconTheme: IconThemeData(size: 20, color: Colors.black),
        selectedIconTheme: IconThemeData(size: 25),

        ///  هنا ال INDEX الخاص ب كل صفحة
        showUnselectedLabels: false,
        selectedFontSize: 20,
        fixedColor: Colors.black,
        type: BottomNavigationBarType.shifting,
      ),
      drawer: Drawer(
          child: ListView(
        children: [
          Container(
            color: Colors.red,
            width: double.infinity,
            height: 200,
            child: Image.network(
              DUMMY_MEALS[6].imageUrl,
              fit: BoxFit.cover,
            ),
          ),
          SizedBox(
            height: 10,
          ),
          InkWell(
            splashColor: Theme.of(context).accentColor,
            onTap: (() {
              print('Click');
            }),
            child: ListTile(
              leading: Icon(Icons.home),
              title: Text(
                'Home Page',
                style: Theme.of(context).textTheme.headline3,
              ),
            ),
          ),
          SizedBox(
            height: 10,
          ),
          InkWell(
            splashColor: Theme.of(context).accentColor,
            onTap: (() {
              print('Click');
            }),
            child: ListTile(
              leading: Icon(Icons.settings),
              title: Text(
                'Settings',
                style: Theme.of(context).textTheme.headline3,
              ),
            ),
          ),
        ],
      )),
    );
  }
}
