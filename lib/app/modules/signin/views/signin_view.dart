import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:getx_cli/app/data/static_assets.dart';
import 'package:getx_cli/app/data/widgets/apptheme.dart';
import 'package:getx_cli/app/modules/signin/widgets/p_tb_account_info.dart';
import 'package:getx_cli/app/modules/signin/widgets/p_tb_personal_info.dart';
import 'package:getx_cli/app/modules/signin/widgets/sl_tb_salary_info.dart';
import 'package:getx_cli/app/modules/signin/widgets/vf_t_verfication.dart';
import 'package:getx_cli/app/modules/signin/widgets/vf_tb_phone.dart';
import '../controllers/signin_controller.dart';

class SigninView extends GetView<SigninController> {
  SigninView({Key? key}) : super(key: key);

  final List<Widget> screens = [
    const PersonalInfo(),
    const AccountInfo(),
    const SalaryInfo(),
    const PhoneInfo(),
    const VeriFication()
  ];

  final List<String> tabIcons = [
    StaticAssets.personIcon,
    StaticAssets.salaryIcon,
    StaticAssets.phoneIcon,
  ];
  @override
  Widget build(BuildContext context) {
    // int counter;
    // int index;

    return Obx(() => Scaffold(
          appBar: AppBar(
            toolbarHeight: 100,
            automaticallyImplyLeading: false,
            backgroundColor: AppColor.scaffoldBackground,
            title: RichText(
              text: TextSpan(
                  style: TextStyle(
                      color: AppColor.textColor,
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'Lato'),
                  children: [
                    const TextSpan(
                      text: 'Sign up',
                    ),
                    TextSpan(
                      text: '  ${controller.counter.value + 1}/5',
                      style: TextStyle(
                        color: AppColor.primaryColor,
                      ),
                    ),
                  ]),
            ),
            bottom: PreferredSize(
              preferredSize: const Size(double.infinity, 25),
              child: Column(
                children: [
                  Container(
                    padding: const EdgeInsets.all(5),
                    decoration: BoxDecoration(
                        border: BorderDirectional(
                            bottom: BorderSide(
                      color: tabIcons.length < 2
                          ? AppColor.primaryColor
                          : AppColor.scaffoldBackground,
                      style: BorderStyle.solid,
                      width: 4,
                    ))),
                    height: 40,
                    child: Row(
                      children: List.generate(
                        tabIcons.length,
                        (index) => Expanded(
                          child: Container(
                            padding: const EdgeInsets.fromLTRB(0, 0, 0, 5),
                            decoration: BoxDecoration(
                                border: BorderDirectional(
                              bottom: BorderSide(
                                color: controller.getBottomBorderColor(index),
                              ),
                            )),
                            height: 25,
                            child: SvgPicture.asset(
                              tabIcons[index],
                              color: controller.getSVGcolor(
                                  index, controller.counter),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  controller.counter < 2
                      ? Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Expanded(
                              child: Container(
                                decoration: BoxDecoration(
                                    border: BorderDirectional(
                                  bottom: BorderSide(
                                      color: controller.counter == 0
                                          ? AppColor.primaryColor
                                          : AppColor.appGrey),
                                )),
                                height: 30,
                                child: Text(
                                  '1.Personal',
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: controller.counter == 0
                                          ? AppColor.primaryColor
                                          : AppColor.appGrey),
                                  textAlign: TextAlign.center,
                                ),
                              ),
                            ),
                            Expanded(
                              child: Container(
                                decoration: BoxDecoration(
                                    border: BorderDirectional(
                                  bottom: BorderSide(
                                      color: controller.counter == 1
                                          ? AppColor.primaryColor
                                          : AppColor.appGrey),
                                )),
                                height: 30,
                                child: Text(
                                  '2.Acccount',
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: controller.counter == 1
                                          ? AppColor.primaryColor
                                          : AppColor.appGrey),
                                  textAlign: TextAlign.center,
                                ),
                              ),
                            ),
                          ],
                        )
                      : controller.counter == 2
                          ? Row(
                              children: [
                                Expanded(
                                  child: Container(
                                    decoration: BoxDecoration(
                                        border: BorderDirectional(
                                      bottom: BorderSide(
                                          color: controller.counter == 2
                                              ? AppColor.primaryColor
                                              : AppColor.appGrey),
                                    )),
                                    height: 30,
                                    child: Text(
                                      '3.Salary',
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          color: controller.counter == 2
                                              ? AppColor.primaryColor
                                              : AppColor.appGrey),
                                      textAlign: TextAlign.center,
                                    ),
                                  ),
                                ),
                              ],
                            )
                          : Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Expanded(
                                  child: Container(
                                    decoration: BoxDecoration(
                                        border: BorderDirectional(
                                      bottom: BorderSide(
                                          color: controller.counter == 3
                                              ? AppColor.primaryColor
                                              : AppColor.appGrey),
                                    )),
                                    height: 30,
                                    child: Text(
                                      '4.Phone',
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          color: controller.counter == 3
                                              ? AppColor.primaryColor
                                              : AppColor.appGrey),
                                      textAlign: TextAlign.center,
                                    ),
                                  ),
                                ),
                                Expanded(
                                  child: Container(
                                    decoration: BoxDecoration(
                                        border: BorderDirectional(
                                      bottom: BorderSide(
                                          color: controller.counter == 4
                                              ? AppColor.primaryColor
                                              : AppColor.appGrey),
                                    )),
                                    height: 30,
                                    child: Text(
                                      '5.Verification',
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          color: controller.counter == 4
                                              ? AppColor.primaryColor
                                              : AppColor.appGrey),
                                      textAlign: TextAlign.center,
                                    ),
                                  ),
                                ),
                              ],
                            )
                ],
              ),
            ),
          ),
          body: Stack(
            children: [
              PageView.builder(
                physics: const NeverScrollableScrollPhysics(),
                controller: controller.pageController,
                itemCount: screens.length,
                onPageChanged: (int page) {
                  controller.counter = page as RxInt;
                },
                itemBuilder: (context, index) {
                  return screens[index % screens.length];
                },
              ),
              Positioned(
                bottom: 0,
                right: 0,
                left: 0,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    ElevatedButton(
                      style: ButtonStyle(
                        backgroundColor:
                            MaterialStateProperty.resolveWith<Color>(
                          (Set<MaterialState> states) {
                            if (states.contains(MaterialState.pressed)) {
                              return AppColor.primaryColor.withOpacity(0.5);
                            }
                            return controller.counter < 1
                                ? AppColor.appGrey
                                : AppColor.primaryColor;
                          },
                        ),
                      ),
                      onPressed: () {
                        if (controller.counter.value != 0) {
                          controller.pageController.animateToPage(
                            controller.counter.value - 1,
                            duration: const Duration(milliseconds: 300),
                            curve: Curves.easeIn,
                          );
                          controller.counter.value--;
                        } else {}
                      },
                      child: const Text('Previous'),
                    ),
                    ElevatedButton(
                      onPressed: () {
                        Get.back();
                      },
                      child: const Text('Cancel'),
                    ),
                    ElevatedButton(
                      onPressed: () {
                        if (controller.counter.value < screens.length - 1) {
                          controller.pageController.animateToPage(
                            controller.counter.value + 1,
                            duration: const Duration(milliseconds: 300),
                            curve: Curves.easeIn,
                          );
                          controller.counter.value++;
                        } else {}
                      },
                      child: Obx(() =>
                          controller.counter.value == screens.length - 1
                              ? const Text('Submit')
                              : const Text('Next')),
                    ),
                  ],
                ),
              )
            ],
          ),
        ));
  }
}
