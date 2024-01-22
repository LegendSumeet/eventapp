import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';

class CalendarPage extends StatefulWidget {
  const CalendarPage({Key? key}) : super(key: key);

  @override
  _CalendarPageState createState() => _CalendarPageState();
}

class _CalendarPageState extends State<CalendarPage> {
  Map<DateTime, List<dynamic>> _events = {};

  @override
  void initState() {
    super.initState();
    _events = {
      DateTime(2024, 1, 15): ['Event 1'],
      DateTime(2024, 1, 20): ['Event 2'],
      DateTime(2024, 1, 25): ['Event 3'],
    };
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Event Calendar'),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            TableCalendar(
              focusedDay: DateTime.now(),
              firstDay: DateTime(2024, 1, 1),
              lastDay: DateTime(2024, 12, 31),
              calendarBuilders: CalendarBuilders(
                todayBuilder: (context, date, events) {
                  final dayEvents = _events[date] ?? [];
                  return Container(
                    margin: const EdgeInsets.all(4.0),
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      color: Colors.blue,
                      shape: BoxShape.circle,
                    ),
                    child: Text(
                      date.day.toString(),
                      style: TextStyle(color: Colors.white),
                    ),
                  );
                },
              ),
              /*onDaySelected: (date, events, holidays) {
                // Handle day selection
                _handleDaySelection(date, events, holidays);
              },*/
            ),
            SizedBox(height: 20),
            _buildEventList(),
          ],
        ),
      ),
    );
  }

  void _handleDaySelection(
      DateTime date, List<dynamic> events, List<dynamic> holidays) {
    // Implement your logic when a day is selected
    print('Selected date: $date');
  }

  Widget _buildEventList() {
    final selectedDayEvents = _events[DateTime.now()] ?? [];

    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: selectedDayEvents
            .map((event) => ListTile(
                  title: Text(event),
                ))
            .toList(),
      ),
    );
  }
}
