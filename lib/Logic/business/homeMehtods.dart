import 'package:http/http.dart' as http;
import 'package:missing_center/Logic/business/Auth.dart';
import 'dart:async' show Future;
import 'package:missing_center/Logic/data/model/missingModel.dart';
import 'dart:convert'as convert;
import 'dart:io';

class MissingJob {

  Future<String> checked() async{
    UserAuth userAuth = new UserAuth();
    String token;
    token = await userAuth.returnToken();
    //print("from if ... " + token );
     return token;
  }


  Future<int> addMissingWithImage (Missing missing) async {
    String url = "http://missing.test/api/Missing/AddMissing";
    var imageL = missing.image;
    try {
      var request = http.MultipartRequest('POST', Uri.parse(url));
      request.headers['authorization'] = await checked();

      request.files.add(
          http.MultipartFile.fromBytes(
              'picture',
              File(imageL.path).readAsBytesSync(),
              filename: missing.image.toString()
                  .split("/")
                  .last
          )
      );

      request.fields['name'] = missing.name;
      request.fields['age'] = missing.age.toString();
      request.fields['gender'] = missing.gender;
      request.fields['phone'] = missing.phone;
      request.fields['detailMissing'] = missing.detailMissing;
      request.fields['areaMissing'] = missing.areaMissing;
      request.fields['governorateId'] = missing.governorateId.toString();

      var res = await request.send();
      return res.statusCode;
    } on SocketException {
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

/*
  Future<http.Response> addMissing(Missing missing) async {

    String usersToJson(Missing data) {
      final prepareData = data.toJson();
      return convert.json.encode(prepareData);
    }

    try {
      String url = "http://missing.test/api/Missing/AddMissing";

      final response = await http.post('$url',
          headers: {
            HttpHeaders.contentTypeHeader: 'application/json',
            HttpHeaders.authorizationHeader: await checked(),
          },
          body: usersToJson(missing)
      );


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
*/


/*  static addImage(File image) async {
    String url = "http://missing.test/api/Missing/AddMissing/image";
    var bytes = image.readAsBytesSync();

    var response = await http.post(
        url,
        headers:{ "Content-Type":"multipart/form-data" } ,
        body: {"image":bytes},
        encoding: Encoding.getByName("utf-8")
    );

    return response.body;

  }*/

Future<List<Missing>> getAllMissing() async {
  var url = 'http://missing.test/api/Missing/all';
  var missingList  = new List<Missing>();
  // Missing missingItem;
  var response = await http.get(url);
  if (response.statusCode == 200) {
    var jsonResponse = convert.jsonDecode(response.body);
    /*set loop */
    for (var item in jsonResponse ) {
      //missingItem = new Missing.fromJson(item);
      missingList.add(Missing.fromJson(item));
    }
     return missingList;
  } else {
    print('Request failed with status: ${response.statusCode}.');
    return null;
  }

}


  Future<Missing> getMissingBySearch(String name,int age,String gender, DateTime date, int governorateId) async {

    /*Map<String,String> parameters = {
     'name': '$name',
     'age': '$age',
     'gender': '$gender',
     'date': '$date',
     'governorateId' : '$governorateId',
   };
   var url = Uri.https("www.missing.test","/api/Missing/", parameters);
   */

    var url = 'http://missing.test/api/Missing/name=$name&age=$age&gender=$gender&date=$date&governorateId=$governorateId';
    Missing missingItem;
    var response = await http.get(url);
    if (response.statusCode == 200) {
      var jsonResponse = convert.jsonDecode(response.body);
        missingItem = new Missing.fromJson(jsonResponse);
      return missingItem;
    } else {
      print('Request failed with status: ${response.statusCode}.');
      return null;
    }

  }



  Future<Missing> getMissingById(int id) async {
    var url = 'http://missing.test/api/Missing/name=$id';
    Missing missingItem;
    var response = await http.get(url);
    if (response.statusCode == 200) {
      var jsonResponse = convert.jsonDecode(response.body);
      missingItem = new Missing.fromJson(jsonResponse);
      return missingItem;
    } else {
      print('Request failed with status: ${response.statusCode}.');
      return null;
    }

  }




}



