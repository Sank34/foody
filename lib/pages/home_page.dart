import 'package:flutter/material.dart';
import 'package:foody/components/current_location.dart';
import 'package:foody/components/description_box.dart';
import 'package:foody/components/home_drawer.dart';
import 'package:foody/components/sliver_app_bar.dart';
import 'package:foody/components/tab_bar.dart';
import 'package:foody/models/food.dart';
import 'package:foody/models/restaurant.dart';
import 'package:provider/provider.dart';

import '../components/food_tile.dart';
import 'food_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  //sort food items by category
  List<Food> _filterMenuByCategory(FoodCategory category, List<Food> fullMenu) {
    return fullMenu.where((food) => food.category == category).toList();
  }

  //return list of foods in a specific category
  List<Widget> getFoodInCateg(List<Food> fullMenu) {
    return FoodCategory.values.map((category) {
      //get category menu
      List<Food> categoryMenu = _filterMenuByCategory(category, fullMenu);
      return ListView.builder(
        padding: EdgeInsets.all(0),
        itemCount: categoryMenu.length,
        physics: const NeverScrollableScrollPhysics(),
        itemBuilder: (context, index) {
          // get each food
          final food = categoryMenu[index];
          return FoodTile(
            food: food,
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => FoodPage(food: food)),
              );
            },
          );
        },
      );
    }).toList();
  }

  @override
  void initState() {
    super.initState();
    _tabController = TabController(
      length: FoodCategory.values.length,
      vsync: this,
    );
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: HomeDrawer(),
      body: NestedScrollView(
        headerSliverBuilder: (context, innerBoxIsScrolled) => [
          HomeSliverAppBar(
            title: HomeTabBar(tabController: _tabController),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Divider(
                  indent: 25,
                  endIndent: 25,
                  color: Theme.of(context).colorScheme.secondary,
                ),
                // my current location
                CurrentLocation(),
                // description box
                const DescriptionBox(),
              ],
            ),
          ),
        ],
        body: Consumer<Restaurant>(
          builder: (context, restaurant, child) => TabBarView(
            controller: _tabController,
            children: getFoodInCateg(restaurant.menu),
          ),
        ),
      ),
    );
  }
}
