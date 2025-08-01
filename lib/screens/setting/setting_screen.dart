import 'package:flutter/material.dart';

import '../../i18n/strings.g.dart';
import '../login/login_screen.dart';
import '../notification_settings/notification_settings_screen.dart';
import '../notification_history/notification_history_screen.dart';
import '../../core/services/notification_manager.dart';

class SettingScreen extends StatelessWidget {
  const SettingScreen({super.key});

  void _logout(BuildContext context) async {
    // Clean up notifications before logout
    await NotificationManager().cleanupOnLogout();

    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (context) => const LoginScreen(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Cài đặt'),
      ),
      body: ListView(
        physics: const NeverScrollableScrollPhysics(),
        padding: const EdgeInsets.symmetric(
          horizontal: 15,
        ),
        children: [
          // Notification Settings
          ListTile(
            leading: const Icon(Icons.notifications),
            title: const Text(
              'Notification Settings',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w500,
              ),
            ),
            subtitle: const Text('Configure water reminders'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const NotificationSettingsScreen(),
                ),
              );
            },
          ),

          // Notification History
          ListTile(
            leading: const Icon(Icons.history),
            title: const Text(
              'Notification History',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w500,
              ),
            ),
            subtitle: const Text('View your notifications'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const NotificationHistoryScreen(),
                ),
              );
            },
          ),

          const Divider(),

          // Logout
          ListTile(
            onTap: () => _logout(context),
            title: Text(
              t.core.logout,
              style: TextStyle(
                color: Colors.red,
                fontSize: 16,
                fontWeight: FontWeight.w500,
              ),
            ),
          )
        ],
      ),
    );
  }
}
