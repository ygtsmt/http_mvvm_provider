import 'package:flutter/material.dart';
import 'package:http_mvvm_provider/components/app_error.dart';
import 'package:http_mvvm_provider/components/app_loading.dart';
import 'package:http_mvvm_provider/components/user_list_row.dart';
import 'package:http_mvvm_provider/users_list/models/users_list_model.dart';
import 'package:http_mvvm_provider/users_list/view_models/users_view_model.dart';
import 'package:http_mvvm_provider/utils/navigation_utils.dart';
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
        actions: [
          IconButton(
            onPressed: () async {
              openAddUser(context);
            },
            icon: const Icon(Icons.add),
          ),
          IconButton(
            onPressed: () async {
              usersViewModel.getUsers();
            },
            icon: const Icon(Icons.refresh),
          )
        ],
      ),
      body: Container(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            _ui(usersViewModel),
          ],
        ),
      ),
    );
  }

  _ui(UsersViewModel usersViewModel) {
    if (usersViewModel.loading) {
      return AppLoading();
    }
    return AppError(
      errortxt: usersViewModel.userError.message,
    );
    return Expanded(
      child: ListView.separated(
        itemBuilder: (context, index) {
          UserModel userModel = usersViewModel.userListModel[index];
          return UserListRow(
            userModel: userModel,
            onTap: () async {
              usersViewModel.setSelectedUser(userModel);
              openUserDetails(context);
            },
          );
        },
        separatorBuilder: (context, index) => const Divider(),
        itemCount: usersViewModel.userListModel.length,
      ),
    );
  }
}
