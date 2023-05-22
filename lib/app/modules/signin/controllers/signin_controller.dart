import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_cli/app/data/widgets/apptheme.dart';

class SigninController extends GetxController {
  // final count = 0.obs;
  var counter = 0.obs;
  RxInt activePage = 0.obs;

  // int get activePage => activePage;

  // set activePage(RxInt value) {
  //   activePage = value;
  // }
  final PageController pageController = PageController();

  void goToPage(int page) {
    pageController.animateToPage(
      page,
      duration: const Duration(milliseconds: 300),
      curve: Curves.ease,
    );
  }

  RxInt incrementCounterOutput() {
    counter.value++;
    update();
    return counter; // Call `update()` to update the UI
  }

  void incrementPage() {
    if (activePage < 4) {
      activePage++;
      // notifyListeners();
    }
  }

  void decrementPage() {
    if (activePage > 0) {
      activePage--;
      // notifyListeners();
    }
  }

  void resetPage() {
    activePage = 0.obs;
    // notifyListeners();
  }

  Color getBottomBorderColor(int index) {
    if (counter == 0 && index == 0 ||
        counter == 1 && index == 0 ||
        counter == 2 && index == 1 ||
        counter == 3 && index == 2 ||
        counter == 4 && index == 2) {
      return AppColor.primaryColor;
    } else {
      return AppColor.scaffoldBackground;
    }
  }

  Color getSVGcolor(int index, RxInt activePage) {
    if (counter == 0 && index == 0 ||
        counter == 1 && index == 0 ||
        counter == 2 && index == 1 ||
        counter == 3 && index == 2 ||
        counter == 4 && index == 2) {
      return AppColor.primaryColor;
    } else {
      return AppColor.appGrey;
    }
  }
}
