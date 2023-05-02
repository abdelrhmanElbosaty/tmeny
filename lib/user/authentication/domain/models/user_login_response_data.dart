import 'package:equatable/equatable.dart';
import 'package:tmeny_flutter/common/domain/models/token.dart';
import 'package:tmeny_flutter/data/preferences/models/cached_user_data.dart';

class LoginResponseData extends Equatable {
  final String id;
  final String email;
  final Token token;

  const LoginResponseData(
    this.id,
    this.email,
    this.token,
  );

  CachedUserData toCachedUserData() {
    return CachedUserData( id: id,token: token);
  }

  @override
  List<Object?> get props => [
        id,
        email,
        token,
      ];
}
