import 'package:flutter/material.dart';
import 'package:taskdone/utilities/styles/colors.dart';

class JobsScreen extends StatefulWidget {
  const JobsScreen({super.key});

  @override
  State<JobsScreen> createState() => _JobsScreenState();
}

class _JobsScreenState extends State<JobsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: AppColors.red,
        child: Center(child: Text("Jobs")),
      ),
    );
  }
}
