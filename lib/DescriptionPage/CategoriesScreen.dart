import 'package:flutter/material.dart';
import 'package:sampleproject/Database/Meal.dart';
import 'package:sampleproject/Database/dummy_data.dart';
import 'package:sampleproject/DescriptionPage/CategoriesItem.dart';

class ItemsScreen extends StatefulWidget {
  static const routeName = '/ItemScreen';

  @override
  State<ItemsScreen> createState() => _ItemsScreenState();
}

class _ItemsScreenState extends State<ItemsScreen> {
  late List<Meal> getInfById;

  @override
  void didChangeDependencies() {
    var getInf =
        ModalRoute.of(context)!.settings.arguments as Map<String, String>;

    String Id = getInf['id'] as String;

    getInfById = DUMMY_MEALS.where(((element) {
      return element.categories.contains(Id);
    })).toList();

    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Categories Page',
          style: Theme.of(context).textTheme.bodyText1,
        ),
        centerTitle: true,
      ),
      body: ListView.builder(
        physics: BouncingScrollPhysics(),
        itemBuilder: ((context, index) {
          return CategoriesItem(
            title: getInfById[index].title,
            imageUrl: getInfById[index].imageUrl,
            duration: getInfById[index].duration,
            complexity: getInfById[index].complexity,
            affordability: getInfById[index].affordability,
            id: getInfById[index].id,
          );
        }),
        itemCount: getInfById.length,
      ),
    );
  }
}
