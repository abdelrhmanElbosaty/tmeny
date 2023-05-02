import 'package:equatable/equatable.dart';
import 'package:tmeny_flutter/common/domain/models/token.dart';

class CachedUserData extends Equatable {
  final String id;
  final Token token;

  const CachedUserData({required this.id,required this.token});

  @override
  List<Object?> get props => [id, token];
}
