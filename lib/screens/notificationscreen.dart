import 'package:flutter/material.dart';

import '../widgets/notification_widget.dart';

class NotificationScreen extends StatelessWidget {
  final List<NotificationItem> notifications = [
    NotificationItem(
      title: 'New Message',
      message: 'You have a new message from John Doe.',
      time: '1h ago',
      iconData: Icons.mail,
    ),
    NotificationItem(
      title: 'New Comment',
      message: 'Jane Doe commented on your post.',
      time: '2h ago',
      iconData: Icons.comment,
    ),
    NotificationItem(
      title: 'Reminder',
      message: 'Don\'t forget to submit your report.',
      time: '3h ago',
      iconData: Icons.alarm,
    ),
    // Add more NotificationItem objects as needed
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Notifications'),
      ),
      body: ListView.builder(
        padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
        itemCount: notifications.length,
        itemBuilder: (context, index) {
          final notification = notifications[index];
          return NotificationCard(
            title: notification.title,
            message: notification.message,
            time: notification.time,
            iconData: notification.iconData,
          );
        },
      ),
    );
  }
}

class NotificationItem {
  final String title;
  final String message;
  final String time;
  final IconData iconData;

  const NotificationItem({
    required this.title,
    required this.message,
    required this.time,
    required this.iconData,
  });
}

// class NotificationCard extends StatelessWidget {
//   final String title;
//   final String message;
//   final String time;
//   final IconData iconData;

//   const NotificationCard({
//     Key? key,
//     required this.title,
//     required this.message,
//     required this.time,
//     required this.iconData,
//   }) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Card(
//       elevation: 2.0,
//       shape: RoundedRectangleBorder(
//         borderRadius: BorderRadius.circular(12.0),
//       ),
//       child: ListTile(
//         leading: Icon(iconData),
//         title: Text(
//           title,
//           style: TextStyle(
//             fontWeight: FontWeight.bold,
//           ),
//         ),
//         subtitle: Text(message),
//         trailing: Text(time),
//         onTap: () {
//           // Handle notification tap
//         },
//       ),
//     );
//   }
// }
