import 'package:flutter/material.dart';
import 'home_page.dart';
import 'schedule.dart';
import 'profile.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => MyAppState();
}

class MyAppState extends State<MyApp> {
  ThemeMode _themeMode = ThemeMode.light;
  MaterialColor _primaryColor = Colors.blue;

  void toggleTheme(bool isDark) {
    setState(() {
      _themeMode = isDark ? ThemeMode.dark : ThemeMode.light;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Aplikasi Mahasiswa',
      debugShowCheckedModeBanner: false,
      themeMode: _themeMode,
      theme: ThemeData(
        useMaterial3: true,
        colorSchemeSeed: _primaryColor,
        brightness: Brightness.light,
      ),
      darkTheme: ThemeData(
        useMaterial3: true,
        colorSchemeSeed: _primaryColor,
        brightness: Brightness.dark,
      ),
      home: MainPage(toggleTheme: toggleTheme),
    );
  }
}

class MainPage extends StatefulWidget {
  final void Function(bool isDark) toggleTheme;

  const MainPage({super.key, required this.toggleTheme});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int _currentIndex = 0;

  List<Widget> get _pages => [
        const HomePage(),
        const JadwalPage(),
        AkunPage(onThemeChanged: widget.toggleTheme),
      ];

  @override
  Widget build(BuildContext context) {
    final isTablet = MediaQuery.of(context).size.width >= 600;

    return Scaffold(
      body: Row(
        children: [
          if (isTablet)
            NavigationRail(
              selectedIndex: _currentIndex,
              onDestinationSelected: (index) => setState(() => _currentIndex = index),
              labelType: NavigationRailLabelType.selected,
              destinations: const [
                NavigationRailDestination(icon: Icon(Icons.home), label: Text('Home')),
                NavigationRailDestination(icon: Icon(Icons.schedule), label: Text('Jadwal')),
                NavigationRailDestination(icon: Icon(Icons.person), label: Text('Akun')),
              ],
            ),
          Expanded(child: _pages[_currentIndex]),
        ],
      ),
      bottomNavigationBar: isTablet
          ? null
          : BottomNavigationBar(
              currentIndex: _currentIndex,
              onTap: (index) => setState(() => _currentIndex = index),
              items: const [
                BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
                BottomNavigationBarItem(icon: Icon(Icons.schedule), label: 'Jadwal'),
                BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Akun'),
              ],
            ),
    );
  }
}
