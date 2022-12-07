import 'package:settings_ui/settings_ui.dart';
import 'package:flutter/material.dart';
class MyHomePage extends StatefulWidget {

  late final String title = '';
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  bool isSwitched = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Settings'),
        backgroundColor: Color(0xFF4C53A5),
      ),
      body: SettingsList(
        sections: [
          SettingsSection(
            title: Text('Common'),
            tiles: <SettingsTile>[
              SettingsTile.navigation(
                leading: Icon(Icons.language),
                title: Text('Language'),
                value: Text('English'),
              ),
              SettingsTile.switchTile(
                onToggle: (value) {},
                initialValue: true,
                leading: Icon(Icons.format_paint),
                title: Text('Enable custom theme'),
              ),

            ],
          ),
          SettingsSection(title: Text('Settings'),
            tiles: [
              SettingsTile.navigation(
                leading: Icon(Icons.key),
                title: Text('Reset Password'),
                value: Text(''),
                onPressed: (BuildContext context){},
              ),
              SettingsTile.navigation(
                leading: Icon(Icons.visibility),
                title: Text('Profile Visibility'),
                value: Text(''),
              ),
              SettingsTile.navigation(
                leading: Icon(Icons.visibility),
                title: Text('Contact Visibility'),
                value: Text(''),
              ),
              SettingsTile.navigation(
                leading: Icon(Icons.exit_to_app),
                title: Text('Sign Out'),
                value: Text(''),
              ),

            ],)
        ],
      ),
    );
  }
}
