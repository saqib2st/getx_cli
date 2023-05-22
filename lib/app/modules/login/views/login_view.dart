import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:getx_cli/app/data/widgets/apptheme.dart';
import 'package:getx_cli/app/modules/login/widgets/sign_in_phone.dart';
import 'package:getx_cli/app/modules/login/widgets/singn_in_email.dart';
import 'package:google_fonts/google_fonts.dart';

import '../controllers/login_controller.dart';

class LoginView extends GetView<LoginController> {
  const LoginView({Key? key}) : super(key: key);

  // final TabController controller =
  //     Get.put(TabController(length: 2, vsync: this));
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColor.primarybackgroundColor,
        toolbarHeight: 250,
        title: const Center(
          child: Column(
            children: [
              Image(image: AssetImage('assets/images/Group 11.png')),
            ],
          ),
        ),
        bottom: TabBar(
          tabs: const [
            Tab(
              text: 'Phone',
            ),
            Tab(
              text: 'Email',
            ),
          ],
          controller: controller.tabController,
          unselectedLabelColor: AppColor.appGrey,
          unselectedLabelStyle:
              const TextStyle(fontSize: 18, fontWeight: FontWeight.normal),
          labelColor: Colors.blue,
          labelStyle:
              GoogleFonts.lato(fontSize: 18, fontWeight: FontWeight.bold),
        ),
      ),
      body: TabBarView(
        controller: controller.tabController,
        children: const <Widget>[
          SignInManagerWithPhone(),
          SignInManagerWithMail(),
        ],
      ),
    );
  }
}
