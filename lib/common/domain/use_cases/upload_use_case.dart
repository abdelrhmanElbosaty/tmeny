


import 'package:tmeny_flutter/common/domain/inputs/upload_input.dart';
import 'package:tmeny_flutter/common/domain/repositories/common_repository.dart';
import 'package:tmeny_flutter/common/utils/constants.dart';

class UploadFileUseCase {
  final CommonRepository _repository;

  UploadFileUseCase(this._repository);

  Future<String> execute(UploadInput input) async {

    final result = await _repository.uploadFile(input);
    if (result.startsWith(Constants.baseUrl)) {
      return result;
    } else {
      return result;
    }
  }
}
