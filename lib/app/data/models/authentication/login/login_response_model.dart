class LoginResponseModel {
  LoginResponseModel({
    this.message,
    this.created,
    this.jwtKey,
  });

  bool? created;
  String? jwtKey;
  String? message;

  factory LoginResponseModel.fromJson(Map<String, dynamic> json) =>
      LoginResponseModel(
        message: json["message"] ?? "",
        created: json["created"] ?? false,
        jwtKey: json["jwt_key"] ?? "",
      );

  Map<String, dynamic> toJson() => {
        "created": created,
        "jwt_key": jwtKey,
      };
}
