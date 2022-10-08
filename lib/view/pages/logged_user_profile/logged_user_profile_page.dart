import 'package:flutter/material.dart';

import 'package:chat_app/view/pages/logged_user_profile/widgets/profile_banner.dart';
import 'package:chat_app/view/pages/logged_user_profile/widgets/profile_info.dart';

class LoggedUserProfilePage extends StatelessWidget {
  const LoggedUserProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            ProfileBanner(),
            const ProfileInfo(),
          ],
        ),
      ),
    );
  }
}
