import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:event_app/app/configs/colors.dart';
import 'package:event_app/ui/pages/calender_page.dart';
import 'package:event_app/ui/pages/home_page.dart';
import 'package:event_app/ui/pages/profile_page.dart';
import 'package:event_app/ui/pages/ticket_page.dart';
import 'package:flutter/material.dart';

class MyNavigationBar extends StatefulWidget {
  const MyNavigationBar({super.key});

  @override
  State<MyNavigationBar> createState() => _MyNavigationBarState();
}

class _MyNavigationBarState extends State<MyNavigationBar> {
  final GlobalKey<CurvedNavigationBarState> _bottomNavigationKey = GlobalKey();

  int currentIndex = 0;
  final List<Widget> buildPages = [
    HomePage(),
    const TicketPage(),
    const CalenderPage(),
    const ProfilePage(),
  ];
  @override
  Widget build(BuildContext context) {
    return CurvedNavigationBar(
      key: _bottomNavigationKey,
      index: 0,
      height: 60,
      backgroundColor: AppColors.backgroundColor,
      color: AppColors.primaryLightColor,
      buttonBackgroundColor: AppColors.primaryColor,
      letIndexChange: (index) => true,
      animationCurve: Curves.easeInOut,
      animationDuration: const Duration(milliseconds: 600),
      items: [
        _customIcons("assets/images/home.png", 34.0, 34.0),
        _customIcons("assets/images/ticket.png", 24.0, 24.0),
        _customIcons("assets/images/calendar.png", 24.0, 24.0),
        _customIcons("assets/images/profile.png", 24.0, 24.0),
      ],
      onTap: (int index) {
        // setState(() {
        //   print('Tapped index: $index');
        //
        //   currentIndex = index;
        // });

        //by vineet
        if(index==3){
          Navigator.push(context, MaterialPageRoute(builder: (context) => ProfilePage()));
        }
      },
    );
  }
}

Widget _customIcons(String imagePath, double width, double height) {
  return Image.asset(
    imagePath,
    width: width,
    height: height,
  );
}
