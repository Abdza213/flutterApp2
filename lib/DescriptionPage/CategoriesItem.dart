import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:sampleproject/DescriptionPage/DescriptionItemScreen.dart';

import '../Database/Meal.dart';

class CategoriesItem extends StatelessWidget {
  final String title;
  final String imageUrl;
  final Complexity complexity;
  final Affordability affordability;
  final int duration;
  final String id;
  CategoriesItem(
      {required this.title,
      required this.imageUrl,
      required this.complexity,
      required this.affordability,
      required this.duration,
      required this.id});
  String get complexityTitle {
    switch (complexity) {
      case Complexity.Simple:
        return 'Simple';
        break;
      case Complexity.Challenging:
        return 'Challenging';
        break;
      case Complexity.Hard:
        return 'Hard';
        break;
      default:
        return 'Unknown';
    }
  }

  String get affordabilityTitle {
    switch (affordability) {
      case Affordability.Affordable:
        return 'Affordable';
        break;
      case Affordability.Luxurious:
        return 'Luxurious';
        break;
      case Affordability.Pricey:
        return 'Pricey';
        break;
      default:
        return 'Unknown';
    }
  }

  navigationPage(BuildContext context) {
    Navigator.pushNamed(
      context,
      DescriptionItemScreen.routeName,
      arguments: {
        'id': id,
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: InkWell(
        onTap: (() {
          navigationPage(context);
        }),
        child: Card(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
          elevation: 5,
          child: Column(
            children: [
              Stack(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(20),
                      topRight: Radius.circular(20),
                    ),
                    child: Image.network(
                      this.imageUrl,
                      fit: BoxFit.cover,
                    ),
                  ),
                  Positioned(
                    // top: 10,
                    bottom: 10,
                    right: 1,
                    child: Container(
                      width: 200,
                      padding: const EdgeInsets.only(
                          right: 50, top: 10, bottom: 10, left: 5),
                      color: Colors.black54,
                      child: Text(
                        this.title,
                        style: Theme.of(context).textTheme.headline2,
                        softWrap: true,
                      ),
                    ),
                  )
                ],
              ),
              Padding(
                padding: const EdgeInsets.all(15),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Row(
                      children: [
                        Icon(FontAwesomeIcons.clock),
                        SizedBox(
                          width: 10,
                        ),
                        Text(
                          '${this.duration} min',
                          style: TextStyle(
                              fontSize: 15,
                              color: Colors.black,
                              fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Icon(FontAwesomeIcons.briefcase),
                        SizedBox(
                          width: 10,
                        ),
                        Text(
                          '${complexityTitle}',
                          style: TextStyle(
                              fontSize: 15,
                              color: Colors.black,
                              fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Icon(Icons.attach_money),
                        SizedBox(
                          width: 5,
                        ),
                        Text(
                          '${affordabilityTitle}',
                          style: TextStyle(
                              fontSize: 15,
                              color: Colors.black,
                              fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
