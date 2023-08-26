import 'package:event_app/app/configs/colors.dart';
import 'package:flutter/material.dart';

class MyNavigationBar extends StatefulWidget {
  const MyNavigationBar({Key? key}) : super(key: key);

  @override
  State<MyNavigationBar> createState() => _MyNavigationBarState();
}

class _MyNavigationBarState extends State<MyNavigationBar> {
  @override
  Widget build(BuildContext context) {
    return NavigationBar(
      height: 60,
      elevation: 0,
      animationDuration: const Duration(seconds: 3),
      labelBehavior: NavigationDestinationLabelBehavior.alwaysHide,
      backgroundColor: AppColors.whiteColor,
      destinations: [
        NavigationDestination(
          icon: Image.asset("assets/images/home.jpg", width: 24, height: 24),
          label: "Home",
        ),
        NavigationDestination(
          icon:
              Image.asset("assets/images/ticket.png", width: 24, height: 24),
          label: "Ticket",
        ),
        NavigationDestination(
            icon: Image.asset("assets/images/calendar.png",
                width: 24, height: 24),
            label: "Event"),
        NavigationDestination(
            icon: Image.asset("assets/images/profile.png",
                width: 24, height: 24),
            label: "Profile"),
      ],
    );
  }
}
