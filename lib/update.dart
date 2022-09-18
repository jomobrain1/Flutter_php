import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:users/view.dart';

class updateData extends StatefulWidget {
  String name;

  String email;
  String password;
  updateData(this.name, this.email, this.password);
  @override
  State<updateData> createState() => _updateDataState();
}

class _updateDataState extends State<updateData> {
  TextEditingController name = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  Future<void> updateRecord() async {
    try {
      final uri =
          "http://192.168.134.36/flutterbackend/flutterPhp/users/update.php";

      var res = await http.post(Uri.parse(uri), body: {
        "name": name.text,
        "email": email.text,
        "password": password.text,
      });
       
          Navigator.push(context, MaterialPageRoute(builder: (context) {
          return viewData();
        }));
      var response = jsonDecode(res.body);
        if (response["success" == true]) {
          print("record updated");
        
        } else {
          print('error');
        }
    } catch (e) {}
  }

  @override
  void initState() {
    // TODO: implement initState
    name.text = widget.name;
    email.text = widget.email;
    password.text = widget.password;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('View Data'),
      ),
      body: ListView(
        scrollDirection: Axis.vertical,
        children: [
          Container(
            margin: EdgeInsets.all(14.0),
            child: TextFormField(
                autofocus: false,
                controller: name,
                decoration: InputDecoration(
                    border: OutlineInputBorder(), label: Text('enter name'))),
          ),
          Container(
            margin: EdgeInsets.all(14.0),
            child: TextFormField(
                autofocus: false,
                controller: email,
                decoration: InputDecoration(
                    border: OutlineInputBorder(), label: Text('enter Email'))),
          ),
          Container(
            margin: EdgeInsets.all(14.0),
            child: TextFormField(
                autofocus: false,
                controller: password,
                decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    label: Text('enter password'))),
          ),
          Container(
            margin: EdgeInsets.all(14.0),
            child: ElevatedButton(
              child: Text('upDate user'),
              onPressed: () {
                updateRecord();
              },
            ),
          ),
          Container(
            margin: EdgeInsets.all(14.0),
            child: ElevatedButton(
              child: Text('view user'),
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return viewData();
                }));
              },
            ),
          )
        ],
      ),
    );
  }
}
