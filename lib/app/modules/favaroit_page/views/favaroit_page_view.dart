import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controllers/favaroit_page_controller.dart';

class FavaroitPageView extends GetView<FavaroitPageController> {
  const FavaroitPageView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text(
          'FavaroitPageView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
