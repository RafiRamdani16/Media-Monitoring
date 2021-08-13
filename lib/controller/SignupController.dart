import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:web_monitoring/model/signupModel.dart';

import 'package:web_monitoring/model/usersModel.dart';
import 'package:web_monitoring/services/apiService.dart';

class SignupController implements SignupModel {
  SignupViewModel view;
  SignupController(this.view);
  RestClient api = RestClient(Dio());

  @override
  void success(String token, String deviceID) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString("api_token", token);
  }

  @override
  void destroy() => view = Null as SignupViewModel;

  @override
  void signup(
      String name, String email, String password, String deviceID) async {
    await api.signup(name, email, password, deviceID).then((it) {
      if (it.status == 200) {
        UserModel user = UserModel.fromJson(it.data);
        success(user.token, deviceID);
        view.finish();
      } else {
        view.toast("Register gagal. Mungkin email sudah digunakan orang lain");
      }
    }).catchError((e) {
      print(e);
      view.toast("Terjadi kesalahan. Coba lagi nanti");
    });
  }
}
