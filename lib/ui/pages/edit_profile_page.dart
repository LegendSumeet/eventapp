import 'package:flutter/material.dart';
import 'package:event_app/app/configs/colors.dart';


class EditProfile extends StatelessWidget{

  const EditProfile({super.key});

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
                            // Add your edit button functionality here
                          },
                          icon: const Icon(Icons.add_a_photo),
                          color: Colors.white, // Icon color
                        ),
                      ),
                    ),
                  ],
                ),

                const SizedBox(height: 16),

                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 25.0),
                      child: const Text(
                        'Full name',
                        style: TextStyle(
                          color: AppColors.whiteColor,
                          fontSize: 18.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    // Add other widgets for additional information
                  ],
                ),

                const SizedBox(height: 8),

                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25.0),
                  child: TextField(
                    decoration: InputDecoration(
                      enabledBorder: OutlineInputBorder(
                        borderSide: const BorderSide(color: AppColors.whiteColor),
                        borderRadius: BorderRadius.circular(15.0),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: const BorderSide(color: AppColors.whiteColor),
                        borderRadius: BorderRadius.circular(15.0),
                      ),
                      fillColor: Colors.black12,
                      filled: true,
                      hintText: "Sarah Alba",
                      hintStyle: const TextStyle(color: AppColors.greyTextColor),
                    ),
                  ),
                ),

                const SizedBox(height: 16),

                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 25.0),
                      child: const Text(
                        'Email',
                        style: TextStyle(
                          color: AppColors.whiteColor,
                          fontSize: 18.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    // Add other widgets for additional information
                  ],
                ),

                const SizedBox(height: 8),

                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25.0),
                  child: TextField(
                    decoration: InputDecoration(
                      enabledBorder: OutlineInputBorder(
                        borderSide: const BorderSide(color: AppColors.whiteColor),
                        borderRadius: BorderRadius.circular(15.0),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: const BorderSide(color: AppColors.whiteColor),
                        borderRadius: BorderRadius.circular(15.0),
                      ),
                      fillColor: Colors.black12,
                      filled: true,
                      hintText: "xyz@gmail.com",
                      hintStyle: const TextStyle(color: AppColors.greyTextColor),
                    ),
                  ),
                ),

                const SizedBox(height: 16),

                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 25.0),
                      child: const Text(
                        'About',
                        style: TextStyle(
                          color: AppColors.whiteColor,
                          fontSize: 18.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    // Add other widgets for additional information
                  ],
                ),

                const SizedBox(height: 8),

                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25.0),
                  child: TextField(
                    keyboardType: TextInputType.multiline,
                    minLines: 1,//Normal textInputField will be displayed
                    maxLines: 5,
                    decoration: InputDecoration(
                      enabledBorder: OutlineInputBorder(
                        borderSide: const BorderSide(color: AppColors.whiteColor),
                        borderRadius: BorderRadius.circular(15.0),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: const BorderSide(color: AppColors.whiteColor),
                        borderRadius: BorderRadius.circular(15.0),
                      ),
                      fillColor: Colors.black12,
                      filled: true,
                      hintText: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, ',
                      hintStyle: const TextStyle(color: AppColors.greyTextColor),
                    ),
                  ),
                ),

                const SizedBox(height: 20),


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
                      right: 128.0,
                      bottom: 2.0,
                      left: 128.0,
                    ),
                    child: Text(
                      'Save',
                      style: TextStyle(
                          color: AppColors.whiteColor,
                          fontSize: 15.0,
                          fontWeight: FontWeight.bold),
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