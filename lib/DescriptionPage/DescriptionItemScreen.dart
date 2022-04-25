import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:sampleproject/Database/dummy_data.dart';

import '../Database/Meal.dart';

class DescriptionItemScreen extends StatefulWidget {
  static const routeName = '/DescriptionItemScreen';
  final Function addFavoriteMeals;
  final isFavoriteMeal;
  DescriptionItemScreen(
      {required this.addFavoriteMeals, required this.isFavoriteMeal});

  @override
  State<DescriptionItemScreen> createState() => _DescriptionItemScreenState();
}

class _DescriptionItemScreenState extends State<DescriptionItemScreen> {
  late Meal getInfById;
  late String Id;
  @override
  void didChangeDependencies() {
    var getInf =
        ModalRoute.of(context)!.settings.arguments as Map<String, String>;
    Id = getInf['id'] as String;
    getInfById = DUMMY_MEALS.firstWhere((element) {
      return element.id == Id;
    });
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        floatingActionButton: FloatingActionButton(
          onPressed: () => widget.addFavoriteMeals(Id),
          child: Icon(
            widget.isFavoriteMeal(Id) ? Icons.star : Icons.star_border,
          ),
        ),
        appBar: AppBar(
          title: Text(
            '${getInfById.title}',
            style: Theme.of(context).textTheme.bodyText1,
          ),
          centerTitle: true,
        ),
        body: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          child: Column(
            children: [
              Image.network(
                getInfById.imageUrl,
                fit: BoxFit.cover,
              ),
              SizedBox(
                height: 20,
              ),
              Text(
                'Ingredients',
                style: Theme.of(context).textTheme.headline1,
              ),
              SizedBox(
                width: 200,
                child: Divider(
                  color: Colors.black54,
                  thickness: 1.5,
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Container(
                height: 150,
                width: 300,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: Colors.white,
                ),
                child: ListView.builder(
                  physics: BouncingScrollPhysics(),
                  itemBuilder: ((context, index) {
                    return Container(
                      padding: EdgeInsets.all(10),
                      margin: EdgeInsets.all(5),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.orange),
                      child: Text(
                        getInfById.ingredients[index],
                        style: Theme.of(context).textTheme.headline3,
                      ),
                    );
                  }),
                  itemCount: getInfById.ingredients.length,
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Text(
                'Steps',
                style: Theme.of(context).textTheme.headline1,
              ),
              SizedBox(
                width: 200,
                child: Divider(
                  color: Colors.black54,
                  thickness: 1.5,
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Container(
                width: 300,
                height: 150,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: Colors.white,
                ),
                child: ListView.builder(
                  physics: BouncingScrollPhysics(),
                  itemBuilder: ((context, index) {
                    return ListTile(
                      leading: CircleAvatar(
                        backgroundColor: Colors.pink,
                        child: Text(
                          '#${index + 1}',
                          style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      title: Text(
                        getInfById.title,
                        style: Theme.of(context).textTheme.headline3,
                      ),
                    );
                  }),
                  itemCount: getInfById.steps.length,
                ),
              ),
            ],
          ),
        ));
  }
}
