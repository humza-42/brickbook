import 'package:flutter/material.dart';

class ShareProjectScreen extends StatelessWidget {
  final String projectId;
  const ShareProjectScreen({super.key, required this.projectId});

  @override
  Widget build(BuildContext context) => Scaffold(
    body: Center(child: Text('Share Project: $projectId - Coming Soon')),
  );
}
