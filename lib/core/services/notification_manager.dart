import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:water_tracking/core/services/notification_service.dart';

class NotificationManager {
  static final NotificationManager _instance = NotificationManager._internal();
  factory NotificationManager() => _instance;
  NotificationManager._internal();

  final NotificationService _notificationService = NotificationService();
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final FirebaseAuth _auth = FirebaseAuth.instance;

  // Save FCM token to user's document in Firestore
  Future<void> saveFCMTokenToFirestore() async {
    try {
      final user = _auth.currentUser;
      if (user != null) {
        final token = await _notificationService.getFCMToken();
        if (token != null) {
          await _firestore.collection('users').doc(user.uid).update({
            'fcmToken': token,
            'lastTokenUpdate': FieldValue.serverTimestamp(),
          });
          print('FCM token saved to Firestore');
        }
      }
    } catch (e) {
      print('Error saving FCM token to Firestore: $e');
    }
  }

  // Subscribe user to general water tracking topic
  Future<void> subscribeToWaterTrackingTopic() async {
    try {
      await _notificationService.subscribeToTopic('water_tracking');
      print('Subscribed to water_tracking topic');
    } catch (e) {
      print('Error subscribing to water_tracking topic: $e');
    }
  }

  // Subscribe user to personalized topic based on their user ID
  Future<void> subscribeToPersonalTopic() async {
    try {
      final user = _auth.currentUser;
      if (user != null) {
        await _notificationService.subscribeToTopic('user_${user.uid}');
        print('Subscribed to personal topic: user_${user.uid}');
      }
    } catch (e) {
      print('Error subscribing to personal topic: $e');
    }
  }

  // Unsubscribe from topics when user logs out
  Future<void> unsubscribeFromTopics() async {
    try {
      final user = _auth.currentUser;
      if (user != null) {
        await _notificationService.unsubscribeFromTopic('water_tracking');
        await _notificationService.unsubscribeFromTopic('user_${user.uid}');
        print('Unsubscribed from topics');
      }
    } catch (e) {
      print('Error unsubscribing from topics: $e');
    }
  }

  // Initialize notification manager for logged-in user
  Future<void> initializeForUser() async {
    await saveFCMTokenToFirestore();
    await subscribeToWaterTrackingTopic();
    await subscribeToPersonalTopic();
  }

  // Clean up when user logs out
  Future<void> cleanupOnLogout() async {
    await unsubscribeFromTopics();
  }

  // Send notification to specific user (for admin purposes)
  Future<void> sendNotificationToUser({
    required String userId,
    required String title,
    required String body,
    Map<String, dynamic>? data,
  }) async {
    try {
      await _firestore.collection('notifications').add({
        'userId': userId,
        'title': title,
        'body': body,
        'data': data ?? {},
        'timestamp': FieldValue.serverTimestamp(),
        'read': false,
      });
      print('Notification sent to user: $userId');
    } catch (e) {
      print('Error sending notification to user: $e');
    }
  }

  // Send notification to all users (for admin purposes)
  Future<void> sendNotificationToAllUsers({
    required String title,
    required String body,
    Map<String, dynamic>? data,
  }) async {
    try {
      await _firestore.collection('notifications').add({
        'topic': 'water_tracking',
        'title': title,
        'body': body,
        'data': data ?? {},
        'timestamp': FieldValue.serverTimestamp(),
      });
      print('Notification sent to all users');
    } catch (e) {
      print('Error sending notification to all users: $e');
    }
  }

  // Get user's notification history
  Stream<QuerySnapshot> getUserNotifications() {
    final user = _auth.currentUser;
    if (user != null) {
      return _firestore
          .collection('notifications')
          .where('userId', isEqualTo: user.uid)
          .orderBy('timestamp', descending: true)
          .snapshots();
    }
    return Stream.empty();
  }

  // Mark notification as read
  Future<void> markNotificationAsRead(String notificationId) async {
    try {
      await _firestore.collection('notifications').doc(notificationId).update({
        'read': true,
      });
    } catch (e) {
      print('Error marking notification as read: $e');
    }
  }

  // Delete notification
  Future<void> deleteNotification(String notificationId) async {
    try {
      await _firestore.collection('notifications').doc(notificationId).delete();
    } catch (e) {
      print('Error deleting notification: $e');
    }
  }
}
