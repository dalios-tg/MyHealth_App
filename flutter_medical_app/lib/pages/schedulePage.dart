import 'package:flutter/material.dart';

class schedulePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Schedule'),
        centerTitle: true,
      ),
      body: Container(
        padding: EdgeInsets.all(16),
        child: ListView(
          children: [
            EventCard(
              title: 'Cardiology Checkup',
              time: '10:00 AM - 11:00 AM',
              location: 'Dr. Smith',
            ),
            SizedBox(height: 16),
            EventCard(
              title: 'Nutrition Consultation',
              time: '12:30 PM - 1:30 PM',
              location: 'Dr. ben hamouda',
            ),
            SizedBox(height: 16),
            EventCard(
              title: 'Physical Therapy Session',
              time: '2:00 PM - 3:30 PM',
              location: 'Dr. ben ahmed',
            ),
            // Add more EventCard widgets for additional events
          ],
        ),
      ),
    );
  }
}

class EventCard extends StatelessWidget {
  final String title;
  final String time;
  final String location;

  EventCard({
    required this.title,
    required this.time,
    required this.location,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 3,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      child: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 8),
            Text(
              time,
              style: TextStyle(
                color: Colors.grey,
              ),
            ),
            SizedBox(height: 8),
            Text(
              location,
              style: TextStyle(
                color: Colors.grey,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
