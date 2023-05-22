import 'package:get/get.dart';
import 'package:getx_cli/app/routes/app_pages.dart';

class SplashController extends GetxController {
  void isLogin() {
    Future.delayed(const Duration(seconds: 3), () {
        Get.offAllNamed(Routes.login);
      });
  }

  @override
  void onInit() {
    isLogin();
    super.onInit();
  }
}
