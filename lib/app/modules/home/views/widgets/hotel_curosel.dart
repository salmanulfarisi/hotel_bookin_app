import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hotel_app/app/modules/home/controllers/home_controller.dart';

class SliderWidget extends StatefulWidget {
  const SliderWidget({Key? key}) : super(key: key);

  @override
  State<SliderWidget> createState() => _SliderWidgetState();
}

class _SliderWidgetState extends State<SliderWidget> {
  final mainPageController = Get.put(HomeController());
  PageController pageController = PageController(viewportFraction: 0.85);
  var currentPageValue = 0.0;
  double scaleFactor = 0.8;
  final double height = 22;
  @override
  void initState() {
    pageController.addListener(() {
      setState(() {
        currentPageValue = pageController.page!;
        print('current value is ${MediaQuery.of(context).size.height}');
      });
    });
    super.initState();
  }

  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          // color: Colors.red,
          height: MediaQuery.of(context).size.height * 0.3,
          child: PageView.builder(
              controller: pageController,
              itemCount: 5,
              itemBuilder: (context, position) {
                return _buidPageItem(position);
              }),
        ),
        DotsIndicator(
          dotsCount: 5,
          position: currentPageValue,
          decorator: DotsDecorator(
              activeColor: const Color(0xFF89DAD0),
              size: const Size.square(9.0),
              activeSize: const Size(18.0, 9.0),
              activeShape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(5.0))),
        )
      ],
    );
  }

  Widget _buidPageItem(int index) {
    Matrix4 matrix = Matrix4.identity();
    if (index == currentPageValue.floor()) {
      var currScale = 1 - (currentPageValue - index) * (1 - scaleFactor);
      var currTrans = height * (1 - currScale) / 2;
      matrix = Matrix4.diagonal3Values(1, currScale, 1)
        ..setTranslationRaw(0, currTrans, 0);
    } else if (index == currentPageValue.floor() + 1) {
      var currScale =
          scaleFactor + (currentPageValue - index + 1) * (1 - scaleFactor);
      var currTrans = height * (1 - currScale) / 2;
      matrix = Matrix4.diagonal3Values(1, currScale, 1);
      matrix = Matrix4.diagonal3Values(1, currScale, 1)
        ..setTranslationRaw(0, currTrans, 0);
    } else if (index == currentPageValue.floor() - 1) {
      var currScale = 1 - (currentPageValue - index) * (1 - scaleFactor);
      var currTrans = height * (1 - currScale) / 2;
      matrix = Matrix4.diagonal3Values(1, currScale, 1);
      matrix = Matrix4.diagonal3Values(1, currScale, 1)
        ..setTranslationRaw(0, currTrans, 0);
    } else {
      var currScale = 0.8;
      matrix = Matrix4.diagonal3Values(1, currScale, 1)
        ..setTranslationRaw(0, height * (1 - scaleFactor) / 2, 1);
    }
    return Transform(
      transform: matrix,
      child: Stack(
        children: [
          Container(
            height: 220,
            margin: const EdgeInsets.only(left: 10, right: 10),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(30),
              color: index.isEven
                  ? const Color(0xFF69c5df)
                  : const Color(0xFF9294cc),
              image: const DecorationImage(
                fit: BoxFit.cover,
                image: AssetImage(
                  'assets/hotel_2.png',
                ),
              ),
            ),
          ),
          // Align(
          //   alignment: Alignment.bottomCenter,
          //   child: Container(
          //     height: 120,
          //     margin: const EdgeInsets.only(left: 30, right: 30, bottom: 30),
          //     decoration: BoxDecoration(
          //         borderRadius: BorderRadius.circular(30), color: Colors.white),
          //     child: Container(
          //       padding: const EdgeInsets.only(top: 15, left: 15, right: 15),
          //       child: Column(
          //         crossAxisAlignment: CrossAxisAlignment.start,
          //         children: [
          //           BigText(text: "Hotel Name"),
          //           const SizedBox(height: 10),
          //           Row(
          //             children: [
          //               Wrap(
          //                 children: List.generate(
          //                     5,
          //                     (index) => const Icon(
          //                           Icons.star,
          //                           size: 15,
          //                           color: Color(0xFF89DAD0),
          //                         )),
          //               ),
          //               const SizedBox(width: 10),
          //               SmallText(text: "4.5"),
          //               const SizedBox(width: 10),
          //               SmallText(text: "1287"),
          //               const SizedBox(width: 10),
          //               SmallText(text: "comments"),
          //             ],
          //           ),
          //           const SizedBox(height: 20),
          //           Row(
          //             mainAxisAlignment: MainAxisAlignment.spaceBetween,
          //             children: const [
          //               IconsAndTextWidget(
          //                   icon: Icons.circle_sharp,
          //                   text: "Hotel",
          //                   iconColor: Color(0xFFFFD28D)),
          //               IconsAndTextWidget(
          //                   icon: Icons.location_on,
          //                   text: "1.7Km",
          //                   iconColor: Color(0xFF89DAD0)),
          //               IconsAndTextWidget(
          //                   icon: Icons.access_time_rounded,
          //                   text: "32min",
          //                   iconColor: Color(0xFFFCAB88))
          //             ],
          //           )
          //         ],
          //       ),
          //     ),
          //   ),
          // ),
        ],
      ),
    );
  }
}
