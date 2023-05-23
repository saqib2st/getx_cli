import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:getx_cli/app/data/widgets/apptheme.dart';
import '../controllers/home_controller.dart';

class HomeView extends StatelessWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(
      builder: (controller) {
        return Scaffold(
          appBar: AppBar(
            automaticallyImplyLeading: false,
            title: Text(
              'Home',
              style: TextStyle(
                color: AppColor.textColor,
              ),
            ),
            centerTitle: true,
            backgroundColor: AppColor.scaffoldBackground,
          ),
          body: PageView.builder(
            controller: controller.pageController,
            itemCount: controller.screens.length,
            onPageChanged: (int newIndex) {
              controller.currentIndex.value = newIndex;
            },
            itemBuilder: (context, index) {
              return controller.screens[index];
            },
          ),
          bottomNavigationBar: Obx(() => BottomNavigationBar(
                currentIndex: controller.currentIndex.value,
                onTap: (int index) {
                  controller.currentIndex.value = index;
                  controller.pageController.animateToPage(
                    index,
                    duration: const Duration(milliseconds: 200),
                    curve: Curves.easeIn,
                  );
                },
                selectedItemColor: AppColor.primaryColor,
                unselectedItemColor: AppColor.appGrey,
                unselectedLabelStyle: TextStyle(color: AppColor.appGrey),
                showUnselectedLabels: true,
                items: List.generate(
                  controller.tabIcons.length,
                  (index) => BottomNavigationBarItem(
                    icon: SvgPicture.asset(
                      controller.tabIcons[index],
                      color: controller.currentIndex.value == index
                          ? AppColor.primaryColor
                          : AppColor.appGrey,
                    ),
                    label: controller.labels[index],
                  ),
                ),
              )),
        );
      },
    );
  }
}
