import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_cli/app/data/widgets/apptheme.dart';
import '../controllers/splash_controller.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SplashView extends GetView<SplashController> {
  const SplashView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.primaryColor,
      body: Center(
          child: SvgPicture.asset(
        'assets/images/cleverStaffLogo.svg',
        color: Colors.white,
      )),
    );
  }
}
