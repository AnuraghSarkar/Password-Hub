import 'package:get/get.dart';
import 'package:client/main.dart';

class PasswordService extends GetConnect {
  Future<Response> getMainPassword() {
    var id = box.read("id");
    var token = box.read("auth-token");

    return get(
      "http://192.168.1.72:3000/api/password/get-password/$id?page=1&limit",
      headers: {"auth-token": token},
    );
  }

  Future<Response> getIcons() {
    var token = box.read("auth-token");

    return get(
      "http://192.168.1.72:3000/api/password/get-icons",
      headers: {"auth-token": token},
    );
  }

  Future<Response> createPassword(
      title, username, password, category, note, emailid) {
    var id = box.read("id");
    var token = box.read("auth-token");
    var data = {
      "title": title,
      "username": username,
      "password": password,
      "category": category,
      "note": note,
      "userId": id,
      "emailId": emailid
    };

    return post(
      "http://192.168.1.72:3000/api/password/new-password",
      data,
      headers: {"auth-token": token},
    );
  }

  Future<Response> deletePassword(id) {
    var token = box.read("auth-token");

    return delete(
      "http://192.168.1.72:3000/api/password/delete-password/$id",
      headers: {"auth-token": token},
    );
  }

  Future<Response> updatePassword(
      title, username, password, category, note, emailid, id) {
    var token = box.read("auth-token");

    var data = {
      "title": title,
      "username": username,
      "password": password,
      "category": category,
      "note": note,
      "emailId": emailid
    };

    return put(
      "http://192.168.1.72:3000/api/password/update-password/$id",
      data,
      headers: {"auth-token": token},
    );
  }

  Future<Response> toggleImportant(isImportant, passId) {
    var token = box.read("auth-token");

    var data = {
      "isImportant": isImportant,
    };

    return put(
      "http://192.168.1.72:3000/api/password/update-password/important/$passId",
      data,
      headers: {"auth-token": token},
    );
  }
}
