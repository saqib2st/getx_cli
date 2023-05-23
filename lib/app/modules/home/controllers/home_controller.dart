import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_cli/app/data/static_assets.dart';
import 'package:getx_cli/app/modules/home/widgets/account.dart';
import 'package:getx_cli/app/modules/home/widgets/contact.dart';
import 'package:getx_cli/app/modules/home/widgets/home.dart';
import 'package:getx_cli/app/modules/home/widgets/massaging.dart';
import 'package:getx_cli/app/modules/home/widgets/shifts.dart';

class HomeController extends GetxController {
  int selectedIndex = 0;
  int index = 0;

  PageController pageController = PageController();

  RxInt currentIndex = 0.obs;

  RxInt currentPage = 0.obs;

  @override
  void onInit() {
    pageController = PageController();
    super.onInit();
  }

  @override
  void onClose() {
    pageController.dispose();
    super.onClose();
  }

  final List<String> tabIcons = [
    StaticAssets.homeIcon,
    StaticAssets.shiftIcon,
    StaticAssets.contactIcon,
    StaticAssets.massageIcon,
    StaticAssets.accountIcon,
  ];

  final List<String> labels = [
    'Home',
    'Shifts',
    'Contacts',
    'Messages',
    'Account',
  ];

  final List<Widget> screens = [
    const HomeScreen(),
    const ShiftScreen(),
    const ContactScreen(),
    const MassagingScreen(),
    const AccountScreen(),
  ];
}
