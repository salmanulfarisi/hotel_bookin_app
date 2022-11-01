import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hotel_app/app/core/app_theme.dart';
import 'package:hotel_app/app/data/models/model.dart';
import 'package:hotel_app/app/modules/home/controllers/home_controller.dart';
import 'package:hotel_app/app/modules/home/views/widgets/hotel_listview.dart';
import 'package:hotel_app/app/modules/home/views/widgets/searchbar.dart';

import '../controllers/search_page_controller.dart';

class SearchPageView extends GetView<SearchPageController> {
  const SearchPageView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    List<HotelListData> hotelList = HotelListData.hotelList;
    final controller = Get.put(HomeController());
    return Theme(
      data: HotelAppTheme.buildLightTheme(),
      child: SafeArea(
        child: Scaffold(
          appBar: AppBar(),
          body: Stack(
            children: [
              InkWell(
                splashColor: Colors.transparent,
                focusColor: Colors.transparent,
                highlightColor: Colors.transparent,
                hoverColor: Colors.transparent,
                onTap: () {
                  FocusScope.of(context).requestFocus(FocusNode());
                },
                child: Column(
                  children: [
                    Expanded(
                      child: NestedScrollView(
                        controller: controller.scrollController,
                        headerSliverBuilder:
                            (context, bool innerBoxIsScrolled) {
                          return [
                            SliverList(
                              delegate: SliverChildBuilderDelegate(
                                (context, index) {
                                  return Column(
                                    children: [
                                      getSearchBarUI(context),
                                    ],
                                  );
                                },
                                childCount: 1,
                              ),
                            ),
                            // SliverPersistentHeader(
                            //     pinned: true,
                            //     floating: true,
                            //     delegate: ContestTabHeader(
                            //         getFilterBarUI(context))),
                          ];
                        },
                        body: Container(
                          color:
                              HotelAppTheme.buildLightTheme().backgroundColor,
                          child: ListView.builder(
                            itemCount: hotelList.length,
                            padding: const EdgeInsets.only(top: 8),
                            scrollDirection: Axis.vertical,
                            itemBuilder: (BuildContext context, int index) {
                              final int count =
                                  hotelList.length > 10 ? 10 : hotelList.length;
                              final Animation<double> animation = Tween<double>(
                                      begin: 0.0, end: 1.0)
                                  .animate(CurvedAnimation(
                                      parent: controller.animationController,
                                      curve: Interval((1 / count) * index, 1.0,
                                          curve: Curves.fastOutSlowIn)));
                              controller.animationController.forward();
                              return HotelListView(
                                callback: () {},
                                hotelData: hotelList[index],
                                animation: animation,
                                animationController:
                                    controller.animationController,
                              );
                            },
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class ContestTabHeader extends SliverPersistentHeaderDelegate {
  ContestTabHeader(
    this.searchUI,
  );
  final Widget searchUI;

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return searchUI;
  }

  @override
  double get maxExtent => 52.0;

  @override
  double get minExtent => 52.0;

  @override
  bool shouldRebuild(SliverPersistentHeaderDelegate oldDelegate) {
    return false;
  }
}
