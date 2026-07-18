import 'package:flutter_bloc_clean/config/app_urls.dart';
import 'package:flutter_bloc_clean/data/network/network_services_api.dart';
import 'package:flutter_bloc_clean/models/user_model.dart';

class LoginRepo {
  final api = NetworkApiService();

  Future<UserModel> loginApi(dynamic data) async {
    final response = await api.postApi(AppUrl.loginApi, data);
    return UserModel.fromJson(response);
  }
}
