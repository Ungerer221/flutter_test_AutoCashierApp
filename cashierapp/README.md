# cashierapp

A new Flutter project.

# Code Dump

## From teh main.dart

```
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
```