import 'package:flutter/material.dart';
import 'package:getx_cli/app/data/widgets/apptheme.dart';

class ContactScreen extends StatefulWidget {
  const ContactScreen({super.key});

  @override
  State<ContactScreen> createState() => _ContactScreenState();
}

class _ContactScreenState extends State<ContactScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.greenAccent,
      body: Center(
        child: Text(
          'Contact Screen is Working',
          style: TextStyle(fontSize: 20, color: AppColor.textColor),
        ),
      ),
    );
  }
}
