import 'package:flutter/material.dart';
import 'package:flutter_theme_switcher/presentation/settings/widgets/primary_color_switcher.dart';
import 'package:flutter_theme_switcher/presentation/settings/widgets/theme_switcher.dart';
import 'package:flutter_theme_switcher/presentation/shared/page_wrapper.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      appBar: AppBar(
        title: const Text('Settings'),
      ),
      body: PageWrapper(
        body: Column(
          children: const [
            SizedBox(height: 30),
            ThemeSwitcher(),
            SizedBox(height: 20),
            PrimaryColorSwitcher(),
          ],
        ),
      ),
    );
  }
}
