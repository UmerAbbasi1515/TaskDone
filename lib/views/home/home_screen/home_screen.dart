import 'package:flutter/material.dart';
import 'package:taskdone/utilities/styles/colors.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: AppColors.blue,
        child: Center(child: Text("Home")),
      ),
    );
  }
}
