import 'package:flutter/material.dart';
import 'package:http_mvvm_provider/users_list/models/user_error.dart';
import 'package:http_mvvm_provider/users_list/models/users_list_model.dart';
import 'package:http_mvvm_provider/users_list/repo/api_status.dart';
import 'package:http_mvvm_provider/users_list/repo/user_services.dart';

class UsersViewModel extends ChangeNotifier {
  //
  bool _loading = false;
  List<UserModel> _userListModel = [];
UserError _userError = UserError();
UserModel _selectedUser = UserModel();

  bool get loading => _loading;
  List<UserModel> get userListModel => _userListModel;
  UserError get userError => _userError;
  UserModel get selectedUser => _selectedUser;

  UsersViewModel() {
    getUsers();
  }

  setLoading(bool loading) async {
    _loading = loading;
    notifyListeners();
  }

  setUserListModel(List<UserModel> userListModel) {
    _userListModel = userListModel;
  }

  setUserError(UserError userError) {
    _userError = userError;
  }

  setSelectedUser(UserModel userModel) {
    _selectedUser = userModel;
  }




  getUsers() async {
    setLoading(true);
    var response = await UserServices.getUsers();
    if (response is Success) {
      setUserListModel(response.response as List<UserModel>);
    }
    if (response is Failure) {
      UserError userError = UserError(
        code: response.code,
        message: response.errorResponse.toString(),
      );
      setUserError(userError);
    }
    setLoading(false);
  }
}
