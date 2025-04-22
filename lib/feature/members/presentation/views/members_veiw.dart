import 'package:flutter/material.dart';
import 'package:robotics_app/core/utils/widgets/custom_app_bar.dart';
import 'package:robotics_app/feature/members/presentation/views/widgets/members_view_body.dart';

class MembersView extends StatelessWidget {
  static const routeName = '/membersPage';
  const MembersView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        icon: Icons.group,
        text: "Members",
        automaticallyImplyLeading: true,
      ),
      body: MembersViewBody(),
    );
  }
}
