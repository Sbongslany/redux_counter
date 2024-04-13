import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart'; // Importing Flutter Redux for integrating Redux with Flutter
import 'package:redux/redux.dart'; // Importing Redux for managing application state
import '../core/redux.dart'; // Importing the Redux store and related logic

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size; // Getting the size of the screen

    return Scaffold(
      appBar: AppBar(
        title: const Text('Redux Counter'), // Setting the title of the app bar
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.only(left: 20, right: 20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[

              // StoreConnector connects the Redux store with a widget and rebuilds it when the state changes
              StoreConnector<int, String>(
                converter: (store) => store.state.toString(), // Converting the state to a string to display
                builder: (context, count) {
                  return Card(
                    child: Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: Text(
                        count, // Displaying the current count
                        style: const TextStyle(fontSize: 100.0),
                      ),
                    ),
                  );
                },
              ),

              // Column containing the buttons to increment and decrement the counter
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    width: screenSize.width,
                    height: 60,
                    child: ElevatedButton(
                      onPressed: () {
                        store.dispatch(ActionType.increment); // Dispatching an increment action when the button is pressed
                      },
                      child: const Icon(
                        Icons.add,
                        size: 60,
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                  SizedBox(
                    width: screenSize.width,
                    height: 60,
                    child: ElevatedButton(
                      onPressed: () {
                        store.dispatch(ActionType.decrement); // Dispatching a decrement action when the button is pressed
                      },
                      child: const Icon(
                        Icons.remove,
                        size: 60,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
