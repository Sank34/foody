import 'package:collection/collection.dart';
import 'package:flutter/cupertino.dart';
import 'package:foody/models/cart_item.dart';
import 'package:foody/models/food.dart';
import 'package:intl/intl.dart';

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
        Addon(name: 'Super Cheese!', price: 0.99),
        Addon(name: 'Super Onions!', price: 0.99),
        Addon(name: 'Super Salad!', price: 0.99),
      ],
    ),

    //desserts
    Food(
      name: 'Oreo Ice Cream',
      description: 'Super tasty oreo ice cream!',
      imagePath: 'lib/images/desserts/oreo_ice_cream.png',
      price: 10.99,
      category: FoodCategory.desserts,
      availableAddons: [
        Addon(name: 'Super Sprinkles!', price: 0.99),
        Addon(name: 'Super Oreos!', price: 0.99),
        Addon(name: 'Super Chocolate!', price: 0.99),
      ],
    ),
  ];
  /*
    GETTERS METHODS
   */
  List<Food> get menu => _menu; //return menu list
  List<CartItem> get cart => _cart;

  /*
    OPERATIONS
   */
  // variables
  List<CartItem> _cart = [];
  // add to cart
  void addToCart(Food food, List<Addon> selectedAddons) {
    // check cart item
    CartItem? cartItem = _cart.firstWhereOrNull((item) {
      // check if food items are the same
      bool isFood = item.food == food;
      bool isAddon = ListEquality().equals(item.selectedAddons, selectedAddons);

      return isFood && isAddon;
    });

    if (cartItem != null) {
      cartItem.quantity++;
    } else {
      _cart.add(CartItem(food: food, selectedAddons: selectedAddons));
    }
    notifyListeners();
  }

  // remove from cart
  void removeFromCart(CartItem cartItem) {
    int cartIndex = _cart.indexOf(cartItem);

    if (cartIndex != -1) {
      if (_cart[cartIndex].quantity > 1) {
        _cart[cartIndex].quantity--;
      } else {
        _cart.remove(cartIndex);
      }
    }
    notifyListeners();
  }

  // get total price cart
  double getTotalPrice() {
    double total = 0.0;

    for (CartItem cartItem in _cart) {
      double itemTotal = cartItem.food.price;

      for (Addon addon in cartItem.selectedAddons) {
        itemTotal += addon.price;
      }

      total += itemTotal * cartItem.quantity;
    }

    return total;
  }

  // get total number of items cart
  int getTotalItemCount() {
    int total = 0;
    for (CartItem cartItem in _cart) {
      total += cartItem.quantity;
    }

    return total;
  }

  // reset cart
  void clearCart() {
    _cart.clear();
    notifyListeners();
  }

  /*
    HELPER METHODS
   */

  // generate receipt
  String displayCartReceipt() {
    final receipt = StringBuffer();
    receipt.write("Here's Your Receipt.");
    receipt.writeln();

    //format the date => 2 seconds only
    String formattedDate = DateFormat(
      'yyyy-MM-dd HH:mm:ss',
    ).format(DateTime.now());

    receipt.writeln(formattedDate);
    receipt.writeln();
    receipt.writeln('------');

    for (final cartItem in _cart) {
      receipt.writeln(
        '${cartItem.quantity} x ${cartItem.food.name} - ${_formatPrice(cartItem.food.price)}',
      );
      if (cartItem.selectedAddons.isNotEmpty) {
        receipt.writeln(
          "   Add-ons: ${_formatAddons(cartItem.selectedAddons)}",
        );
      }
      receipt.writeln();
    }

    receipt.writeln('------');
    receipt.writeln();
    receipt.writeln('Total Items: ${getTotalItemCount()}');
    receipt.writeln('Total Price: ${_formatPrice(getTotalPrice())}');

    return receipt.toString();
  }

  // format double value into money
  String _formatPrice(double price) {
    return "\$${price.toStringAsFixed(2)}";
  }

  // format list of addons into a string summary
  String _formatAddons(List<Addon> addons) {
    return addons
        .map((addon) => "${addon.name} (${_formatPrice(addon.price)})")
        .join(", ");
  }
}
