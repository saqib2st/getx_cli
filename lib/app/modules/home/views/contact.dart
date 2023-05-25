import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:getx_cli/app/data/widgets/apptheme.dart';
import 'package:getx_cli/app/modules/home/controllers/home_controller.dart';

class ContactScreen extends GetView<HomeController> {
  const ContactScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        leading: Icon(
          Icons.arrow_back_ios_new,
          color: AppColor.textColor,
        ),
        backgroundColor: AppColor.scaffoldBackground,
        title: Text(
          'Worker Profile',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: AppColor.textColor,
          ),
        ),
        centerTitle: true,
        bottom: PreferredSize(
          preferredSize: Size(double.infinity, Get.height * 0.15),
          child: Container(
            padding: const EdgeInsets.all(15.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'SEARCH',
                      style: TextStyle(color: AppColor.appGrey),
                    ),
                    SizedBox(
                      width: Get.width * 0.2,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          'CHECK IN',
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        const SizedBox(
                          width: 5,
                        ),
                        CircleAvatar(
                          backgroundColor: AppColor.primaryColor,
                          radius: 6,
                        )
                      ],
                    ),
                    Row(
                      children: [
                        const Text(
                          'CHECK OUT',
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        const SizedBox(
                          width: 5,
                        ),
                        CircleAvatar(
                          backgroundColor: AppColor.punchOutButtonColor,
                          radius: 6,
                        )
                      ],
                    ),
                  ],
                ),
                const SizedBox(
                  height: 10,
                ),
                SizedBox(
                  height: 50,
                  child: TextField(
                      onChanged: controller.searchUser,
                      controller: controller.searchController,
                      decoration: InputDecoration(
                          filled: true,
                          fillColor: AppColor.disableButtonColor,
                          hintText: 'Search...',
                          suffixIcon: IconButton(
                            icon: SvgPicture.asset(
                                'assets/images/searchIcon.svg'),
                            onPressed: () =>
                                controller.searchController.clear(),
                          ),
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(15.0),
                              borderSide: BorderSide.none))),
                ),
              ],
            ),
          ),
        ),
      ),
      body: Obx(
        () => Container(
          color: AppColor.disableTextColor,
          padding: const EdgeInsets.all(15),
          // decoration:
          // BoxDecoration(borderRadius: BorderRadius.circular(5)
          // ),
          child: ListView.separated(
            separatorBuilder: (context, index) {
              return const SizedBox(height: 10);
            },
            itemCount: controller.userList.length,
            itemBuilder: (context, index) {
              final user = controller.userList[index];
              return Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: AppColor.scaffoldBackground,
                ),
                child: Column(
                  children: [
                    ListTile(
                      leading: SvgPicture.asset(
                        user.profileImg,
                        fit: BoxFit.cover,
                        height: 40,
                        width: 40,
                      ),
                      title: Text(
                        user.name.toString(),
                        style: const TextStyle(
                            fontWeight: FontWeight.w600, fontSize: 14),
                      ),
                      subtitle: Text(
                        user.designation.toString(),
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 13,
                            color: AppColor.appGrey),
                      ),
                    ),
                    Row(
                      children: [
                        const SizedBox(
                          width: 30,
                        ),
                        Row(
                          children: [
                            const Text(
                              '8:00 PM',
                              style: TextStyle(
                                  fontWeight: FontWeight.normal, fontSize: 13),
                            ),
                            const SizedBox(
                              width: 5,
                            ),
                            CircleAvatar(
                              backgroundColor: AppColor.primaryColor,
                              radius: 4,
                            )
                          ],
                        ),
                        const SizedBox(
                          width: 20,
                        ),
                        Row(
                          children: [
                            const Text(
                              '6:20 AM',
                              style: TextStyle(
                                  fontWeight: FontWeight.normal, fontSize: 13),
                            ),
                            const SizedBox(
                              width: 5,
                            ),
                            CircleAvatar(
                              backgroundColor: AppColor.punchOutButtonColor,
                              radius: 4,
                            )
                          ],
                        ),
                      ],
                    ),
                    SizedBox(
                      height: Get.height * 0.11,
                      child: Center(
                          child: Text(
                        "OTEHR DATA ?",
                        style: TextStyle(fontSize: 20, color: AppColor.appGrey),
                      )),
                    )
                  ],
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
