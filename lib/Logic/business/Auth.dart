import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'dart:async' show Future;
import 'package:missing_center/Logic/data/model/userModel.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'dart:convert'as convert;
import 'dart:io';
import 'package:shared_preferences/shared_preferences.dart';


class UserAuth {

  Future<String> returnToken() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String token = await prefs.get('Token');
    return token;
  }

  Future<bool> _sharedToken(String token) async {
     SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString('Token',token);
    return true;
  }

  // Future<String> createUsers(Users users) async {
  //   String usersToJson(Users data) {
  //     print("my user method || --" + data.name);
  //
  //     final prepareData = data.toJson();
  //     return convert.json.encode(prepareData);
  //   }
  //
  //   print("my user method" +usersToJson(users));
  //   _sharedToken("good");
  //   return "good";
  // }



  Future<http.Response> createUsers(Users users) async {



    String usersToJson(Users data) {
      final prepareData = data.toJson();
      return convert.json.encode(prepareData);
    }

   String url = "http://missing.test/api/auth/signup";
            try {
              final response = await http.post('$url',
                  headers: {
                    HttpHeaders.contentTypeHeader: 'application/json',
                    HttpHeaders.authorizationHeader: ''
                  },
                  body: usersToJson(users)
              );
              _sharedToken(response.body);
              return response;
            }
             on SocketException {
              print('No Internet connection ');
              return null;
             } on HttpException {
               print("Couldn't find the post ");
               return null;
             } on FormatException {
               print("Bad response format ");
               return null;
             }
  }


  Future<String> logOut() async {
    print("from Auth server logout+Auth");
    SharedPreferences prefs = await SharedPreferences.getInstance();
     prefs.remove('Token');
    return "logoutAuth";
  }

  Future<String> login(Users users) async {

    String usersToJson(Users data) {

      print("my user method || --" + data.email);

      final prepareData = data.toJson();
      return convert.json.encode(prepareData);
    }

    _sharedToken("good");
    print("my user method" +usersToJson(users));

    return "good";

  }
//namerabie ali
// emailrabie@gmail.com
// social_id2505136756466748

  Future<String> socialMedia(Users users) async {

    String usersToJson(Users data) {

      print("my user method || --" + data.email);

      final prepareData = data.toJson();
      return convert.json.encode(prepareData);
    }
    _sharedToken("good");
    print("my user method" +usersToJson(users));

    return "good";

  }
}
