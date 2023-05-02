import 'package:equatable/equatable.dart';

class UserUpdatePasswordInput extends Equatable {
  final String email;
  final String newPassword;
  final String confirmPassword;
  final String code;

  const UserUpdatePasswordInput(
      {required this.email,
      required this.newPassword,
      required this.confirmPassword,
      required this.code});

  @override
  List<Object?> get props => [email, newPassword, confirmPassword, code];
}
