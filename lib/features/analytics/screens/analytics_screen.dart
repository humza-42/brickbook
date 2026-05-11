import 'package:flutter/material.dart';

class AnalyticsScreen extends StatelessWidget {
  final String projectId;
  const AnalyticsScreen({super.key, required this.projectId});

  @override
  Widget build(BuildContext context) => Scaffold(
    body: Center(child: Text('Analytics for Project: $projectId - Coming Soon')),
  );
}
