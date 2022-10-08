import 'package:flutter/material.dart';

import 'package:chat_app/domain/models/user/user.dart';

import 'package:chat_app/view/pages/users/widgets/user_tile.dart';

class UsersList extends StatelessWidget {
  
  final List<User> users;
  
  const UsersList({
    Key? key,
    required this.users,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
        physics: const BouncingScrollPhysics(),
        itemBuilder: (_, index) => UserListTile(user: users[index]),
        separatorBuilder: (_, index) => const Divider(),
        itemCount: users.length);
  }
}