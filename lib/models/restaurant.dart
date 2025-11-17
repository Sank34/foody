import 'package:flutter/cupertino.dart';
import 'package:foody/models/food.dart';

class Restaurant extends ChangeNotifier {

  //list of food menu
  final List<Food> _menu = [
    //burgers
    Food(
      name: 'Big Tasty',
      description: 'Super tasty hamburber!',
      imagePath: 'lib/images/burgers/big_tasty.png',
      price: 10.99,
      category: FoodCategory.hamburber,
      availableAddons: [
        Addon(
          name: 'Super Cheese!',
          price: 0.99
        ),
        Addon(
            name: 'Super Onions!',
            price: 0.99
        ),
        Addon(
            name: 'Super Salad!',
            price: 0.99
        ),
      ]
    ),

    //desserts
    Food(
        name: 'Oreo Ice Cream',
        description: 'Super tasty oreo ice cream!',
        imagePath: 'lib/images/desserts/oreo_ice_cream.png',
        price: 10.99,
        category: FoodCategory.desserts,
        availableAddons: [
          Addon(
              name: 'Super Sprinkles!',
              price: 0.99
          ),
          Addon(
              name: 'Super Oreos!',
              price: 0.99
          ),
          Addon(
              name: 'Super Chocolate!',
              price: 0.99
          ),
        ]
    )
  ];
  /*
    GETTERS METHODS
   */
  List<Food> get menu => _menu; //return menu list


  /*
    OPERATIONS
   */
  // add to cart

  // remove from cart

  // get total price cart

  // get total number of items cart

  // reset cart


  /*
    HELPER METHODS
   */

  // generate receipt

  // format double value into money

  // format list of addons into a string summary
}