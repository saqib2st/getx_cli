import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_cli/app/data/static_assets.dart';
import 'package:getx_cli/app/modules/home/views/account.dart';
import 'package:getx_cli/app/modules/home/views/contact.dart';
import 'package:getx_cli/app/modules/home/views/home.dart';
import 'package:getx_cli/app/modules/home/views/massaging.dart';
import 'package:getx_cli/app/modules/home/views/shifts.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class HomeController extends GetxController with SingleGetTickerProviderMixin {
  int selectedIndex = 0;
  int index = 0;

  late TabController tabController;
  late PageController pageController;

  final TextEditingController searchController = TextEditingController();

  RxList<Site> siteList = <Site>[
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

  RxBool isExpanded = true.obs;

  final RxList<int> expandedSiteIds = <int>[].obs;

  void expandSite(int siteId) {
    if (!expandedSiteIds.contains(siteId)) {
      expandedSiteIds.add(siteId);
    }
  }

  void collapseSite(int siteId) {
    expandedSiteIds.remove(siteId);
  }

  RxList<Users> userList = <Users>[
    Users(
        name: 'Jhon Wick',
        designation: 'Mobile Developer',
        profileImg: 'assets/images/profileImg.svg'),
    Users(
        name: 'Larry Page',
        designation: 'Manager',
        profileImg: 'assets/images/profileImg.svg'),
    Users(
        name: 'Steven Desson',
        designation: 'Monitoring & QA',
        profileImg: 'assets/images/profileImg.svg'),
    Users(
        name: 'Frank Zoagat',
        designation: 'Mobile Developer',
        profileImg: 'assets/images/profileImg.svg'),
    Users(
        name: 'Paul Smith',
        designation: 'Monitoring & QA',
        profileImg: 'assets/images/profileImg.svg'),
    Users(
        name: 'James Williamson',
        designation: 'Mobile Developer',
        profileImg: 'assets/images/profileImg.svg'),
    Users(
        name: 'Chris volt',
        designation: 'Monitoring & QA',
        profileImg: 'assets/images/profileImg.svg'),
  ].obs;

  void searchUser(String query) {
    if (query.isNotEmpty) {
      final filteredUserList = userList.where((user) {
        final userName = user.name.toLowerCase();
        final input = query.toLowerCase();
        return userName.contains(input);
      }).toList();

      userList.clear();
      userList.addAll(filteredUserList);
    } else {
      userList.clear();
      userList.addAll([
        Users(
            name: 'Jhon Wick',
            designation: 'Mobile Developer',
            profileImg: 'assets/images/profileImg.svg'),
        Users(
            name: 'Larry Page',
            designation: 'Manager',
            profileImg: 'assets/images/profileImg.svg'),
        Users(
            name: 'Steven Desson',
            designation: 'Monitoring & QA',
            profileImg: 'assets/images/profileImg.svg'),
        Users(
            name: 'Frank Zoagat',
            designation: 'Mobile Developer',
            profileImg: 'assets/images/profileImg.svg'),
        Users(
            name: 'Paul Smith',
            designation: 'Monitoring & QA',
            profileImg: 'assets/images/profileImg.svg'),
        Users(
            name: 'James Williamson',
            designation: 'Mobile Developer',
            profileImg: 'assets/images/profileImg.svg'),
        Users(
            name: 'Chris volt',
            designation: 'Monitoring & QA',
            profileImg: 'assets/images/profileImg.svg'),
      ]);
    }

    update();
  }

  RxInt currentIndex = 0.obs;
  RxInt currentPage = 0.obs;

  @override
  void onClose() {
    tabController.dispose();
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

  late GoogleMapController mapController;

  CameraPosition initialPosition = const CameraPosition(
    target: LatLng(40.706928,
        -73.621788), // Initial map center coordinates (San Francisco)
    zoom: 17.0, // Initial zoom level
  );

  void onMapCreated(GoogleMapController controller) {
    mapController = controller;
  }

  @override
  void dispose() {
    mapController.dispose();
    super.dispose();
  }

  RxSet<Marker> markers = <Marker>{}.obs;
  BitmapDescriptor? customIcon;

  createMarker(context) {
    if (customIcon == null) {
      ImageConfiguration configuration = createLocalImageConfiguration(context);
      BitmapDescriptor.fromAssetImage(configuration, 'assets/images/inSvg.svg')
          .then((Icon) {
        customIcon = Icon;
      });
    }
  }

  void addMarker(LatLng position, String markerId) {
    final marker = Marker(
        markerId: MarkerId(markerId),
        position: position,
        infoWindow:
            const InfoWindow(title: 'Check in Time', snippet: 'Snippete data'));
    markers.add(marker);
    update(['markers']); // Notify the UI that the markers have changed
  }

  @override
  void onInit() {
    tabController = TabController(length: 2, vsync: this);
    pageController = PageController();
    super.onInit();
    const markerPosition = LatLng(37.7749, -122.4194); // Marker position
    const markerId = 'myMarker'; // Unique marker ID
    addMarker(markerPosition, markerId);
  }

  void handleMapTap(LatLng position) {
    final markerId = DateTime.now()
        .millisecondsSinceEpoch
        .toString(); // Generate a unique marker ID
    addMarker(position, markerId);
  }
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
  final int id;
  final String location;
  final String officeName;

  Site({
    required this.id,
    required this.location,
    required this.officeName,
  });
}
