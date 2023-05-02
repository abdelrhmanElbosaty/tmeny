class UploadInput {
  final String fileUrl;
  final UploadFileModel model;

  UploadInput(this.fileUrl, this.model);
}

enum UploadFileModel {
  consultantAttachments
}
