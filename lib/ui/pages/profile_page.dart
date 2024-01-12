import 'package:flutter/material.dart';
import 'package:event_app/app/configs/colors.dart';
import 'package:event_app/app/configs/theme.dart';
import 'package:event_app/ui/pages/edit_profile_page.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({Key? key});

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: Themes.lightTheme, // Apply the custom light theme
      child: Scaffold(
        backgroundColor: AppColors.backgroundColor,
        appBar: AppBar(
          title: const Text(""),
          actions: [
            IconButton(
              onPressed: () {},
              icon: const Icon(Icons.wb_sunny),
            ),
          ],
          iconTheme: const IconThemeData(
            color: AppColors.blackColor,
          ),
          backgroundColor: AppColors.backgroundColor,
        ),
        body: ListView(
          children: [
            Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Stack(
                    alignment: Alignment.bottomRight,
                    children: <Widget>[
                      const CircleAvatar(
                        backgroundImage: NetworkImage(
                            "https://avatars.githubusercontent.com/u/85386116?s=400&u=81f5587a31a3c80319ed97931c1001636a663198&v=4"),
                        radius: 70,
                      ),
                      Padding(
                        padding: const EdgeInsets.all(1.0),
                        child: Container(
                          margin: const EdgeInsets.all(1.0),
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: Colors.black,
                            border: Border.all(
                              color: Colors.white, // Border color
                              width: 2.0, // Border width
                            ),
                          ),
                          child: IconButton(
                            onPressed: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          const EditProfile()));
                            },
                            icon: const Icon(Icons.edit),
                            color: AppColors.whiteColor, // Icon color
                          ),
                        ),
                      ),
                    ],
                  ),

                  const SizedBox(height: 10),
                  Text(
                    'Sarah Alba',
                    style: Theme.of(context).textTheme.bodyLarge,
                  ),

                  Text(
                    "xyz@gmail.com",
                    style: Theme.of(context).textTheme.bodySmall,
                  ),

                  const SizedBox(
                    height: 20,
                  ),

                  TextButton(
                    onPressed: () {},
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all<Color>(
                        Color(0xFF159BD3),
                      ),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.only(
                        top: 2.0,
                        right: 18.0,
                        bottom: 2.0,
                        left: 18.0,
                      ),
                      child: Text(
                        'Upgrade to Pro',
                        style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                              color: AppColors.blackColor,
                              fontWeight: FontWeight.bold,
                            ),
                      ),
                    ),
                  ),

                  const SizedBox(height: 35),

                  IntrinsicHeight(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Column(
                          children: <Widget>[
                            Text(
                              '4.8',
                              style: Theme.of(context).textTheme.bodyLarge,
                            ),
                            Text(
                              "Ranking",
                              style: Theme.of(context).textTheme.bodySmall,
                            ),
                          ],
                        ),

                        SizedBox(
                            width:
                                10), // Add space between Widget 1 and VerticalDivider

                        SizedBox(
                          height: 30, // Set the desired height for the divider
                          child: VerticalDivider(
                            color: Colors.black,
                            thickness: 1,
                            width: 20,
                          ),
                        ),

                        SizedBox(width: 10),

                        Column(
                          children: <Widget>[
                            Text(
                              '35',
                              style: Theme.of(context).textTheme.bodyLarge,
                            ),
                            Text(
                              "following",
                              style: Theme.of(context).textTheme.bodySmall,
                            ),
                          ],
                        ),

                        SizedBox(
                            width:
                                10), // Add space between Widget 1 and VerticalDivider

                        SizedBox(
                          height: 30, // Set the desired height for the divider
                          child: VerticalDivider(
                            color: Colors.black,
                            thickness: 1,
                            width: 20,
                          ),
                        ),

                        SizedBox(width: 10),
                        Column(
                          children: <Widget>[
                            Text(
                              '50',
                              style: Theme.of(context).textTheme.bodyLarge,
                            ),
                            Text(
                              "Followers",
                              style: Theme.of(context).textTheme.bodySmall,
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),

                  const SizedBox(height: 40),

                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        padding: const EdgeInsets.only(left: 20, right: 20),
                        child: Text(
                          'About',
                          style: Theme.of(context).textTheme.bodyLarge,
                        ),
                        color: Colors.grey,
                      ),
                      // Add other widgets for additional information
                    ],
                  ),

                  const SizedBox(
                      height:
                          10.0), // Add some space between "About" section and user description
                  Container(
                    padding: const EdgeInsets.only(left: 50, right: 50),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        _buildAboutBox(context, 'Lorem ipsum dolor sit amet,'),
                        _buildAboutBox(context, 'consectetur adipiscing elit.'),
                        _buildAboutBox(context,
                            'Sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.'),
                        _buildAboutBox(context,
                            'Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.'),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildAboutBox(BuildContext context, String text) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 8),
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 1,
            blurRadius: 5,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: Text(
        text,
        style: Theme.of(context).textTheme.bodySmall,
      ),
    );
  }
}
