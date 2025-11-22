import 'package:flutter/material.dart';
import 'package:foody/components/cart_tile.dart';
import 'package:foody/models/restaurant.dart';
import 'package:foody/pages/payment_page.dart';
import 'package:provider/provider.dart';

import '../components/button.dart';

class CartPage extends StatelessWidget {
  const CartPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<Restaurant>(
      builder: (context, restaurant, child) {
        final userCart = restaurant.cart;

        //scaffold
        return Scaffold(
          appBar: AppBar(
            title: Text("Cart"),
            backgroundColor: Colors.transparent,
            foregroundColor: Theme.of(context).colorScheme.inversePrimary,
            actions: [
              //clear cart
              IconButton(
                onPressed: () {
                  showDialog(
                    context: context,
                    builder: (context) => AlertDialog(
                      title: Text("Are you sure you want to clear your cart?"),
                      actions: [
                        //cancel button
                        TextButton(
                          onPressed: () {
                            //pop navigator
                            Navigator.pop(context);
                          },
                          child: Text('Cancel'),
                        ),
                        //confirm button
                        TextButton(
                          onPressed: () {
                            //confirm
                            Navigator.pop(context);
                            restaurant.clearCart();
                          },
                          child: Text('Confirm'),
                        ),
                      ],
                    ),
                  );
                },
                icon: Icon(Icons.delete),
              ),
            ],
          ),
          body: Column(
            children: [
              // list of cart
              Expanded(
                child: Column(
                  children: [
                    userCart.isEmpty
                        ? Expanded(
                            child: Center(
                              child: Text(
                                'Cart is empty...',
                                style: TextStyle(
                                  fontSize: 30,
                                  color: Theme.of(context).colorScheme.primary,
                                ),
                              ),
                            ),
                          )
                        : Expanded(
                            child: ListView.builder(
                              itemBuilder: (context, index) {
                                final cartItem = userCart[index];
                                return CartTile(cartItem: cartItem);
                              },
                              itemCount: userCart.length,
                            ),
                          ),
                  ],
                ),
              ),

              // checkout button
              CustomButton(
                onTap: () => Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => PaymentPage()),
                ),
                text: 'Checkout',
              ),
              const SizedBox(height: 25),
            ],
          ),
        );
      },
    );
  }
}
