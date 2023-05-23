import 'package:flutter/material.dart';
import 'package:getx_cli/app/data/widgets/apptheme.dart';

class AccountScreen extends StatefulWidget {
  const AccountScreen({super.key});

  @override
  State<AccountScreen> createState() => _AccountScreenState();
}

class _AccountScreenState extends State<AccountScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.redAccent,
      body: Center(
        child: Text(
          'Account Screen is Working',
          style: TextStyle(fontSize: 20, color: AppColor.textColor),
        ),
      ),
    );
  }
}
