import 'package:flutter/material.dart';
import 'package:sampleproject/Database/Meal.dart';
import 'package:sampleproject/Database/dummy_data.dart';
import 'package:sampleproject/DescriptionPage/DescriptionItemScreen.dart';
import 'package:sampleproject/homeScreen.dart';

import 'DescriptionPage/CategoriesScreen.dart';
import 'homePage/homePageScreen.dart';

void main() {
  runApp(newApp());
}

class newApp extends StatefulWidget {
  @override
  State<newApp> createState() => _newAppState();
}

class _newAppState extends State<newApp> {
  final List<Meal> _favoriteMeals = [];

  void _addFavoriteMeals(String Id) {
    final a1 = _favoriteMeals.indexWhere(
        (element) => element.id == Id); //// ارجاع الانديكس الخاص بكل عنصر
    if (a1 >= 0) {
      setState(() {
        _favoriteMeals.removeAt(
            a1); // هو عبارة فقط هناا عن استقبال الانديسكس ويتم الحذف التلقائي
      });
    } else {
      setState(() {
        _favoriteMeals
            .add(DUMMY_MEALS.firstWhere((element) => element.id == Id));
      });
    }
  }

  bool _isMealFavoirite(String Id) {
    return _favoriteMeals.any((element) => element.id == Id);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.pink,
        canvasColor: Color.fromARGB(255, 240, 250, 154),
        accentColor: Colors.pink,
        textTheme: TextTheme(
          bodyText1: TextStyle(
            fontSize: 20,
            color: Colors.black,
            fontWeight: FontWeight.bold,
          ),
          headline1: TextStyle(
            fontSize: 20,
            color: Colors.black.withOpacity(.8),
            fontWeight: FontWeight.bold,
          ),
          headline2: TextStyle(
            fontSize: 20,
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
          headline3: TextStyle(
            fontSize: 20,
            color: Colors.black,
            fontWeight: FontWeight.normal,
          ),
        ),
      ),
      initialRoute: homeScreen.routeName,
      routes: {
        homePageScreen.routeName: (context) => homePageScreen(),
        ItemsScreen.routeName: (context) => ItemsScreen(),
        DescriptionItemScreen.routeName: (context) => DescriptionItemScreen(
              addFavoriteMeals: _addFavoriteMeals,
              isFavoriteMeal: _isMealFavoirite,
            ),
        homeScreen.routeName: (context) =>
            homeScreen(favoriteMeals: _favoriteMeals),
      },
    );
  }
}
