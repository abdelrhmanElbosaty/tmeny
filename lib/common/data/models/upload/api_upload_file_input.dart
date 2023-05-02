// ignore: depend_on_referenced_packages
import 'package:http/http.dart' show MultipartFile;
// ignore: depend_on_referenced_packages
import 'package:json_annotation/json_annotation.dart';

part 'api_upload_file_input.g.dart';

@JsonSerializable()
class ApiUploadFileInput {
  @MultipartJsonConverter()
  final MultipartFile file;

  final FileModelEnum model;

  factory ApiUploadFileInput.fromJson(Map<String, dynamic> json) =>
      _$ApiUploadFileInputFromJson(json);

  ApiUploadFileInput(this.file, this.model);

  Map<String, dynamic> toJson() => _$ApiUploadFileInputToJson(this);
}

enum FileModelEnum {
  CONSULTANT_ATTACHMENTS,
}

class MultipartJsonConverter implements JsonConverter<MultipartFile, dynamic> {
  const MultipartJsonConverter();

  @override
  MultipartFile fromJson(json) {
    throw "";
  }

  @override
  toJson(MultipartFile object) {
    return object;
  }
}
