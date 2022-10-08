import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:pull_to_refresh/pull_to_refresh.dart';

import 'package:chat_app/view/pages/users/users_controller.dart';

import 'package:chat_app/view/pages/users/widgets/users_page_app_bar.dart';
import 'package:chat_app/view/pages/users/widgets/users_list.dart';
import 'package:chat_app/view/common/style/colors.dart';

class UsersPage extends StatelessWidget {
  const UsersPage({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<UsersController>(
      builder: (usersController) => SafeArea(
        child: Scaffold(
          appBar: const UsersPageAppBar(),
          body: SmartRefresher(
            physics: const BouncingScrollPhysics(),
            controller: usersController.refreshController,
            enablePullDown: true,
            header: const WaterDropMaterialHeader(
              color: Colors.white ,
              distance: 100,
              backgroundColor: backActionColor,
            ),
            onRefresh: usersController.loadUsers,
            child: UsersList(users: usersController.users),
          ),
        ),
      ),
    );
  }
}

/* WaterDropHeader(
            complete: Icon(
              Icons.check,
              color: Colors.blue[400],
            ),
            waterDropColor: Colors.blue[400]!,
          ), */