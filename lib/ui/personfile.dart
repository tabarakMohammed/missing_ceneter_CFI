import 'package:flutter/material.dart';
import 'package:missing_center/Logic/business/Auth.dart';
import 'package:missing_center/Logic/business/usersMethods.dart';
import 'package:missing_center/Logic/data/model/userModel.dart';

class PersonFile extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _PersonFileState();
  }
}

class _PersonFileState extends State<PersonFile> {

  UserAuth userAuth = new UserAuth();
  UsersJob _usersJob = new UsersJob();
  Users user = new Users();
  //String token = "";

  // void getToken() async{
  //   // SharedPreferences prefs = await SharedPreferences.getInstance();
  //   //String token = await prefs.get('Token');
  //   // token = await userAuth.returnToken();
  // }

  Future<void> getProfileMissing() async {
   String token = await userAuth.returnToken();
   _usersJob.getMissingByToken(token).then((value) =>
        setState(() {
          user = value;
          print("from set state" + user.name);
        })
    );
    //print("getMisisng Method" + allMissing[0].name);
  }


  @override
  void initState()  {
    // TODO: implement initState
    super.initState();
   // this.getToken();
    this.getProfileMissing();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          title: Text('الملف الشخصي',
              style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold)),
          backgroundColor: Color(0xFF155E98),
          centerTitle: true,
        ),
        body: ListView(
          children: <Widget>[
            Column(
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.only(top: 30, left: 20),
                  child: CircleAvatar(
                    radius: 100,
                    child:
                    Image.network(user.image.toString() != null ?
                    'https://www.google.com/images/branding/googlelogo/1x/googlelogo_color_272x92dp.png'
                        :user.image.toString()),
                  ),
                ),
                Padding(
                    padding: EdgeInsets.only(top: 30, left: 330),
                    child: Text('الاسم  ' + user.name,
                        style: TextStyle(
                            fontSize: 23,
                            fontWeight: FontWeight.bold,
                            color: Color(0xFF1875BC)))),
                Padding(
                    padding: EdgeInsets.only(left: 240),
                    child: Text('البريد الالكتروني  '+ user.email,
                        style: TextStyle(
                            fontSize: 23,
                            fontWeight: FontWeight.bold,
                            color: Color(0xFF1875BC)))),
                Padding(
                    padding: EdgeInsets.only(left: 280),
                    child: Text('رقم الهاتف  ' + user.phone,
                        style: TextStyle(
                            fontSize: 23,
                            fontWeight: FontWeight.bold,
                            color: Color(0xFF1875BC)))),
                Padding(
                  padding: EdgeInsets.only(top: 50, left: 20),
                  child: RaisedButton(
                    padding: EdgeInsets.only(left: 55, right: 55),
                    child: Text(
                      'تعديل',
                      style:
                          TextStyle(fontSize: 23, fontWeight: FontWeight.bold),
                    ),
                    textColor: Colors.white,
                    color: Color(0xFF155E98),
                    elevation: 10,
                    shape: new RoundedRectangleBorder(
                      borderRadius: new BorderRadius.circular(30.0),
                    ),
                    onPressed: () {},
                  ),
                ),
              ],
            ),
          ],
        ));
  }
}
