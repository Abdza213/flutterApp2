import 'package:flutter/material.dart';
import 'package:sampleproject/Database/dummy_data.dart';
import 'package:sampleproject/homePage/homePageItem.dart';

class homePageScreen extends StatelessWidget {
  static const routeName = '/homePageScreen';
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: GridView.count(
        physics: BouncingScrollPhysics(),
        crossAxisCount: 2,
        mainAxisSpacing: 10,
        crossAxisSpacing: 10,
        children: DUMMY_CATEGORIES.map((Item) {
          return homePageItem(
            color: Item.color,
            title: Item.title,
            id: Item.id,
          );
        }).toList(),
      ),
    );
  }
}
