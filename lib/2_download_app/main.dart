import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'ui/providers/theme_color_provider.dart';
import 'ui/screens/settings/settings_screen.dart';
import 'ui/screens/downloads/downloads_screen.dart';
import 'ui/theme/theme.dart';

void main() {
  //wrap the app in a ChangeNotifierProviderider to provide the theme color to the whole app
  runApp(ChangeNotifierProvider(
    child: const MyApp(),
    create: (context) => ThemeColorProvider(),
  ));
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  int _currentIndex = 1;

  final List<Widget> _pages =  [DownloadsScreen(), SettingsScreen()];

  @override
  Widget build(BuildContext context) {
    final themeProvider = context.watch<ThemeColorProvider>();
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: appTheme,
      home: Scaffold(
        body: _pages[_currentIndex],

        bottomNavigationBar: BottomNavigationBar(
          currentIndex: _currentIndex,
          onTap: (index) {
            setState(() {
              _currentIndex = index;
            });
          },
          // Change the selected item color to match the current theme color
          selectedItemColor: themeProvider.currentThemeColor.color,
          items: [
            BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Downloads'),
            BottomNavigationBarItem(
              icon: Icon(Icons.search),
              label: 'Settings',
            ),
          ],
        ),
      ),
    );
  }
}
