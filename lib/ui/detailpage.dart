import 'package:flutter/material.dart';

class DetailPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          backgroundColor: Color(0xFF155E98),
          title: Text(
            'المفقودين',
            style: TextStyle(
                color: Colors.white, fontSize: 22, fontWeight: FontWeight.bold),
          ),
        ),
        body: ListView(
          children: <Widget>[
            Column(
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.only(top: 20),
                  child: CircleAvatar(
                    radius: 100,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 290),
                  child: RaisedButton(
                      elevation: 10,
                      padding: EdgeInsets.only(left: 40, right: 40),
                      child: Text(
                        'اتصال',
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                      shape: new RoundedRectangleBorder(
                        borderRadius: new BorderRadius.circular(20.0),
                      ),
                      color: Color(0xFF155E98),
                      textColor: Colors.white,
                      onPressed: () {}),
                )
              ],
            )
          ],
        ));
  }
}
