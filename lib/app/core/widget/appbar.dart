import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:hotel_app/app/core/app_theme.dart';
import 'package:hotel_app/app/modules/navigation/controllers/navigation_controller.dart';

Widget getAppBarUI(BuildContext context) {
  final controller = Get.find<NavigationController>();
  return Container(
    decoration: BoxDecoration(
      color: HotelAppTheme.buildLightTheme().backgroundColor,
      boxShadow: <BoxShadow>[
        BoxShadow(
            color: Colors.grey.withOpacity(0.2),
            offset: const Offset(0, 2),
            blurRadius: 8.0),
      ],
    ),
    child: Padding(
      padding: EdgeInsets.only(
          top: MediaQuery.of(context).padding.top, left: 8, right: 8),
      child: Row(
        children: <Widget>[
          Container(
            alignment: Alignment.centerLeft,
            width: AppBar().preferredSize.height + 40,
            height: AppBar().preferredSize.height,
            child: Material(
              color: Colors.transparent,
              child: InkWell(
                borderRadius: const BorderRadius.all(
                  Radius.circular(32.0),
                ),
                onTap: () {
                  controller.openClosedSideMenu();
                },
                child: const Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Icon(Icons.menu),
                ),
              ),
            ),
          ),
          const Expanded(
            child: Center(
              child: Text(
                'Explore',
                style: TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: 22,
                ),
              ),
            ),
          ),
          SizedBox(
            width: AppBar().preferredSize.height + 40,
            height: AppBar().preferredSize.height,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.end,
              children: <Widget>[
                Material(
                  color: Colors.transparent,
                  child: InkWell(
                    borderRadius: const BorderRadius.all(
                      Radius.circular(32.0),
                    ),
                    onTap: () {},
                    child: const Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Icon(Icons.favorite_border),
                    ),
                  ),
                ),
                Material(
                  color: Colors.transparent,
                  child: InkWell(
                    borderRadius: const BorderRadius.all(
                      Radius.circular(32.0),
                    ),
                    onTap: () {},
                    child: const Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Icon(FontAwesomeIcons.locationDot),
                    ),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    ),
  );
}
