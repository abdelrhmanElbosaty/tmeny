import 'package:equatable/equatable.dart';

class UserRegisterResult extends Equatable {
  final String id;
  final String firstName;
  final String lastName;

  const UserRegisterResult(this.id, this.firstName, this.lastName);

  @override
  List<Object?> get props => [id, firstName, lastName];
}
