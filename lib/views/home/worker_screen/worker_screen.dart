import 'package:flutter/material.dart';
import 'package:taskdone/utilities/styles/colors.dart';

class WorkerScreen extends StatefulWidget {
  const WorkerScreen({super.key});

  @override
  State<WorkerScreen> createState() => _WorkerScreenState();
}

class _WorkerScreenState extends State<WorkerScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: AppColors.purple,
        child: Center(child: Text("Workers")),
      ),
    );
  }
}
