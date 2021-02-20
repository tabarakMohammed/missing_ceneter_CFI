import 'package:flutter/material.dart';

class PersonFile extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _PersonFileState();
  }
}

class _PersonFileState extends State<PersonFile> {
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
                  ),
                ),
                Padding(
                    padding: EdgeInsets.only(top: 30, left: 330),
                    child: Text('الاسم  ',
                        style: TextStyle(
                            fontSize: 23,
                            fontWeight: FontWeight.bold,
                            color: Color(0xFF1875BC)))),
                Padding(
                    padding: EdgeInsets.only(left: 240),
                    child: Text('البريد الالكتروني  ',
                        style: TextStyle(
                            fontSize: 23,
                            fontWeight: FontWeight.bold,
                            color: Color(0xFF1875BC)))),
                Padding(
                    padding: EdgeInsets.only(left: 280),
                    child: Text('رقم الهاتف  ',
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
