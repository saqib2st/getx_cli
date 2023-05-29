import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:getx_cli/app/data/widgets/apptheme.dart';
import 'package:getx_cli/app/modules/home/controllers/home_controller.dart';

class ShiftScreen extends GetView<HomeController> {
  const ShiftScreen({
    Key? key,
  }) : super(key: key);

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
          'Attendance Map List',
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
                          radius: 5,
                        ),
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
                          radius: 5,
                        ),
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
                        icon: SvgPicture.asset('assets/images/searchIcon.svg'),
                        onPressed: () => controller.searchController.clear(),
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15.0),
                        borderSide: BorderSide.none,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
      body: Container(
        color: AppColor.disableTextColor,
        padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 10),
        child: ListView.separated(
          separatorBuilder: (context, index) {
            return const SizedBox(height: 10);
          },
          itemCount: controller.siteList.length,
          itemBuilder: (context, index) {
            final site = controller.siteList[index];
            return Container(
              padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: AppColor.scaffoldBackground,
              ),
              child: Column(
                children: [
                  ListTile(
                    contentPadding: const EdgeInsets.all(0),
                    horizontalTitleGap: 0,
                    title: Text(
                      site.officeName,
                      style: const TextStyle(
                          fontWeight: FontWeight.w500, fontSize: 20),
                    ),
                    subtitle: Text(
                      site.location,
                      style: TextStyle(color: AppColor.tabColor),
                    ),
                    trailing: Obx(
                      () => !controller.isExpanded.value
                          ? SizedBox(
                              width: Get.width * 0.28,
                              child: TextButton(
                                onPressed: () {
                                  controller.isExpanded.value = true;
                                  controller.collapseSite(site.id);
                                },
                                child: Row(
                                  children: [
                                    Text(
                                      'Minimize',
                                      style:
                                          TextStyle(color: AppColor.textColor),
                                    ),
                                    Icon(
                                      Icons.keyboard_arrow_up,
                                      color: AppColor.textColor,
                                    ),
                                  ],
                                ),
                              ),
                            )
                          : const SizedBox(
                              height: 0,
                              width: 0,
                            ),
                    ),
                  ),
                  Obx(
                    () {
                      final userList = controller.userList;
                      final expanded =
                          controller.expandedSiteIds.contains(site.id);
                      final displayedUsers =
                          expanded ? userList : userList.take(2).toList();

                      return Column(
                        children: displayedUsers.map((user) {
                          return ListTile(
                            contentPadding: const EdgeInsets.all(0),
                            horizontalTitleGap: 5,
                            minVerticalPadding: 0,
                            leading: SvgPicture.asset(
                              user.profileImg,
                              fit: BoxFit.cover,
                              height: 40,
                              width: 40,
                            ),
                            title: Text(
                              user.name,
                              style: const TextStyle(
                                  fontWeight: FontWeight.w600, fontSize: 16),
                            ),
                            subtitle: Text(user.designation),
                            trailing: SizedBox(
                              width: Get.width * 0.23,
                              child: Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  Row(
                                    children: [
                                      const Text(
                                        '08:00 PM',
                                        style: TextStyle(fontSize: 13),
                                      ),
                                      const SizedBox(
                                        width: 10,
                                      ),
                                      CircleAvatar(
                                        backgroundColor: AppColor.primaryColor,
                                        radius: 4,
                                      ),
                                    ],
                                  ),
                                  Row(
                                    children: [
                                      const Text(
                                        '06:20 AM',
                                        style: TextStyle(fontSize: 13),
                                      ),
                                      const SizedBox(
                                        width: 10,
                                      ),
                                      CircleAvatar(
                                        backgroundColor:
                                            AppColor.punchOutButtonColor,
                                        radius: 4,
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                            onTap: () {
                              Get.toNamed('/contactScreen');
                            },
                          );
                        }).toList(),
                      );
                    },
                  ),
                  Divider(
                    color: AppColor.dividerColor,
                    thickness: 2,
                  ),
                  Obx(
                    () => controller.isExpanded.value
                        ? TextButton(
                            onPressed: () {
                              controller.isExpanded.value = false;
                              if (controller.expandedSiteIds
                                  .contains(site.id)) {
                                controller.collapseSite(site.id);
                              } else {
                                controller.expandSite(site.id);
                              }
                            },
                            child: Center(
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Icon(
                                    Icons.keyboard_arrow_down,
                                    color: AppColor.textColor,
                                  ),
                                  Text(
                                    "more",
                                    style: TextStyle(color: AppColor.textColor),
                                  ),
                                ],
                              ),
                            ),
                          )
                        : const SizedBox(
                            height: 0,
                            width: 0,
                          ),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
