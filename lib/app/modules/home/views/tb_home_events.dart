import 'package:flutter/material.dart';

class EventScreen extends StatefulWidget {
  const EventScreen({super.key});

  @override
  State<EventScreen> createState() => _EventScreenState();
}

class _EventScreenState extends State<EventScreen> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(15.0),
      child: const Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: 10,
          ),
          
          Text(
            'Nothing to Report',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
          ),
          Text(
            'There are no events that need your attention.',
            style: TextStyle(fontSize: 15),
          ),
        ],
      ),
    );
  }
}
