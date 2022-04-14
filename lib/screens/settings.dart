import 'package:flutter/material.dart';

class SettingsScreen extends StatefulWidget {
  static const routeName = '/settings';

  @override
  _SettingsScreenState createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  bool isFalse = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            SwitchListTile(
              title: Text('Change Main tile view'),
              onChanged: (value) {
                if (value == true) {
                } else {
                  value = false;
                }
              },
              value: isFalse ? true : false,
            ),
          ],
        ),
      ),
    );
  }
}
