class LoginModel {
  void login(String email, String password, String deviceID) {}
  void success(String token, String deviceID) {}
  void destroy() {}
}

class LoginViewModel {
  void toast(String message) {}
  void finish() {}
}
