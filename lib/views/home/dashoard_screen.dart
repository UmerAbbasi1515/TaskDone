import 'package:flutter/material.dart';
import 'package:taskdone/utilities/common/widgets/bottom_widget.dart';
import 'package:taskdone/utilities/constants/assets_path.dart';
import 'package:taskdone/utilities/constants/meta_labels.dart';
import 'package:taskdone/utilities/styles/text_styles.dart';
import 'package:taskdone/views/home/home_screen/home_screen.dart';
import 'package:taskdone/views/home/jobs_screen/jobs_screen.dart';
import 'package:taskdone/views/home/messages_screen/message_screen.dart';
import 'package:taskdone/views/home/services_screen/service_screen.dart';
import 'package:taskdone/views/home/worker_screen/worker_screen.dart';

class DashboardSreen extends StatefulWidget {
  const DashboardSreen({
    super.key,
  });

  @override
  DashboardSreenState createState() => DashboardSreenState();
}

class DashboardSreenState extends State<DashboardSreen> {
  int? _selectedIndex = 0;

  @override
  void initState() {
    super.initState();
  }

  List<Widget>? _buildScreens;

  @override
  Widget build(BuildContext context) {
    _buildScreens = [
      HomeScreen(),
      JobsScreen(),
      WorkerScreen(),
      ServiceScreen(),
      MessageScreen(),
    ];

    return Scaffold(
      backgroundColor: Colors.white,
      resizeToAvoidBottomInset: false,
      body: Stack(
        children: [
          SafeArea(
            child: Column(
              children: [
                Expanded(
                  child: _buildScreens![_selectedIndex!],
                ),
                CustomNavBar(
                  items: [
                    NavBarItem(
                      icon: _selectedIndex == 0
                          ? AppImagesPath.homeSelected
                          : AppImagesPath.home,
                      title: AppLabels.home,
                      style: _selectedIndex == 0
                          ? AppTextStyle.regularPurple14
                          : AppTextStyle.regularblack14,
                      onTap: (pos) {
                        setState(() {
                          _selectedIndex = pos;
                        });
                      },
                      position: 0,
                    ),
                    NavBarItem(
                      icon: _selectedIndex == 1
                          ? AppImagesPath.jobsSelected
                          : AppImagesPath.jobs,
                      title: AppLabels.jobs,
                      style: _selectedIndex == 1
                          ? AppTextStyle.regularPurple14
                          : AppTextStyle.regularblack14,
                      onTap: (pos) {
                        setState(() {
                          _selectedIndex = pos;
                        });
                      },
                      position: 1,
                    ),
                    NavBarItem(
                      icon: _selectedIndex == 2
                          ? AppImagesPath.workerSelected
                          : AppImagesPath.worker,
                      title: AppLabels.workers,
                      style: _selectedIndex == 2
                          ? AppTextStyle.regularPurple14
                          : AppTextStyle.regularblack14,
                      onTap: (pos) {
                        setState(() {
                          _selectedIndex = pos;
                        });
                      },
                      position: 2,
                    ),
                    NavBarItem(
                      icon: _selectedIndex == 3
                          ? AppImagesPath.servicesSelected
                          : AppImagesPath.services,
                      title: AppLabels.services,
                      style: _selectedIndex == 3
                          ? AppTextStyle.regularPurple14
                          : AppTextStyle.regularblack14,
                      onTap: (pos) {
                        setState(() {
                          _selectedIndex = pos;
                        });
                      },
                      position: 3,
                    ),
                    NavBarItem(
                      icon: _selectedIndex == 4
                          ? AppImagesPath.messegeSelected
                          : AppImagesPath.messege,
                      title: AppLabels.messages,
                      style: _selectedIndex == 4
                          ? AppTextStyle.regularPurple14
                          : AppTextStyle.regularblack14,
                      onTap: (pos) {
                        setState(() {
                          _selectedIndex = pos;
                        });
                      },
                      position: 4,
                    ),
                  ],
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
