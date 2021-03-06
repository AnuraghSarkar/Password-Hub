import 'package:get/get.dart';
import 'package:client/main.dart';

class LoginServices extends GetConnect {
  //Loging in the user
  Future<Response> loginUser(email, password) {
    var data = {
      "email": email,
      "password": password,
    };
    return post("http://192.168.1.72:3000/api/user/login", data);
  }

  //Verifying master pass
  Future<Response> verifyMaster(password) {
    var data = {
      "masterPassword": password,
    };

    var id = box.read("id");

    return post(
      "http://192.168.1.72:3000/api/user/login/verify-master/$id",
      data,
    );
  }

  //Resetting password
  Future<Response> resetPassword(email) {
    var data = {
      "email": email,
    };

    return post(
      "http://192.168.1.72:3000/api/user/login/forgot-pass",
      data,
    );
  }

  //Resetting master password
  Future<Response> resetMasterPassword(email, password, masterPassword) {
    var id = box.read("id");
    var token = box.read("auth-token");
    var data = {
      "id": id,
      "email": email,
      "password": password,
      "masterPassword": masterPassword
    };

    return post(
      "http://192.168.1.72:3000/api/user/login/forgot-master-pass",
      data,
      headers: {"auth-token": token},
    );
  }
}
