import 'package:flutter/material.dart';
import 'package:foody/components/current_location.dart';
import 'package:foody/components/description_box.dart';
import 'package:foody/components/home_drawer.dart';
import 'package:foody/components/sliver_app_bar.dart';
import 'package:foody/components/tab_bar.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with SingleTickerProviderStateMixin {

  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
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
                Divider(indent: 25,
                  endIndent: 25,
                  color: Theme.of(context).colorScheme.secondary,
                ),
                // my current location
                const CurrentLocation(),
                // description box
                const DescriptionBox()
              ],
            )
        )],
        body: TabBarView(
          controller: _tabController,
          children: [
            ListView.builder(
              itemCount: 5,
              itemBuilder: (context, index) => Text("first tab items")
            ),
            ListView.builder(
                itemCount: 5,
                itemBuilder: (context, index) => Text("second tab items")
            ),
            ListView.builder(
                itemCount: 5,
                itemBuilder: (context, index) => Text("third tab items")
            ),
          ],
        ),
      ),
    );
  }
}
