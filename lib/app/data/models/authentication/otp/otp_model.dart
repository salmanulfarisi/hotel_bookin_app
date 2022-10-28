class OtpModel {
  OtpModel({
    this.otp,
    this.hash,
  });

  final String? otp;
  final String? hash;

  factory OtpModel.fromJson(Map<String, dynamic> json) => OtpModel(
        otp: json["otp"],
        hash: json["hash"],
      );

  Map<String, dynamic> toJson() => {
        "otp": otp,
        "hash": hash,
      };
}
