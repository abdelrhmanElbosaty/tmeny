import 'package:equatable/equatable.dart';

class NationalitiesDataModel extends Equatable {
  final String id;
  final String arName;
  final String enName;
  final String isoCode;
  final String flagPng;

  const NationalitiesDataModel(
      this.id, this.arName, this.enName, this.isoCode, this.flagPng);

  @override
  List<Object?> get props => [
        id,
        arName,
        enName,
        isoCode,
        flagPng,
      ];
}
