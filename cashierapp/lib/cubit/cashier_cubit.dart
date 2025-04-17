import 'package:flutter_bloc/flutter_bloc.dart';
import 'cashier_state.dart';

class SimpleCalcCubit extends Cubit<SimpleCalcState> {
  SimpleCalcCubit() : super(const SimpleCalcState());

  void updateProductPrice(double price) {
    // the copyWith is a design pattern used to create modified copies of immutable objects
    emit(state.copyWith(productPrice: price));
    _calculateChange();
  }

  void updateAmountPaid(double amount) {
    emit(state.copyWith(amountPaid: amount));
    _calculateChange();
  }

  void _calculateChange() {
    double change = state.changeAmount;
    // a simple if loop
    if (change <= 0) {
      emit(state.copyWith(changeBreakdown: {}));
      return;
    }

    final denominations = [
      {'value':200.0, 'name':'R200'},
      {'value': 100.0,'name':'R100'},
      {'value': 50.0, 'name': 'R50'},
      {'value': 20.0, 'name': 'R20'},
      {'value': 10.0, 'name': 'R10'},
      {'value': 5.0, 'name': 'R5'},
      {'value': 2.0, 'name': 'R2'},
      {'value': 1.0, 'name': 'R1'},
      {'value': 0.5, 'name': '50c'},
    ];

    Map<String, int> breakdown = {};
    double remaining = change;

    for (var denom in denominations) {
      if (remaining <= 0) break;
      final double value = denom['value'] as double;
      final String name = denom['name'] as String;
      final int count = (remaining / value).floor();
      
      if (count > 0) {
      breakdown[name] = count;  // Correct map assignment
      remaining -= count * value;
      remaining = double.parse(remaining.toStringAsFixed(2)); // Ensure 2 decimal places
    }
  }

  emit(state.copyWith(changeBreakdown: breakdown));
  }
}
