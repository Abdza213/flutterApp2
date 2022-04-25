import 'package:flutter/material.dart';
import 'package:sampleproject/DescriptionPage/CategoriesScreen.dart';

class homePageItem extends StatelessWidget {
  Color color;
  String title;
  String id;
  homePageItem({
    required this.color,
    required this.title,
    required this.id,
  });
  navigationPage(BuildContext context) {
    Navigator.pushNamed(
      context,
      ItemsScreen.routeName,
      arguments: {
        'id': id,
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (() => navigationPage(context)),
      borderRadius: BorderRadius.circular(20),
      splashColor: Theme.of(context).accentColor,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          gradient: LinearGradient(
            colors: [
              color.withOpacity(1),
              color.withOpacity(.6),
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomLeft,
          ),
        ),
        child: Container(
          alignment: Alignment.topLeft,
          padding: EdgeInsets.all(20),
          child: Text(
            title,
            style: Theme.of(context).textTheme.headline1,
          ),
        ),
      ),
    );
  }
}
