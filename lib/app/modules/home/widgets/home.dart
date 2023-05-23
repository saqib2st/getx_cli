import 'package:flutter/material.dart';
import 'package:getx_cli/app/data/widgets/apptheme.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.amberAccent,
      body: Center(
        child: Text(
          'Home Screen is Working',
          style: TextStyle(fontSize: 20, color: AppColor.textColor),
        ),
      ),
    );
  }
}
