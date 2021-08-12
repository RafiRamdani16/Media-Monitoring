import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:web_monitoring/model/loginModel.dart';
import 'package:web_monitoring/model/usersModel.dart';
import 'package:web_monitoring/services/apiService.dart';

class LoginController implements LoginModel {
  LoginViewModel view;
  LoginController(this.view);
  RestClient api = RestClient(Dio());
  String? deviceID;

  @override
  void destroy() {
    view = Null as LoginViewModel;
  }

  @override
  void login(String email, String password, String deviceID) async {
    await api.login(email, password, deviceID).then((response) async {
      if (response.status == '1') {
        UserModel user = UserModel.fromJson(response.data);
        this.success(user.token, deviceID);
        view.finish();
      } else {
        view.toast("Login Gagal, Silahkan Ulangi");
      }
    }).catchError((e) {
      print("Exception $e");
      view.toast("Terjadi Kesalahan");
    });
  }

  @override
  void success(String token, String deviceID) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString("api_token", token);
    await prefs.setString("deviceID", deviceID);
  }
}
