import 'package:flutter/material.dart';
import 'package:hotel_app/app/core/widget/app_text.dart';

class ResponsiveButton extends StatelessWidget {
  bool? isResponsive;
  double? width;
  String? text;
  IconData? icon;
  ResponsiveButton(
      {Key? key,
      this.width = 120,
      this.isResponsive = false,
      this.text,
      this.icon})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Flexible(
      child: Container(
        width: isResponsive == true ? double.maxFinite : width,
        height: 60,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: Colors.blue,
        ),
        child: Row(
          mainAxisAlignment: isResponsive == true
              ? MainAxisAlignment.center
              : MainAxisAlignment.spaceEvenly,
          children: [
            isResponsive == true
                ? AppText(
                    text: text ?? '',
                    color: Colors.white,
                    size: 18,
                  )
                : Container(),
            Icon(icon, color: Colors.white),
          ],
        ),
      ),
    );
  }
}
