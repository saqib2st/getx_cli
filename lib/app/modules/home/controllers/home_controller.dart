import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_cli/app/data/static_assets.dart';
import 'package:getx_cli/app/modules/home/views/account.dart';
import 'package:getx_cli/app/modules/home/views/contact.dart';
import 'package:getx_cli/app/modules/home/views/home.dart';
import 'package:getx_cli/app/modules/home/views/massaging.dart';
import 'package:getx_cli/app/modules/home/views/shifts.dart';

class HomeController extends GetxController with SingleGetTickerProviderMixin {
  int selectedIndex = 0;
  int index = 0;

  late TabController tabController;
  PageController pageController = PageController();

  TextEditingController _searchController = TextEditingController();
  TextEditingController get searchController => _searchController;

  List<Site> siteList = [
    Site(
        id: 1,
        location: 'Blueberry street 214 b',
        officeName: 'Central City Office'),
    Site(
        id: 2,
        location: 'Blueberry street 214 b',
        officeName: 'Bussines Street 21'),
    Site(
        id: 3,
        location: 'Blueberry street 214 b',
        officeName: 'Chesea Subway no.5'),
    Site(
        id: 4,
        location: 'Blueberry street 214 B',
        officeName: 'Central City Office'),
  ].obs;

  var itemCount = 2.obs;
  RxBool isExpanded = false.obs;

  final RxList<int> expandedSiteIds = <int>[].obs;

  void expandSite(int siteId) {
    if (!expandedSiteIds.contains(siteId)) {
      expandedSiteIds.add(siteId);
    }
  }

  void collapseSite(int siteId) {
    expandedSiteIds.remove(siteId);
  }

  List<Users> userList = [
    Users(
        name: 'Jhon Wick',
        designation: 'Mobile Developer',
        profileImg: 'assets/images/profileImg.svg'),
    Users(
        name: 'Steven Desson',
        designation: 'monitoring & QA',
        profileImg: 'assets/images/profileImg.svg'),
    Users(
        name: 'Jhon Wick',
        designation: 'Mobile Developer',
        profileImg: 'assets/images/profileImg.svg'),
    Users(
        name: 'Steven Desson',
        designation: 'monitoring & QA',
        profileImg: 'assets/images/profileImg.svg'),
    Users(
        name: 'Jhon Wick',
        designation: 'Mobile Developer',
        profileImg: 'assets/images/profileImg.svg'),
    Users(
        name: 'Steven Desson',
        designation: 'monitoring & QA',
        profileImg: 'assets/images/profileImg.svg'),
  ].obs;

  void searchUser(String query) {
    final findedUser = userList.where((user) {
      final userName = user.name.toLowerCase();
      final input = query.toLowerCase();
      return userName.contains(input);
    }).toList();

    userList.clear();
    userList.addAll(findedUser);
    if (query.isEmpty) {
      userList.addAll(userList);
    }
  }

  RxInt currentIndex = 0.obs;

  RxInt currentPage = 0.obs;

  @override
  void onInit() {
    _searchController = TextEditingController();
    tabController = TabController(length: 2, vsync: this);
    pageController = PageController();
    super.onInit();
  }

  @override
  void onClose() {
    _searchController.dispose();
    pageController.dispose();
    super.onClose();
  }

  final List<String> tabIcons = [
    StaticAssets.homeIcon,
    StaticAssets.shiftIcon,
    StaticAssets.contactIcon,
    StaticAssets.massageIcon,
    StaticAssets.accountIcon,
  ];

  final List<String> labels = [
    'Home',
    'Shifts',
    'Contacts',
    'Messages',
    'Account',
  ];

  final List<Widget> screens = [
    const HomeScreen(),
    const ShiftScreen(),
    const ContactScreen(),
    const MassagingScreen(),
    const AccountScreen(),
  ];
}

class Users {
  final String name;
  final String designation;
  final String profileImg;

  Users({
    required this.name,
    required this.designation,
    required this.profileImg,
  });
}

class Site {
  int id = 0;
  final String location;
  final String officeName;

  Site({required this.id, required this.location, required this.officeName});
}
