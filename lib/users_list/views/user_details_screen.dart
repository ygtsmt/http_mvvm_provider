import 'package:flutter/material.dart';
import 'package:http_mvvm_provider/components/app_title.dart';
import 'package:http_mvvm_provider/users_list/view_models/users_view_model.dart';
import 'package:provider/provider.dart';

class UserDetailsScreen extends StatelessWidget {
  const UserDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    UsersViewModel usersViewModel = context.watch<UsersViewModel>();
    return Scaffold(
      appBar: AppBar(
        title: Text(usersViewModel.selectedUser.name),
      ),
      body: Container(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            AppTitle(text: usersViewModel.selectedUser.name),
            const SizedBox(height: 5.0),
            Text(
              usersViewModel.selectedUser.email,
              style: const TextStyle(color: Colors.black),
            ),
            const SizedBox(height: 5.0),
            Text(
              usersViewModel.selectedUser.phone,
              style: const TextStyle(color: Colors.black),
            ),
            const SizedBox(height: 5.0),
            Text(
              usersViewModel.selectedUser.website,
              style: const TextStyle(color: Colors.black),
            ),
            const SizedBox(height: 5.0),
            Text(
              usersViewModel.selectedUser.address.street,
              style: const TextStyle(color: Colors.black),
            ),
            Text(
              usersViewModel.selectedUser.address.city,
              style: const TextStyle(color: Colors.black),
            ),
          ],
        ),
      ),
    );
  }
}
