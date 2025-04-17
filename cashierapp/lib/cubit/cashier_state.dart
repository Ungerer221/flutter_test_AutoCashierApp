import 'package:equatable/equatable.dart';

// creating a class that extends equatable
// this allows easy state comparison
class SimpleCalcState extends Equatable {
  // properties (data Storage)
  // declaring three immutable properties
  // [double] is a datatype that represetns a decimal number 
  // [final] means that the variable can only be set once 
  final double productPrice;
  final double amountPaid;
  final Map<String, int> changeBreakdown;

  // the constructor
  // sets the defualt values if none are provided
  // the [const] is there to optimize performance by making the object a compile-time contant
  const SimpleCalcState({
    this.productPrice = 26.50,
    this.amountPaid = 100.00,
    this.changeBreakdown = const {},
  });

  double get changeAmount => amountPaid - productPrice;

  SimpleCalcState copyWith({
    double? productPrice,
    double? amountPaid,
    Map<String, int>? changeBreakdown,
  }) {
    return SimpleCalcState(
      // ?? - means if-null
      // this is the if null catching
      productPrice: productPrice ?? this.productPrice,
      // (line below) so basically if the amount paid is null the use the this.amountPaid init value
      amountPaid: amountPaid ?? this.amountPaid,
      changeBreakdown: changeBreakdown ?? this.changeBreakdown,
    );
  }

  @override
  // TODO: implement props
  List<Object?> get props => [productPrice, amountPaid, changeBreakdown]; // the Object? is variable null safty
}
