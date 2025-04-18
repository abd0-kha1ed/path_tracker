import 'package:flutter/material.dart';

class MembersView extends StatelessWidget {
  static const routeName = '/membersPage';
  const MembersView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Members'),
      ),
    );
  }
}
