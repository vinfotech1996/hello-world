import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:intl/intl.dart';

class AddScheduleScreen extends StatefulWidget {
  @override
  _AddScheduleScreenState createState() => _AddScheduleScreenState();
}

class _AddScheduleScreenState extends State<AddScheduleScreen> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _titleController = TextEditingController();
  TimeOfDay? _selectedTime;
  String _repeat = 'Today'; // Default value for repeat
  bool _snooze = false;
  int _snoozeInterval = 5; // Default snooze interval
  int _repeatCount = 3; // Default repeat count

  void _pickTime() async {
    final TimeOfDay? time = await showTimePicker(
      context: context,
      initialTime: TimeOfDay.now(),
    );
    if (time != null) {
      setState(() {
        _selectedTime = time;
      });
    }
  }

  @override
  void dispose() {
    _titleController.dispose();
    super.dispose();
  }

  void _saveSchedule() {
    if (_formKey.currentState!.validate() && _selectedTime != null) {
      final now = DateTime.now();
      final selectedDateTime = DateTime(now.year, now.month, now.day, _selectedTime!.hour, _selectedTime!.minute);

      // Ensure the selected time is in the future
      if (selectedDateTime.isBefore(now)) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Please select a time in the future.')),
        );
        return;
      }

      final schedule = {
        'title': _titleController.text,
        'time': TimeOfDay(
          hour: _selectedTime!.hour,
          minute: _selectedTime!.minute,
        ),
        'repeat': _repeat,
        'snooze': _snooze,
        'snoozeInterval': _snoozeInterval,
        'repeatCount': _repeatCount,
      };
      debugPrint("schedule---${schedule}");
      Navigator.pop(context, schedule);
    } else if (_selectedTime == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Please select a time for the session')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Add Schedule')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: ListView(
            children: [
              TextFormField(
                controller: _titleController,
                decoration: const InputDecoration(labelText: 'Yoga Session Title'),
                validator: (value) => value == null || value.isEmpty ? 'Please enter a title' : null,
              ),
              const SizedBox(height: 16),
              ListTile(
                title: Text(
                  _selectedTime == null
                      ? 'Select Time'
                      : 'Time: ${_selectedTime!.format(context)}',
                ),
                trailing: const Icon(Icons.access_time),
                onTap: _pickTime,
              ),
              DropdownButtonFormField<String>(
                value: _repeat,
                onChanged: (value) => setState(() => _repeat = value!),
                items: const [
                  DropdownMenuItem(value: 'Today', child: Text('Today')),
                  DropdownMenuItem(value: 'Every Monday', child: Text('Every Monday')),
                  DropdownMenuItem(value: 'Every day', child: Text('Every day')),
                ],
                decoration: const InputDecoration(labelText: 'Repeat'),
              ),
              SwitchListTile(
                title: const Text('Enable Snooze'),
                value: _snooze,
                onChanged: (value) => setState(() => _snooze = value),
              ),
              if (_snooze) ...[
                DropdownButtonFormField<int>(
                  value: _snoozeInterval,
                  onChanged: (value) => setState(() => _snoozeInterval = value!),
                  items: const [
                    DropdownMenuItem(value: 5, child: Text('5 minutes')),
                    DropdownMenuItem(value: 10, child: Text('10 minutes')),
                    DropdownMenuItem(value: 15, child: Text('15 minutes')),
                  ],
                  decoration: const InputDecoration(labelText: 'Snooze Interval'),
                ),
                DropdownButtonFormField<int>(
                  value: _repeatCount,
                  onChanged: (value) => setState(() => _repeatCount = value!),
                  items: const [
                    DropdownMenuItem(value: 3, child: Text('3 times')),
                    DropdownMenuItem(value: 5, child: Text('5 times')),
                    DropdownMenuItem(value: 10, child: Text('10 times')),
                  ],
                  decoration: const InputDecoration(labelText: 'Repeat Count'),
                ),
              ],
              const SizedBox(height: 16),
              ElevatedButton(
                onPressed: _saveSchedule,
                child: const Text('Save Schedule'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}