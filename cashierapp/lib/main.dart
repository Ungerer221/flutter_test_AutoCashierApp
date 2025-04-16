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
                    child: ProductPrice(),
                  ),

                  SizedBox(height: 20),

                  Container(
                    // container containing the TextField
                    width: 500,
                    child: AmountPaid(),
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

// statefull amount paid TextField widget
class AmountPaid extends StatefulWidget {
  const AmountPaid({
    super.key,
  });

  @override
  State<AmountPaid> createState() => _AmountPaidState();
}

class _AmountPaidState extends State<AmountPaid> {
  @override
  Widget build(BuildContext context) {
    return const TextField(
      // this textField need to update the amountPaid state
      decoration: InputDecoration(
        border: OutlineInputBorder(),
        hintText: 'Enter the amount paid with',
      ),
      keyboardType:
          TextInputType.number, // for numeric input only
    );
  }
}

// Created throguh "extraced widget from Ctrl + ." then converted the stateless widget toa statefull widght
// the Product Price needs to be a statefull widget as the user will be inputing a value
//the value of the input is the state
// "For example, if a widget has a counter that increments whenever the user taps a button, then the value of the counter is the state for that widget"
class ProductPrice extends StatefulWidget {
  const ProductPrice({super.key});

  @override
  State<ProductPrice> createState() => _ProductPriceState();
}

class _ProductPriceState extends State<ProductPrice> {
  // i think the logic goes in here



  @override
  Widget build(BuildContext context) {
    return const TextField(
      // this text field need to update the productPrice state
      decoration: InputDecoration(
        border: OutlineInputBorder(),
        hintText: 'Product Cost Price',
      ),
      keyboardType: TextInputType.number,
    );
  }
}
