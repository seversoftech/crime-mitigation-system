import 'package:flutter/material.dart';

class NotificationScreen extends StatefulWidget {
  const NotificationScreen({super.key});

  @override
  State<NotificationScreen> createState() => _NotificationScreenState();
}

class _NotificationScreenState extends State<NotificationScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Notifications'),
      ),
      body: ListView(
        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
        children: const [
          NotificationCard(
            title: 'New Message',
            message: 'You have a new message from John Doe.',
            time: '1h ago',
            iconData: Icons.mail,
          ),
          NotificationCard(
            title: 'New Comment',
            message: 'Jane Doe commented on your post.',
            time: '2h ago',
            iconData: Icons.comment,
          ),
          NotificationCard(
            title: 'Reminder',
            message: 'Don\'t forget to submit your report.',
            time: '3h ago',
            iconData: Icons.alarm,
          ),
          // Add more NotificationCard widgets as needed
        ],
      ),
    );
  }
}

class NotificationCard extends StatelessWidget {
  final String title;
  final String message;
  final String time;
  final IconData iconData;

  const NotificationCard({
    Key? key,
    required this.title,
    required this.message,
    required this.time,
    required this.iconData,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2.0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12.0),
      ),
      child: ListTile(
        leading: Icon(iconData),
        title: Text(
          title,
          style: const TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
        subtitle: Text(message),
        trailing: Text(time),
        onTap: () {
          // Handle notification tap
        },
      ),
    );
  }
}
