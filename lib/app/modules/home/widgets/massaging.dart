import 'package:flutter/material.dart';
import 'package:getx_cli/app/data/widgets/apptheme.dart';

class MassagingScreen extends StatefulWidget {
  const MassagingScreen({super.key});

  @override
  State<MassagingScreen> createState() => _MassagingScreenState();
}

class _MassagingScreenState extends State<MassagingScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueAccent,
      body: Center(
        child: Text(
          'Massage Screen is Working',
          style: TextStyle(fontSize: 20, color: AppColor.textColor),
        ),
      ),
    );
  }
}
