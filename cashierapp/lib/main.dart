import 'package:flutter/material.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      //root widget
      home: Scaffold(
        appBar: AppBar(title: const Text('My new Cashier App')),
        body: Center(
          child: Builder(
            builder: (context) {
              return Column(
                children: [
                  const Text("Auto Cashier at your service"),
                  const SizedBox(height: 20),
                  Text('Please enter your values'),

                  SizedBox(height: 20),

                  Container(
                    // container containing the TextField
                    width: 500,
                    child: const TextField(
                      // this text field need to update the productPrice state
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        hintText: 'Product Cost Price',
                      ),
                      keyboardType: TextInputType.number,
                    ),
                  ),

                  SizedBox(height: 20),

                  Container(
                    // container containing the TextField
                    width: 500,
                    child: const TextField(
                      // this textField need to update the amountPaid state
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        hintText: 'Enter the amount paid with',
                      ),
                    keyboardType: TextInputType.number, // for numeric input only
                    ),
                  ),

                  SizedBox(height: 20),

                  ElevatedButton(
                    onPressed: () {
                      print('Button Clicked');
                    },
                    child: const Text('A Button'),
                  ),
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}
