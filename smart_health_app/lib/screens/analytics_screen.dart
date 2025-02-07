import 'package:flutter/material.dart';

class AnalyticsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // In a full implementation, you might integrate a charting library here.
    return Center(
      child: Padding(
        padding: EdgeInsets.all(16),
        child: Text(
          'Analytics coming soon!\n\n'
          'This section will display workout trends and progress charts.',
          textAlign: TextAlign.center,
          style: TextStyle(fontSize: 18),
        ),
      ),
    );
  }
}
