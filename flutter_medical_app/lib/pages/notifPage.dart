import 'package:flutter/material.dart';

class notifPage extends StatefulWidget {
  const notifPage({super.key});

  @override
  State<notifPage> createState() => _notifPageState();
}

class _notifPageState extends State<notifPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Health Care Notifications'),
        centerTitle: true,
      ),
      body: Container(
        padding: EdgeInsets.all(16),
        child: ListView(
          children: [
            HealthNotificationCard(
              title: 'Appointment Reminder',
              time: 'Today, 2:30 PM',
              content: 'You have a cardiology checkup with Dr. Smith.',
            ),
            SizedBox(height: 16),
            HealthNotificationCard(
              title: 'Medication Reminder',
              time: 'Tomorrow, 8:00 AM',
              content: 'Remember to take your prescribed medication.',
            ),
            SizedBox(height: 16),
            HealthNotificationCard(
              title: 'Upcoming Event',
              time: 'Next Week, 10:00 AM',
              content: 'Join the nutrition workshop for healthy living.',
            ),
            // Add more HealthNotificationCard widgets for additional notifications
          ],
        ),
      ),
    );
  }
}

class HealthNotificationCard extends StatelessWidget {
  final String title;
  final String time;
  final String content;

  HealthNotificationCard({
    required this.title,
    required this.time,
    required this.content,
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
              content,
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
