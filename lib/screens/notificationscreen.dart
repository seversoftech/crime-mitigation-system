import 'package:flutter/material.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';

import '../models/notification_model.dart';
import '../widgets/notification_widget.dart';

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
      body: ListView.builder(
        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
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

final List<NotificationItem> notifications = [
  const NotificationItem(
    title: 'New Message',
    message: 'You have a new message from John Doe.',
    time: '1h ago',
    iconData: LineAwesomeIcons.bell,
  ),
  const NotificationItem(
    title: 'New Message',
    message: 'You have a new message from John Doe.',
    time: '1h ago',
    iconData: LineAwesomeIcons.bell,
  ),
  const NotificationItem(
    title: 'New Message',
    message: 'You have a new message from John Doe.',
    time: '1h ago',
    iconData: LineAwesomeIcons.bell,
  ),
  const NotificationItem(
    title: 'New Message',
    message: 'You have a new message from John Doe.',
    time: '1h ago',
    iconData: LineAwesomeIcons.bell,
  ),
  const NotificationItem(
    title: 'New Message',
    message: 'You have a new message from John Doe.',
    time: '1h ago',
    iconData: LineAwesomeIcons.bell,
  ),
  const NotificationItem(
    title: 'New Message',
    message: 'You have a new message from John Doe.',
    time: '1h ago',
    iconData: LineAwesomeIcons.bell,
  ),
  const NotificationItem(
    title: 'New Message',
    message: 'You have a new message from John Doe.',
    time: '1h ago',
    iconData: LineAwesomeIcons.bell,
  ),
  const NotificationItem(
    title: 'New Message',
    message: 'You have a new message from John Doe.',
    time: '1h ago',
    iconData: LineAwesomeIcons.bell,
  ),
  const NotificationItem(
    title: 'New Message',
    message: 'You have a new message from John Doe.',
    time: '1h ago',
    iconData: LineAwesomeIcons.bell,
  ),
  const NotificationItem(
    title: 'New Message',
    message: 'You have a new message from John Doe.',
    time: '1h ago',
    iconData: LineAwesomeIcons.bell,
  ),
  const NotificationItem(
    title: 'New Message',
    message: 'You have a new message from John Doe.',
    time: '1h ago',
    iconData: LineAwesomeIcons.bell,
  ),
  const NotificationItem(
    title: 'New Message',
    message: 'You have a new message from John Doe.',
    time: '1h ago',
    iconData: LineAwesomeIcons.bell,
  ),
  // Add more NotificationItem objects as needed
];
