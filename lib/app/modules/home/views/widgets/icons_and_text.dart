import 'package:flutter/cupertino.dart';
import 'package:hotel_app/app/modules/home/views/widgets/small_text.dart';

class IconsAndTextWidget extends StatelessWidget {
  final IconData icon;
  final String text;

  final Color iconColor;

  const IconsAndTextWidget(
      {Key? key,
      required this.icon,
      required this.text,
      required this.iconColor})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(
          icon,
          color: iconColor,
        ),
        const SizedBox(width: 5),
        SmallText(text: text),
      ],
    );
  }
}
