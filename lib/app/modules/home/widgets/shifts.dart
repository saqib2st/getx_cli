import 'package:flutter/material.dart';
import 'package:getx_cli/app/data/widgets/apptheme.dart';

class ShiftScreen extends StatefulWidget {
  const ShiftScreen({super.key});

  @override
  State<ShiftScreen> createState() => _ShiftScreenState();
}

class _ShiftScreenState extends State<ShiftScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey,
      body: Center(
        child: Text(
          'Shift Screen is Working',
          style: TextStyle(fontSize: 20, color: AppColor.textColor),
        ),
      ),
    );
  }
}
