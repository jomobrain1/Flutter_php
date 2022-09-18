import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:users/view.dart';

void main() {
  runApp(
     MaterialApp(

debugShowCheckedModeBanner: false,
    home: MyBody(),
  ));
}


class MyBody extends StatefulWidget {
  MyBody({Key? key}) : super(key: key);

  @override
  State<MyBody> createState() => _MyBodyState();
}

class _MyBodyState extends State<MyBody> {
  TextEditingController name = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();

  Future<void> insertRecord() async {
    if (!(name.text == "" || email.text == "" || password.text == "")) {
      try {
        final uri =
            "http://192.168.134.36/flutterbackend/flutterPhp/users/add.php";

        var res = await http.post(Uri.parse(uri), body: {
          "name": name.text,
          "email": email.text,
          "password": password.text,
        });
        var response = jsonDecode(res.body);
         name.text = "";
          password.text = "";
          email.text = "";
            Navigator.push(context, MaterialPageRoute(builder: (context) {
          return viewData();
        }));

       
      } catch (e) {
        print(e);
      }
    } else {
      print('All Fields should be filled');
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: new GestureDetector(
        onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
        child: Scaffold(
          appBar: AppBar(
            title: Text('Add Users'),
          ),
          body: Padding(
            padding: EdgeInsets.all(14.0),
            child: ListView(
              scrollDirection: Axis.vertical,
              children: [
                Container(
                  margin: EdgeInsets.all(14.0),
                  child: TextFormField(
                      autofocus: false,
                      controller: name,
                      decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          label: Text('enter name'))),
                ),
                Container(
                  margin: EdgeInsets.all(14.0),
                  child: TextFormField(
                      autofocus: false,
                      controller: email,
                      decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          label: Text('enter Email'))),
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
                    child: Text('add user'),
                    onPressed: () {
                      insertRecord();
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
          ),
        ),
      ),
    );
  }
}
