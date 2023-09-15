import 'package:flutter/material.dart';
import 'package:http_mvvm_provider/users_list/models/users_list_model.dart';
import 'package:http_mvvm_provider/users_list/view_models/users_view_model.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    UsersViewModel usersViewModel = context.watch<UsersViewModel>();
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text('Users'),
      ),
      body: Container(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            if (usersViewModel.loading) const CircularProgressIndicator(),
            Expanded(
              child: ListView.separated(
                itemBuilder: (context, index) {
                  UserModel userModel = usersViewModel.userListModel[index];
                  return Text(userModel.id.toString());
                },
                separatorBuilder: (context, index) => const Divider(color: Colors.black),
                itemCount: usersViewModel.userListModel.length,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
