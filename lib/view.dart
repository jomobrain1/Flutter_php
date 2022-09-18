import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:users/update.dart';

class viewData extends StatefulWidget {
  viewData({Key? key}) : super(key: key);

  @override
  State<viewData> createState() => _viewDataState();
}

class _viewDataState extends State<viewData> {
  List userData = [];
  Future<void> deleteRecord(String id) async {
    try {
      final uri =
          "http://192.168.134.36/flutterbackend/flutterPhp/users/delete.php";
      var res = await http.post(Uri.parse(uri), body: {"id": id});
      var response = jsonDecode(res.body);
     
    } catch (e) {
      print(e);
    }
  }

  Future<void> getRecord() async {
    final uri =
        "http://192.168.134.36/flutterbackend/flutterPhp/users/view.php";
    try {
      var response = await http.get(Uri.parse(uri));
      setState(() {
        userData = jsonDecode(response.body);
      });
    } catch (e) {}
  }

  @override
  void initState() {
    // TODO: implement initState
    getRecord();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('View Data'),
      ),
      body: ListView.builder(
          itemCount: userData.length,
          itemBuilder: (context, index) {
            return Card(
              margin: EdgeInsets.all(10.0),
              child: ListTile(
                leading: IconButton(
                  icon: Icon(Icons.edit),
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) {
                      return updateData(
                        userData[index]["uname"],
                        userData[index]["uemail"],
                        userData[index]["upassword"],
                      );
                    }));
                  },
                ),
                title: Text(userData[index]["uname"]),
                subtitle: Text(userData[index]["uemail"]),
                trailing: IconButton(
                    icon: Icon(Icons.delete),
                    onPressed: () {
                      deleteRecord(userData[index]["uid"]);
      Navigator.push(context, MaterialPageRoute(builder: (context) {
          return viewData();
        }));
                    
                    }),
              ),
            );
          }),
    );
  }
}
