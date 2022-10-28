class PhoneNumberResponseModel {
  PhoneNumberResponseModel({
    this.success,
    this.hash,
    this.message,
  });

  final bool? success;
  String? hash;
  final String? message;

  factory PhoneNumberResponseModel.fromJson(Map<String, dynamic> json) =>
      PhoneNumberResponseModel(
        success: json["success"] ?? false,
        hash: json["hash"] ?? "",
        message: json["message"] ?? "",
      );
}
