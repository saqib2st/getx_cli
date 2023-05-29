import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_cli/app/data/widgets/apptheme.dart';
import 'package:getx_cli/app/modules/home/controllers/home_controller.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MassagingScreen extends GetView<HomeController> {
  const MassagingScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        leading: Icon(
          Icons.arrow_back_ios,
          color: AppColor.textColor,
        ),
        backgroundColor: AppColor.scaffoldBackground,
        title: Text(
          'Attendance Map',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: AppColor.primaryColor,
          ),
        ),
      ),
      body: Stack(
        children: [
          Obx(() => GoogleMap(
                onMapCreated: controller.onMapCreated,
                initialCameraPosition: controller.initialPosition,
                markers: Set<Marker>.of(controller.markers),
                onTap: controller.handleMapTap,
              )),
          Positioned(
            top: 15,
            right: 10,
            child: Container(
              width: Get.width * 0.6,
              height: Get.height * 0.035,
              color: AppColor.primarybackgroundColor,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Container(
                    height: Get.height * 0.017,
                    width: Get.width * 0.1,
                    color: AppColor.primaryColor,
                  ),
                  const Text('Check in'),
                  Container(
                    height: Get.height * 0.017,
                    width: Get.width * 0.1,
                    color: AppColor.punchOutButtonColor,
                  ),
                  const Text('Check Out'),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
