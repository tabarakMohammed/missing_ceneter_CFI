import 'package:http/http.dart' as http;
import 'dart:async' show Future;
import 'package:missing_center/Logic/data/model/userModel.dart';
import 'dart:convert'as convert;
import 'dart:io';



class UsersJob {


  // Future loadUsers() async {
  //   // var url = 'http://missing.test/api/auth/user';
  //   //
  //   // var response = await http.get(url);
  //   // if (response.statusCode == 200) {
  //   //
  //   //   var jsonResponse = convert.jsonDecode(response.body);
  //   //   var itemCount = jsonResponse['name'];
  //   //   Users users = new Users.fromJson(jsonResponse);
  //   //   print(users.name);
  //   //   print('Number of books about http: $itemCount.');
  //   // } else {
  //   //   print('Request failed with status: ${response.statusCode}.');
  //   // }
  //
  //   String jsonString = await _loadUsersAsset();
  //   final jsonResponse = convert.jsonDecode(jsonString);
  //   Users users = new Users.fromJson(jsonResponse);
  //   print(users.name);
  // }

  Future<http.Response> createUsers(Users users) async {
    String usersToJson(Users data) {
      final prepareData = data.toJson();
      return convert.json.encode(prepareData);
    }

    String url = "http://missing.test/api/auth/signup";

    final response = await http.post('$url',
        headers: {
          HttpHeaders.contentTypeHeader: 'application/json',
          HttpHeaders.authorizationHeader: ''
        },
        body: usersToJson(users)
    );
    return response;
  }



  Future<Users> getMissingByToken(String Token) async {
    var url = 'http://missing.test/api/Missing/name=$Token';
    Users _users;
    try {
      var response = await http.get(url);
      if (response.statusCode == 200) {
        var jsonResponse = convert.jsonDecode(response.body);
        _users = new Users.fromJson(jsonResponse);
        return _users;
      } else {
        print('Request failed with status: ${response.statusCode}.');
        return null;
      }
    } on SocketException {
      Users error = new Users();
      error.name = "SocketException";
      error.email = "SocketException";
      error.phone = "SocketException";
      return error;
    } on HttpException {
      Users error = new Users();
      error.name = "HttpException";
      return error;
    } on FormatException {
      Users error = new Users();
      error.name = "FormatException";
      return error;
    }
  }




}