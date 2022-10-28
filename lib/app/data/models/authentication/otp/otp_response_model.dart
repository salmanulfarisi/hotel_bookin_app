class OtpResponseModel {
  OtpResponseModel({
    this.created,
    this.phone,
    this.message,
  });

  final bool? created;
  final String? phone;
  final String? message;

  factory OtpResponseModel.fromJson(Map<String, dynamic> json) =>
      OtpResponseModel(
        created: json["created"] ?? false,
        phone: json["phone"] ?? '',
        message: json["message"] ?? '',
      );
}
