import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_cli/app/data/widgets/apptheme.dart';
import 'package:getx_cli/app/modules/home/controllers/home_controller.dart';
import 'package:getx_cli/app/modules/home/views/tb_home_events.dart';
import 'package:getx_cli/app/modules/home/views/tb_home_punch_clck.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(
      builder: (controller) {
        return Scaffold(
          backgroundColor: AppColor.scaffoldBackground,
          body:
              TabBarView(controller: controller.tabController, children: const [
            PunchClockScreen(),
            EventScreen(),
          ]),
          bottomNavigationBar: TabBar(
            controller: controller.tabController,
            unselectedLabelColor: AppColor.appGrey,
            unselectedLabelStyle:
                const TextStyle(fontSize: 18, fontWeight: FontWeight.normal),
            labelColor: Colors.blue,
            labelStyle:
                const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            tabs: const [
              Tab(text: 'Punch Clock'),
              Tab(text: 'Events'),
            ],
          ),
        );
      },
    );
  }
}
