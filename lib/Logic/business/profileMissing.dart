// import 'package:http/http.dart' as http;
// import 'dart:async' show Future;
// import 'package:missing_center/Logic/data/model/missingModel.dart';
// import 'dart:convert'as convert;
// import 'dart:io';
//
// class ProfileMissing {
//
//   Future<Missing> getMissingByToken(String Token) async {
//     var url = 'http://missing.test/api/Missing/name=$Token';
//     Missing missingItem;
//     try {
//       var response = await http.get(url);
//       if (response.statusCode == 200) {
//         var jsonResponse = convert.jsonDecode(response.body);
//         missingItem = new Missing.fromJson(jsonResponse);
//         return missingItem;
//       } else {
//         print('Request failed with status: ${response.statusCode}.');
//         return null;
//       }
//     } on SocketException {
//       Missing error = new Missing();
//       error.name = "SocketException";
//       return error;
//     } on HttpException {
//       Missing error = new Missing();
//       error.name = "HttpException";
//       return error;
//     } on FormatException {
//       Missing error = new Missing();
//       error.name = "FormatException";
//       return error;
//     }
//   }
//
//
// }
