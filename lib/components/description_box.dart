import 'package:flutter/material.dart';

class DescriptionBox extends StatelessWidget {
  const DescriptionBox({super.key});

  @override
  Widget build(BuildContext context) {

    // textstyle
    var PrimaryTextStyle = TextStyle(
      color: Theme.of(context).colorScheme.inversePrimary
    );
    var SecondaryTextStyle = TextStyle(
        color: Theme.of(context).colorScheme.primary
    );
    return Container(
      padding: EdgeInsets.all(25.0),
      margin: EdgeInsets.only(left:25, right: 25, bottom: 25),
      decoration: BoxDecoration(
        border: Border.all(
          color: Theme.of(context).colorScheme.secondary
        ),
        borderRadius: BorderRadius.circular(8)
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          //delivery fee
          Column(
            children: [
              Text('\$0.99', style: PrimaryTextStyle,),
              Text('Delivery fee', style: SecondaryTextStyle,)
            ],
          ),
          //delivery time
          Column(
            children: [
              Text('15-30 min', style: PrimaryTextStyle,),
              Text('Delivery time', style: SecondaryTextStyle,)
            ],
          )
        ],
      ),
    );
  }
}
