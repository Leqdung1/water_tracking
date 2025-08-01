# Firebase Cloud Messaging (FCM) & Local Notifications Setup

This guide will help you set up push notifications (FCM) and local notifications for your water tracking app.

## 🚀 Features Implemented

### Push Notifications (FCM)

- ✅ Firebase Cloud Messaging integration
- ✅ Automatic FCM token management
- ✅ Topic-based subscriptions
- ✅ Background message handling
- ✅ Foreground message handling

### Local Notifications

- ✅ Scheduled water reminders
- ✅ Customizable reminder times
- ✅ Day-of-week selection
- ✅ Test notification functionality
- ✅ Notification history tracking

## 📋 Prerequisites

1. **Firebase Project**: You need a Firebase project with FCM enabled
2. **Google Services File**: `google-services.json` for Android
3. **Apple Services File**: `GoogleService-Info.plist` for iOS

## 🔧 Firebase Console Setup

### 1. Create Firebase Project

1. Go to [Firebase Console](https://console.firebase.google.com/)
2. Create a new project or select existing one
3. Enable Authentication (Email/Password)
4. Enable Firestore Database

### 2. Enable Cloud Messaging

1. In Firebase Console, go to **Project Settings**
2. Navigate to **Cloud Messaging** tab
3. Note down your **Server Key** (you'll need this for sending notifications)

### 3. Add Android App

1. In Project Settings, click **Add app** → **Android**
2. Enter your package name: `com.example.water_tracking`
3. Download `google-services.json`
4. Place it in `android/app/` directory

### 4. Add iOS App (if needed)

1. In Project Settings, click **Add app** → **iOS**
2. Enter your bundle ID
3. Download `GoogleService-Info.plist`
4. Place it in `ios/Runner/` directory

## 📱 App Configuration

### Android Configuration

The following files have been configured:

1. **AndroidManifest.xml**: Added FCM permissions and service
2. **colors.xml**: Added notification color resource
3. **build.gradle**: Dependencies are already added

### iOS Configuration (if needed)

1. Add `GoogleService-Info.plist` to your iOS project
2. Enable push notifications in Xcode capabilities
3. Configure APNs certificates in Firebase Console

## 🎯 Usage Examples

### 1. Schedule Water Reminders

```dart
// Schedule daily water reminders at 9:00 AM
await NotificationService().scheduleWaterReminder(
  time: const TimeOfDay(hour: 9, minute: 0),
  days: [true, true, true, true, true, true, true], // Mon-Sun
  title: 'Time to drink water! 💧',
  body: 'Stay hydrated and healthy!',
);
```

### 2. Show Immediate Notification

```dart
// Show a test notification
await NotificationService().showWaterReminder(
  title: 'Test Notification',
  body: 'This is a test notification!',
);
```

### 3. Subscribe to FCM Topics

```dart
// Subscribe to general water tracking topic
await NotificationService().subscribeToTopic('water_tracking');

// Subscribe to user-specific topic
await NotificationService().subscribeToTopic('user_${userId}');
```

### 4. Send Push Notifications

```dart
// Send to specific user
await NotificationManager().sendNotificationToUser(
  userId: 'user123',
  title: 'Achievement Unlocked! 🏆',
  body: 'You\'ve reached your daily water goal!',
  data: {'type': 'achievement', 'screen': 'report'},
);

// Send to all users
await NotificationManager().sendNotificationToAllUsers(
  title: 'App Update Available',
  body: 'New features have been added to the app!',
);
```

## 📊 Firestore Collections

The app uses the following Firestore collections:

### Users Collection

```json
{
  "uid": "user123",
  "email": "user@example.com",
  "fcmToken": "fcm_token_here",
  "lastTokenUpdate": "timestamp",
  "notificationSettings": {
    "enabled": true,
    "reminderTime": "09:00",
    "selectedDays": [true, true, true, true, true, true, true]
  }
}
```

### Notifications Collection

```json
{
  "userId": "user123",
  "title": "Water Reminder",
  "body": "Time to drink water!",
  "type": "water_reminder",
  "screen": "home",
  "data": {},
  "timestamp": "timestamp",
  "read": false
}
```

## 🔄 Testing Notifications

### 1. Test Local Notifications

1. Open the app
2. Go to Settings → Notification Settings
3. Enable water reminders
4. Set a time for 1-2 minutes from now
5. Tap "Test Notification" to see immediate notification

### 2. Test FCM Push Notifications

1. Get FCM token from console logs
2. Use Firebase Console or Postman to send test message
3. Or use the NotificationManager methods in code

### 3. Test Background Notifications

1. Send FCM message while app is in background
2. Tap notification to open app
3. Check notification history

## 🛠️ Troubleshooting

### Common Issues

1. **Notifications not showing on Android**

   - Check notification permissions
   - Verify notification channels are created
   - Check if battery optimization is disabled

2. **FCM token not generated**

   - Verify `google-services.json` is in correct location
   - Check Firebase project configuration
   - Ensure internet connection

3. **Scheduled notifications not working**
   - Check device battery optimization settings
   - Verify timezone initialization
   - Check notification permissions

### Debug Commands

```bash
# Check FCM token
flutter logs | grep "FCM Token"

# Check notification service initialization
flutter logs | grep "NotificationService"

# Test notification permissions
flutter logs | grep "permission"
```

## 📱 Screens Added

1. **Notification Settings Screen** (`/notification_settings`)

   - Configure water reminder times
   - Select reminder days
   - Test notifications
   - Enable/disable reminders

2. **Notification History Screen** (`/notification_history`)
   - View all notifications
   - Mark as read/unread
   - Delete notifications
   - Navigate based on notification type

## 🔐 Security Rules

Add these Firestore security rules:

```javascript
rules_version = '2';
service cloud.firestore {
  match /databases/{database}/documents {
    // Users can only access their own data
    match /users/{userId} {
      allow read, write: if request.auth != null && request.auth.uid == userId;
    }

    // Users can only access their own notifications
    match /notifications/{notificationId} {
      allow read, write: if request.auth != null &&
        resource.data.userId == request.auth.uid;
    }
  }
}
```

## 🎉 Next Steps

1. **Customize Notification Content**: Modify notification titles and messages
2. **Add More Notification Types**: Achievement notifications, goal reminders, etc.
3. **Implement Notification Actions**: Add buttons to notifications
4. **Add Notification Analytics**: Track notification engagement
5. **Implement Smart Reminders**: AI-powered reminder timing

## 📞 Support

If you encounter any issues:

1. Check the troubleshooting section above
2. Verify Firebase Console configuration
3. Check device notification settings
4. Review console logs for error messages

---

**Note**: Make sure to test notifications on both Android and iOS devices, as behavior can differ between platforms.
