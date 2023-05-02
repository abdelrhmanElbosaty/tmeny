import 'package:equatable/equatable.dart';

class PaymentMethod extends Equatable {
  final String name;
  final String imageAsset;
  final String iBan;
  final String accountNumber;

  const PaymentMethod(this.name, this.imageAsset, this.iBan, this.accountNumber);

  @override
  List<Object?> get props => [name, imageAsset, iBan, accountNumber];
}