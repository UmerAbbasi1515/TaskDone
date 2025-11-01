import 'package:flutter/material.dart';
import 'package:taskdone/utilities/styles/colors.dart';

class MessageScreen extends StatefulWidget {
  const MessageScreen({super.key});

  @override
  State<MessageScreen> createState() => _MessageScreenState();
}

class _MessageScreenState extends State<MessageScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: AppColors.lightGrey,
        child: Center(child: Text("Message")),
      ),
    );
  }
}
