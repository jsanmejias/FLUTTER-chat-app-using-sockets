import 'package:chat_app/view/pages/loading/widgets/splash.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:chat_app/view/pages/loading/loading_controller.dart';

class LoadingPage extends StatelessWidget {
  const LoadingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<LoadingController>(
      builder: (loadingController) => Scaffold(
        body: FutureBuilder(
          future: loadingController.checkUserAuthenticationState(),
          builder: ((context, snapshot) {
            return const Splash();
          }),
        ),
      ),
    );
  }
}
