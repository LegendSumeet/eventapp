import 'dart:convert';
import 'package:event_app/app/configs/colors.dart';
import 'package:event_app/app/resources/constant/named_routes.dart';
import 'package:event_app/data/event_model.dart';
import 'package:event_app/ui/widgets/card_event_this_month.dart';
import 'package:flutter/material.dart';

class ViewAllPage extends StatelessWidget {
  final bool isPopularEvent;

  const ViewAllPage({
    super.key,
    required this.isPopularEvent,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
      body: FutureBuilder<List<EventModel>>(
        future: _loadEvents(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return const Center(child: Text('No data available.'));
          } else {
            return EventList(
              events: snapshot.data!,
              isPopularEvent: isPopularEvent,
            );
          }
        },
      ),
    );
  }

  Future<List<EventModel>> _loadEvents() async {
    String jsonString = await EventModel.getJson();
    List<dynamic> jsonList = json.decode(jsonString);
    return jsonList.map((json) => EventModel.fromJson(json)).toList();
  }
}

class EventList extends StatelessWidget {
  final List<EventModel> events;
  final bool isPopularEvent;

  const EventList({super.key, required this.events, required this.isPopularEvent});

  @override
  Widget build(BuildContext context) {
    List<EventModel> displayedEvents =
        isPopularEvent ? events : events.reversed.toList();

    return ListView.builder(
      itemCount: displayedEvents.length,
      itemBuilder: (context, index) {
        return GestureDetector(
          onTap: (() => Navigator.pushNamed(
              arguments: displayedEvents[index].toJson(),
              context,
              NamedRoutes.detailScreen)),
          child: CardEventThisMonth(
            eventModel: displayedEvents[index],
          ),
        );
      },
    );
  }
}
