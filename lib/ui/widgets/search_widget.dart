import 'dart:convert';

import 'package:event_app/app/resources/constant/named_routes.dart';
import 'package:event_app/data/event_model.dart';
import 'package:event_app/ui/widgets/card_event_this_month.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MaterialApp(
    debugShowCheckedModeBanner: false,
    home: MySearchWidget(),
  ));
}

class MySearchWidget extends StatefulWidget {
  const MySearchWidget({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _MySearchWidgetState createState() => _MySearchWidgetState();
}

class _MySearchWidgetState extends State<MySearchWidget> {
  String searchText = '';
  late List<EventModel> eventList;
  List<EventModel> filteredList = [];

  @override
  void initState() {
    super.initState();
    _loadEvents().then((events) {
      setState(() {
        eventList = events;
      });
    }).catchError((error) {
      Error();
    });
  }

  @override
  Widget build(BuildContext context) {
    filterEvents(); // Call the function to filter events based on searchText
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.only(top: 15),
          child: Column(
            children: [
              Container(
                height: 48,
                width: double.infinity,
                margin: const EdgeInsets.symmetric(horizontal: 24),
                padding: const EdgeInsets.symmetric(horizontal: 16),
                decoration: BoxDecoration(
                  borderRadius: const BorderRadius.all(
                      Radius.circular(24)), // Smaller radius
                  color: Colors.grey[200], // Light grey background
                ),
                child: Row(
                  children: [
                    const Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Icon(Icons.search,
                          color: Colors.grey), // Grey search icon
                    ),
                    const SizedBox(width: 8),
                    Expanded(
                      child: TextField(
                        onChanged: (text) {
                          setState(() {
                            searchText = text;
                          });
                        },
                        style: const TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.w400,
                        ),
                        decoration: InputDecoration(
                          hintText: 'Search...',
                          hintStyle: TextStyle(
                            color: Colors.grey.withOpacity(0.5),
                            fontWeight: FontWeight.w400,
                          ),
                          border: InputBorder.none,
                          contentPadding: EdgeInsets.zero,
                        ),
                      ),
                    ),
                    IconButton(
                      icon: const Icon(Icons.clear,
                          color: Colors.grey), // Grey clear icon
                      onPressed: () {
                        setState(() {
                          searchText = ''; // Clear search text
                          Navigator.pop(context);
                        });
                      },
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 15),
              const Text("Searched Result"),
              const SizedBox(height: 15),
              searchText != ""
                  ? Expanded(
                      child: ListView.builder(
                        itemCount: filteredList.length,
                        itemBuilder: (context, index) {
                          return GestureDetector(
                            onTap: (() => Navigator.pushNamed(
                                arguments: eventList[index].toJson(),
                                context,
                                NamedRoutes.detailScreen)),
                            child: CardEventThisMonth(
                              eventModel: filteredList[index],
                            ),
                          );
                        },
                      ),
                    )
                  : const Center(child: Text("No Events")),
            ],
          ),
        ),
      ),
    );
  }

  void filterEvents() {
    if (searchText.isEmpty) {
      setState(() {
        filteredList = []; // If search text is empty, show an empty list
      });
    } else {
      List<EventModel> tempFilteredList = [];
      for (var event in eventList) {
        if (event.title.toLowerCase().contains(searchText.toLowerCase())) {
          print(event.title.toLowerCase());
          tempFilteredList.add(event);
        }
      }
      setState(() {
        filteredList = tempFilteredList; // Set the filtered
      });
    }
  }

  Future<List<EventModel>> _loadEvents() async {
    String jsonString = await EventModel.getJson();
    List<dynamic> jsonList = json.decode(jsonString);
    return jsonList.map((json) => EventModel.fromJson(json)).toList();
  }
}
