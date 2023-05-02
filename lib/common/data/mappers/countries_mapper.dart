

import 'package:tmeny_flutter/common/data/models/countries/api_countries_result.dart';
import 'package:tmeny_flutter/common/domain/repositories/models/nationality_data_model.dart';

extension ConvertNationalitiesModelToApiData on ApiNationalitiesData {
  NationalitiesDataModel map() {
    return NationalitiesDataModel(
      id ?? '',
      arName ?? '',
      enName ?? '',
      isoCode ?? '',
      flagPng ?? '',
    );
  }
}
