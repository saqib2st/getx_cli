import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginController extends GetxController with SingleGetTickerProviderMixin  {


  final count = 0.obs;
  late TabController tabController;
  @override
  void onInit() {
    super.onInit();
    tabController = TabController(length: 2, vsync: this);
  }

 

  @override
  void onClose() {
    super.onClose();
    tabController.dispose();
  }

 
}
