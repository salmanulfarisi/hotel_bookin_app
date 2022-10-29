class SignupResponseModel {
  SignupResponseModel({
    this.created,
    this.jwtKey,
    this.message,
  });

  bool? created;
  String? jwtKey;
  String? message;

  factory SignupResponseModel.fromJson(Map<String, dynamic> json) =>
      SignupResponseModel(
        message: json["message"] ?? "",
        created: json["created"],
        jwtKey: json["jwt_key"],
      );
}
