import 'package:flutter/material.dart';
import 'package:otp_text_field/otp_text_field.dart';
import 'package:otp_text_field/style.dart';

Widget otpField(BuildContext context) {
  return OTPTextField(
    length: 6,
    width: MediaQuery.of(context).size.width - 30,
    fieldWidth: 58,
    otpFieldStyle: OtpFieldStyle(
      backgroundColor: const Color(0xff1d1d1d),
      borderColor: Colors.white,
    ),
    style: const TextStyle(fontSize: 17, color: Colors.white),
    textFieldAlignment: MainAxisAlignment.spaceAround,
    fieldStyle: FieldStyle.underline,
    onCompleted: (pin) {
      print("Completed: $pin");
      // setState(() {
      //   smsCode = pin;
      // });
    },
  );
}
