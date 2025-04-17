import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../cubit/cashier_cubit.dart';
import '../cubit/cashier_state.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      //root widget
      home: Scaffold(
        appBar: AppBar(title: const Text('My new Cashier App')),
        body: Center(
          child: BlocBuilder<SimpleCalcCubit, SimpleCalcState>(
            builder: (context, state) {
              return Column(
                children: [
                  const Text("Auto Cashier at your service"),
                  const SizedBox(height: 20),
                  Text('Please enter your values'),

                  const SizedBox(height: 20),

                  Container(
                    // container containing the TextField
                    width: 500,
                    child: TextField(
                      decoration: const InputDecoration(
                        labelText: 'ProductPrice (R)',
                      ),
                      keyboardType: TextInputType.number,
                      onChanged: (value) {
                        final price = double.tryParse(value) ?? 0.0;
                        context.read<SimpleCalcCubit>().updateProductPrice(
                          price,
                        ); // Fixed
                      },
                    ),
                  ),

                  const SizedBox(height: 20),

                  Container(
                    // container containing the TextField
                    width: 500,
                    child: TextField(
                      decoration: const InputDecoration(
                        labelText: 'Amount Paid (R)',
                      ),
                      keyboardType: TextInputType.number,
                      onChanged: (value) {
                        final amount = double.tryParse(value) ?? 0.00;
                        context.read<SimpleCalcCubit>().updateAmountPaid(
                          amount,
                        );
                      },
                    ),
                  ),

                  SizedBox(height: 20),

                  if (state.changeAmount > 0) ...[
                    Text(
                      'Change Due: R${state.changeAmount.toStringAsFixed(2)}',
                    ),
                    const SizedBox(height: 16),
                    const Text('Breakdown:'),
                    ...state.changeBreakdown.entries.map(
                      (entry) => Text('${entry.value} x ${entry.key}'),
                    ),
                  ],
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}
