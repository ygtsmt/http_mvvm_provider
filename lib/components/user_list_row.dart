import 'package:flutter/material.dart';
import 'package:http_mvvm_provider/users_list/models/users_list_model.dart';

import 'app_title.dart';

class UserListRow extends StatelessWidget {
  final UserModel userModel;
  final VoidCallback onTap;
  UserListRow({required this.userModel, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            AppTitle(text: userModel.name ?? "null"),
            Text(
              userModel.email ?? "null",
              style: TextStyle(color: Colors.black),
            ),
          ],
        ),
      ),
    );
  }
}
