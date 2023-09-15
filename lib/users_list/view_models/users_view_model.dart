import 'package:flutter/material.dart';
import 'package:http_mvvm_provider/users_list/models/users_list_model.dart';
import 'package:http_mvvm_provider/users_list/repo/api_status.dart';
import 'package:http_mvvm_provider/users_list/repo/user_services.dart';

class UsersViewModel extends ChangeNotifier {
  bool _loading = false;
  List<UserModel> _userListModel = [];
  bool get loading => _loading;
  List<UserModel> get userListModel => _userListModel;


  setLoading(bool loading) async {
    _loading = loading;
    notifyListeners();
  }

  setUserListModel(List<UserModel> userListModel) {
    _userListModel = userListModel;
  }

  getUsers() async {
    setLoading(true);
    var response = await UserServices.getUsers();
    if (response is Success) {
      setUserListModel(response.response as List<UserModel>);
    }

    setLoading(false);
  }

  UsersViewModel() {
    getUsers();
  }
}
