import 'package:equatable/equatable.dart';

class UserRegisterInput extends Equatable {
  final String firstName;
  final String lastName;
  final String emailAddress;
  final String password;

  const UserRegisterInput(
      {required this.firstName,required this.lastName,required this.emailAddress,required this.password});

  @override
  List<Object?> get props => [firstName, lastName, emailAddress, password];
}
