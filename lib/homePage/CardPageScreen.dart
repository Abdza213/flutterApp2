import 'package:flutter/material.dart';

import '../Database/Meal.dart';
import '../DescriptionPage/CategoriesItem.dart';

class cardPageScreen extends StatelessWidget {
  final List<Meal> favoriteMeals;
  cardPageScreen({required this.favoriteMeals});
  @override
  Widget build(BuildContext context) {
    if (favoriteMeals.isEmpty) {
      return Center(
        child: Text(
          'You have no favorites yet - start adding some',
          style: Theme.of(context).textTheme.headline1,
          textAlign: TextAlign.center,
        ),
      );
    } else {
      return ListView.builder(
        physics: BouncingScrollPhysics(),
        itemBuilder: (context, index) {
          return CategoriesItem(
            title: favoriteMeals[index].title,
            imageUrl: favoriteMeals[index].imageUrl,
            duration: favoriteMeals[index].duration,
            complexity: favoriteMeals[index].complexity,
            affordability: favoriteMeals[index].affordability,
            id: favoriteMeals[index].id,
          );
        },
        itemCount: favoriteMeals.length,
      );
    }
  }
}
