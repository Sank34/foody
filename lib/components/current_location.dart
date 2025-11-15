import 'package:flutter/material.dart';

class CurrentLocation extends StatelessWidget {
  const CurrentLocation({super.key});

  void openDiag(BuildContext context) {
      showDialog(
          context: context,
          builder: (context) => AlertDialog(
              title: Text('Your Location'),
            content: TextField(
              decoration: InputDecoration(
                hintText: "Search for your address.."
              ),
            ),
            actions: [
              MaterialButton(
                onPressed: () => Navigator.pop(context),
                child: const Text('Cancel'),
              ),
              MaterialButton(
                onPressed: () => Navigator.pop(context),
                child: const Text('Save'),
              )
            ],
          )
      );
  }
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(25.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
              "Deliver now",
              style: TextStyle(
                color: Theme.of(context).colorScheme.primary
              ),
          ),
          GestureDetector(
            onTap: () => openDiag(context),
            child: Row(
              children: [
                //address
                Text(
                    "404 New York Avenue",
                    style: TextStyle(
                      color: Theme.of(context).colorScheme.inversePrimary,
                      fontWeight: FontWeight.bold
                    ),
                ),
                //drop down menu
                Icon(Icons.keyboard_arrow_down_rounded),
              ],
            ),
          )
        ],
      ),
    );
  }
}
