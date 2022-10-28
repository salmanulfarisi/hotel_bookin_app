class PhoneNumberModel {
  PhoneNumberModel({
    this.phoneNumber,
  });

  final String? phoneNumber;

  factory PhoneNumberModel.fromJson(Map<String, dynamic> json) =>
      PhoneNumberModel(
        phoneNumber: json["phone_number"],
      );

  Map<String, dynamic> toJson() => {
        "phone_number": phoneNumber,
      };
}
