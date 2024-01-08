import 'package:event_app/ui/pages/edit_profile_page.dart';
import 'package:flutter/material.dart';
import 'package:event_app/app/configs/colors.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0x800A0E21),
      appBar: AppBar(
        title: const Text(""),
        actions: [
          IconButton(
            onPressed: (){},
            icon: const Icon(Icons.wb_sunny),
          ),
        ],
        iconTheme: const IconThemeData(
          color: Colors.white,
        ),
        backgroundColor: const Color(0x800A0E21),
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
                      backgroundImage: NetworkImage("https://avatars.githubusercontent.com/u/85386116?s=400&u=81f5587a31a3c80319ed97931c1001636a663198&v=4"),
                      radius: 70,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(1.0),
                      child: Container(
                        margin: const EdgeInsets.all(1.0),
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: Colors.blue,
                          border: Border.all(
                            color: Colors.white, // Border color
                            width: 2.0, // Border width
                          ),// Background color of the circular button
                        ),
                        child: IconButton(
                          onPressed: () {
                            Navigator.push(context, MaterialPageRoute(builder: (context) => const EditProfile()));
                          },
                          icon: const Icon(Icons.edit),
                          color: Colors.white, // Icon color
                        ),
                      ),
                    ),
                  ],
                ),

                const SizedBox(height: 10),
                const Text(
                  'Sarah Alba',
                  style: TextStyle(
                      color: AppColors.whiteColor,
                      fontSize: 22.0,
                      fontWeight: FontWeight.bold),
                ),

                const Text(
                  "xyz@gmail.com",
                  style: TextStyle(
                    fontSize: 15,
                    color: AppColors.greyTextColor,
                    fontWeight: FontWeight.w400,
                  ),
                ),

                const SizedBox(height: 20,),

                TextButton(
                  onPressed: (){},
                  style: const ButtonStyle(
                    backgroundColor: MaterialStatePropertyAll<Color>(
                      Color(0xFF159BD3),
                    ),
                  ),
                  child: const Padding(
                    padding: EdgeInsets.only(
                      top: 2.0,
                      right: 18.0,
                      bottom: 2.0,
                      left: 18.0,
                    ),
                    child: Text(
                      'Upgrade to Pro',
                      style: TextStyle(
                          color: AppColors.whiteColor,
                          fontSize: 15.0,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                ),

                const SizedBox(height: 35),

                const IntrinsicHeight(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Column(
                        children: <Widget>[
                          Text(
                            '4.8',
                            style: TextStyle(
                                color: AppColors.whiteColor,
                                fontSize: 19.0,
                                fontWeight: FontWeight.bold),
                          ),
                          Text(
                            "Ranking",
                            style: TextStyle(
                              fontSize: 13,
                              color: AppColors.whiteColor,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),

                      SizedBox(width: 10), // Add space between Widget 1 and VerticalDivider

                      SizedBox(
                        height: 30, // Set the desired height for the divider
                        child: VerticalDivider(
                          color: Colors.blue,
                          thickness: 1,
                          width: 20,
                        ),
                      ),

                      SizedBox(width: 10),

                      Column(
                        children: <Widget>[
                          Text(
                            '35',
                            style: TextStyle(
                                color: AppColors.whiteColor,
                                fontSize: 19.0,
                                fontWeight: FontWeight.bold),
                          ),
                          Text(
                            "following",
                            style: TextStyle(
                              fontSize: 13,
                              color: AppColors.whiteColor,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),

                      SizedBox(width: 10), // Add space between Widget 1 and VerticalDivider

                      SizedBox(
                        height: 30, // Set the desired height for the divider
                        child: VerticalDivider(
                          color: Colors.blue,
                          thickness: 1,
                          width: 20,
                        ),
                      ),

                      SizedBox(width: 10),
                      Column(
                        children: <Widget>[
                          Text(
                            '50',
                            style: TextStyle(
                                color: AppColors.whiteColor,
                                fontSize: 19.0,
                                fontWeight: FontWeight.bold),
                          ),
                          Text(
                            "Followers",
                            style: TextStyle(
                              fontSize: 13,
                              color: AppColors.whiteColor,
                              fontWeight: FontWeight.bold,
                            ),
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
                      padding: const EdgeInsets.only(left: 50),
                      child: const Text(
                        'About',
                        style: TextStyle(
                          color: AppColors.whiteColor,
                          fontSize: 22.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    // Add other widgets for additional information
                  ],
                ),

                const SizedBox(height: 10.0), // Add some space between "About" section and user description
                Container(
                  padding: const EdgeInsets.only(left: 50,right: 50),
                  child: const Text(
                    'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, ',
                    style: TextStyle(
                      fontSize: 16.0,
                      color: AppColors.whiteColor,
                    ),
                  ),
                ),
              ],

            ),
          ),
        ],
      ),
    );
  }
}

