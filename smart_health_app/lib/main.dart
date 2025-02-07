import 'package:flutter/material.dart';
import 'screens/home_screen.dart';
import 'screens/workout_log_screen.dart';
import 'screens/analytics_screen.dart';

void main() {
  runApp(SmartHealthApp());
}

class SmartHealthApp extends StatefulWidget {
  @override
  _SmartHealthAppState createState() => _SmartHealthAppState();
}

class _SmartHealthAppState extends State<SmartHealthApp> {
  int _currentIndex = 0;
  final List<Widget> _screens = [
    HomeScreen(),
    WorkoutLogScreen(),
    AnalyticsScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Smart Health & Fitness Tracker',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: Text('Smart Health Tracker'),
        ),
        body: _screens[_currentIndex],
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: _currentIndex,
          items: [
            BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
            BottomNavigationBarItem(
                icon: Icon(Icons.fitness_center), label: 'Workouts'),
            BottomNavigationBarItem(
                icon: Icon(Icons.analytics), label: 'Analytics'),
          ],
          onTap: (index) {
            setState(() {
              _currentIndex = index;
            });
          },
        ),
      ),
    );
  }
}
