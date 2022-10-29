class LoginModel {
  LoginModel({
    this.username,
    this.password,
  });

  String? username;
  String? password;

  Map<String, dynamic> toJson() => {
        "username": username,
        "password": password,
      };
}
