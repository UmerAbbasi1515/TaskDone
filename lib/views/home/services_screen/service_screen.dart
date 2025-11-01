import 'package:flutter/material.dart';
import 'package:taskdone/utilities/styles/colors.dart';

class ServiceScreen extends StatefulWidget {
  const ServiceScreen({super.key});

  @override
  State<ServiceScreen> createState() => _ServiceScreenState();
}

class _ServiceScreenState extends State<ServiceScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: AppColors.lightPurple,
        child: Center(child: Text("Service")),
      ),
    );
  }
}
