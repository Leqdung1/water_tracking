import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:water_tracking/core/services/notification_manager.dart';
import 'package:water_tracking/widgets/appbar/app_appbar.dart';

class NotificationHistoryScreen extends StatelessWidget {
  const NotificationHistoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final notificationManager = NotificationManager();

    return Scaffold(
      appBar: const AppAppbar(
        title: 'Notifications',
      ),
      body: StreamBuilder<QuerySnapshot>(
        stream: notificationManager.getUserNotifications(),
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return Center(
              child: Text('Error: ${snapshot.error}'),
            );
          }

          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }

          final notifications = snapshot.data?.docs ?? [];

          if (notifications.isEmpty) {
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.notifications_none,
                    size: 64,
                    color: Colors.grey[400],
                  ),
                  const SizedBox(height: 16),
                  Text(
                    'No notifications yet',
                    style: TextStyle(
                      fontSize: 18,
                      color: Colors.grey[600],
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    'You\'ll see your notifications here',
                    style: TextStyle(
                      fontSize: 14,
                      color: Colors.grey[500],
                    ),
                  ),
                ],
              ),
            );
          }

          return ListView.builder(
            padding: const EdgeInsets.all(16),
            itemCount: notifications.length,
            itemBuilder: (context, index) {
              final notification = notifications[index];
              final data = notification.data() as Map<String, dynamic>;
              final timestamp = data['timestamp'] as Timestamp?;
              final isRead = data['read'] ?? false;

              return Card(
                margin: const EdgeInsets.only(bottom: 12),
                child: ListTile(
                  leading: CircleAvatar(
                    backgroundColor: isRead
                        ? Colors.grey[300]
                        : Theme.of(context).primaryColor,
                    child: Icon(
                      Icons.notifications,
                      color: isRead ? Colors.grey[600] : Colors.white,
                    ),
                  ),
                  title: Text(
                    data['title'] ?? 'Notification',
                    style: TextStyle(
                      fontWeight: isRead ? FontWeight.normal : FontWeight.bold,
                    ),
                  ),
                  subtitle: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        data['body'] ?? '',
                        style: TextStyle(
                          color: isRead ? Colors.grey[600] : Colors.black87,
                        ),
                      ),
                      if (timestamp != null) ...[
                        const SizedBox(height: 4),
                        Text(
                          DateFormat('MMM dd, yyyy - HH:mm')
                              .format(timestamp.toDate()),
                          style: TextStyle(
                            fontSize: 12,
                            color: Colors.grey[500],
                          ),
                        ),
                      ],
                    ],
                  ),
                  trailing: PopupMenuButton<String>(
                    onSelected: (value) {
                      switch (value) {
                        case 'mark_read':
                          if (!isRead) {
                            notificationManager
                                .markNotificationAsRead(notification.id);
                          }
                          break;
                        case 'delete':
                          _showDeleteDialog(
                              context, notification.id, notificationManager);
                          break;
                      }
                    },
                    itemBuilder: (context) => [
                      if (!isRead)
                        const PopupMenuItem(
                          value: 'mark_read',
                          child: Row(
                            children: [
                              Icon(Icons.check_circle_outline),
                              SizedBox(width: 8),
                              Text('Mark as Read'),
                            ],
                          ),
                        ),
                      const PopupMenuItem(
                        value: 'delete',
                        child: Row(
                          children: [
                            Icon(Icons.delete_outline, color: Colors.red),
                            SizedBox(width: 8),
                            Text('Delete', style: TextStyle(color: Colors.red)),
                          ],
                        ),
                      ),
                    ],
                  ),
                  onTap: () {
                    if (!isRead) {
                      notificationManager
                          .markNotificationAsRead(notification.id);
                    }
                    // Handle navigation based on notification data
                    _handleNotificationTap(context, data);
                  },
                ),
              );
            },
          );
        },
      ),
    );
  }

  void _showDeleteDialog(BuildContext context, String notificationId,
      NotificationManager manager) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Delete Notification'),
        content:
            const Text('Are you sure you want to delete this notification?'),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(),
            child: const Text('Cancel'),
          ),
          TextButton(
            onPressed: () {
              manager.deleteNotification(notificationId);
              Navigator.of(context).pop();
            },
            child: const Text(
              'Delete',
              style: TextStyle(color: Colors.red),
            ),
          ),
        ],
      ),
    );
  }

  void _handleNotificationTap(BuildContext context, Map<String, dynamic> data) {
    // Handle navigation based on notification data
    final notificationType = data['type'];
    final screen = data['screen'];

    switch (notificationType) {
      case 'water_reminder':
        // Navigate to home screen
        Navigator.of(context).pushReplacementNamed('/home');
        break;
      case 'achievement':
        // Navigate to report screen
        Navigator.of(context).pushNamed('/report');
        break;
      case 'custom':
        // Navigate to specific screen if provided
        if (screen != null) {
          Navigator.of(context).pushNamed('/$screen');
        }
        break;
      default:
        // Default behavior - do nothing
        break;
    }
  }
}
