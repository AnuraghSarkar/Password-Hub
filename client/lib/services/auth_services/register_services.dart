import 'package:get/get.dart';
import 'package:client/main.dart';

class RegisterServices extends GetConnect {
  //Registering the user
  Future<Response> registerUser(name, email, password) {
    Map data = {
      "name": name,
      "email": email,
      "password": password,
      "authType": "normal"
    };
    return post("http://192.168.1.72:3000/api/user/register", data);
  }

  //Checking if mail is verified
  Future<Response> verifyMail() {
    var mail = box.read("email");
    return get(
      "http://192.168.1.72:3000/api/user/register/verify-mail/$mail",
    );
  }

  //Creating new master password
  Future<Response> createMaster(password, email) {
    var data = {
      "masterPassword": password,
    };
    var mail = box.read("email");
    if (mail == null) {
      mail = email;
    }
    return put(
      "http://192.168.1.72:3000/api/user/register/new-master-pass/$mail",
      data,
    );
  }
}
