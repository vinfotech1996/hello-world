import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:timezone/data/latest.dart' as tz;
import 'package:timezone/timezone.dart' as tz;
import 'AddScheduleScreen.dart';

class YogaSchedulerHome extends StatefulWidget {
  @override
  _YogaSchedulerHomeState createState() => _YogaSchedulerHomeState();
}

class _YogaSchedulerHomeState extends State<YogaSchedulerHome> {
  final List<Map<String, dynamic>> _schedules = [];
  final FlutterLocalNotificationsPlugin _flutterLocalNotificationsPlugin =
  FlutterLocalNotificationsPlugin();

  @override
  void initState() {
    super.initState();
    tz.initializeTimeZones();
    const initializationSettingsAndroid = AndroidInitializationSettings('@mipmap/ic_launcher');
    const initializationSettings = InitializationSettings(android: initializationSettingsAndroid);
    _flutterLocalNotificationsPlugin.initialize(initializationSettings);
  }

  void _scheduleNotification(Map<String, dynamic> schedule) async {
    final androidDetails = AndroidNotificationDetails(
      'yoga_channel',
      'Yoga Notifications',
      channelDescription: 'Notifications for Yoga schedules',
    );
    final notificationDetails = NotificationDetails(android: androidDetails);
    debugPrint("schedule_rep---${schedule['repeat']}");
    debugPrint("schedule_id---${schedule['id']}");

    if (schedule['repeat'] == 'Every day') {
      await _flutterLocalNotificationsPlugin.periodicallyShow(
        schedule['id'],
        'Yoga Session Reminder',
        schedule['title'],
        RepeatInterval.everyMinute,
        notificationDetails,
        androidScheduleMode: AndroidScheduleMode.exactAllowWhileIdle,
      );
    } else if (schedule['repeat'] == 'Today') {
      final time = schedule['time'];
      debugPrint("scheduledTimeCheck---${time}");
      final now = DateTime.now();
      final scheduledTime = tz.TZDateTime.local(
          now.year, now.month, now.day, time.hour, time.minute).add(Duration(seconds: 5));
      // final scheduledTime = tz.TZDateTime.now(tz.local).add(Duration(seconds: 5));
      debugPrint("scheduledTime---${scheduledTime}");
      await _flutterLocalNotificationsPlugin.zonedSchedule(
        schedule['id'],
        'Yoga Session Reminder',
        schedule['title'],
        scheduledTime,
        notificationDetails,
        // androidAllowWhileIdle: true,
        androidScheduleMode: AndroidScheduleMode.exactAllowWhileIdle,
        uiLocalNotificationDateInterpretation: UILocalNotificationDateInterpretation.absoluteTime,
      );
    }
  }

  void _addSchedule(Map<String, dynamic> schedule) {
    setState(() {
      schedule['id'] = _schedules.length + 1;
      _schedules.add (schedule);
    });
    _scheduleNotification(schedule);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Yoga Session Scheduler')),
      body: ListView.builder(
        itemCount: _schedules.length,
        itemBuilder: (context, index) {
          final schedule = _schedules[index];
          return ListTile(
            title: Text(schedule['title']),
            subtitle: Text('${schedule['time'].format(context)} - ${schedule['repeat']}'),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          final newSchedule = await Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => AddScheduleScreen()),
          );
          if (newSchedule != null) {
            _addSchedule(newSchedule);
          }
        },
        child: Icon(Icons.add),
      ),
    );
  }
}