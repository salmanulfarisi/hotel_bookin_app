class SignupModel {
  SignupModel({
    this.name,
    this.phone,
    this.email,
    this.password,
  });

  String? name;
  String? phone;
  String? email;
  String? password;

  Map<String, dynamic> toJson() => {
        "name": name,
        "phone": phone,
        "email": email,
        "password": password,
      };
}
