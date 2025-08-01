import 'package:flutter/material.dart';
import 'package:water_tracking/core/services/notification_service.dart';
import 'package:water_tracking/widgets/appbar/app_appbar.dart';

class NotificationSettingsScreen extends StatefulWidget {
  const NotificationSettingsScreen({super.key});

  @override
  State<NotificationSettingsScreen> createState() =>
      _NotificationSettingsScreenState();
}

class _NotificationSettingsScreenState
    extends State<NotificationSettingsScreen> {
  final NotificationService _notificationService = NotificationService();

  bool _isReminderEnabled = false;
  TimeOfDay _reminderTime = const TimeOfDay(hour: 9, minute: 0);
  List<bool> _selectedDays = [
    true,
    true,
    true,
    true,
    true,
    true,
    true
  ]; // Mon-Sun

  final List<String> _daysOfWeek = [
    'Mon',
    'Tue',
    'Wed',
    'Thu',
    'Fri',
    'Sat',
    'Sun'
  ];

  @override
  void initState() {
    super.initState();
    _loadSettings();
  }

  Future<void> _loadSettings() async {
    // Load saved settings from SharedPreferences
    // This is a placeholder - you can implement actual loading logic
  }

  Future<void> _saveSettings() async {
    // Save settings to SharedPreferences
    // This is a placeholder - you can implement actual saving logic
  }

  Future<void> _selectTime() async {
    final TimeOfDay? picked = await showTimePicker(
      context: context,
      initialTime: _reminderTime,
    );
    if (picked != null && picked != _reminderTime) {
      setState(() {
        _reminderTime = picked;
      });
      await _saveSettings();
    }
  }

  Future<void> _toggleReminder(bool value) async {
    setState(() {
      _isReminderEnabled = value;
    });

    if (value) {
      await _notificationService.scheduleWaterReminder(
        time: _reminderTime,
        days: _selectedDays,
      );
    } else {
      await _notificationService.cancelWaterReminders();
    }

    await _saveSettings();
  }

  Future<void> _toggleDay(int index, bool value) async {
    setState(() {
      _selectedDays[index] = value;
    });

    if (_isReminderEnabled) {
      await _notificationService.cancelWaterReminders();
      await _notificationService.scheduleWaterReminder(
        time: _reminderTime,
        days: _selectedDays,
      );
    }

    await _saveSettings();
  }

  Future<void> _testNotification() async {
    await _notificationService.showWaterReminder(
      title: 'Test Water Reminder 💧',
      body: 'This is a test notification for water reminder!',
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const AppAppbar(
        title: 'Notification Settings',
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Enable/Disable Reminders
            Card(
              child: SwitchListTile(
                title: const Text(
                  'Water Reminders',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
                ),
                subtitle: const Text('Get reminded to drink water regularly'),
                value: _isReminderEnabled,
                onChanged: _toggleReminder,
              ),
            ),

            const SizedBox(height: 20),

            if (_isReminderEnabled) ...[
              // Reminder Time
              Card(
                child: ListTile(
                  title: const Text(
                    'Reminder Time',
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
                  ),
                  subtitle: Text(
                    '${_reminderTime.format(context)}',
                    style: const TextStyle(fontSize: 14),
                  ),
                  trailing: const Icon(Icons.access_time),
                  onTap: _selectTime,
                ),
              ),

              const SizedBox(height: 20),

              // Days of Week
              Card(
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'Reminder Days',
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.w500),
                      ),
                      const SizedBox(height: 12),
                      Wrap(
                        spacing: 8,
                        children: List.generate(
                          _daysOfWeek.length,
                          (index) => FilterChip(
                            label: Text(_daysOfWeek[index]),
                            selected: _selectedDays[index],
                            onSelected: (value) => _toggleDay(index, value),
                            selectedColor:
                                Theme.of(context).primaryColor.withOpacity(0.2),
                            checkmarkColor: Theme.of(context).primaryColor,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),

              const SizedBox(height: 20),

              // Test Notification Button
              SizedBox(
                width: double.infinity,
                child: ElevatedButton.icon(
                  onPressed: _testNotification,
                  icon: const Icon(Icons.notifications),
                  label: const Text('Test Notification'),
                  style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.symmetric(vertical: 12),
                  ),
                ),
              ),
            ],

            const SizedBox(height: 30),

            // Information Card
            Card(
              color: Colors.blue.withOpacity(0.1),
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Icon(
                          Icons.info_outline,
                          color: Colors.blue[700],
                        ),
                        const SizedBox(width: 8),
                        Text(
                          'About Notifications',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                            color: Colors.blue[700],
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 8),
                    Text(
                      '• Notifications will remind you to drink water at the specified time\n'
                      '• You can select multiple days for recurring reminders\n'
                      '• Notifications work even when the app is closed\n'
                      '• You can test notifications using the test button above',
                      style: TextStyle(
                        fontSize: 14,
                        color: Colors.blue[700],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
