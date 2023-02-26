import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class Profile extends StatelessWidget {
  // static final String path = "lib/src/pages/profile/profile8.dart";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.grey[100],
        body: FutureBuilder<dynamic>(
        future: fetchData(),
        builder: (context, snapshot) {
        if (snapshot.hasData) {
          return SingleChildScrollView(
          child: Column(
            children: <Widget>[
              Stack(
          children: <Widget>[
            Container(
            // color: Colors.red,
            width: double.infinity,
            height: 200,
            alignment: Alignment.bottomRight,
            child: Image.asset("assets/images/card.jpg",width: 1000,),
          ),
          Container(
            // color: Colors.black,
            // width: double.infinity,
            margin: const EdgeInsets.only(top: 160),
            child: Column(
              // crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Center(
                    child: CircleAvatar(
                      radius: 52,
                      backgroundColor: Colors.white,
                      child: CircleAvatar(
                        radius: 48,
                        backgroundImage: NetworkImage(snapshot.data![2]['image'].toString()),
                      ),

                    ),
                ),
                Text(
                  snapshot.data![2]['name'].toString(),
                  style: TextStyle(
                    fontSize: 19,
                    fontWeight: FontWeight.bold
                  )
                ),
                // const SizedBox(height: 5.0),
                Text(
                  "Customer",
                  style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.bold
                  ),
                ),

              ],
            ),
          )
          ],
        ),
              const SizedBox(height: 10.0),
      Container(
        padding: EdgeInsets.all(10),
        child: Column(
          children: <Widget>[
            Container(
              padding: const EdgeInsets.only(left: 8.0, bottom: 8.0),
              alignment: Alignment.topLeft,
              child: Text(
                "User Information",
                style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                ),
                textAlign: TextAlign.left,
              ),
            ),
            Card(
              child: Container(
                alignment: Alignment.topLeft,
                padding: EdgeInsets.all(15),
                child: Column(
                  children: <Widget>[
                    ...ListTile.divideTiles(
                      color: Colors.grey,
                      tiles: [
                        ListTile(
                          contentPadding: EdgeInsets.symmetric(
                              horizontal: 12, vertical: 3),
                          leading: Padding(
                            padding: const EdgeInsets.only(top: 8.0),
                            child: Icon(Icons.location_on_sharp),
                          ),
                          title: Text("Location"),
                          subtitle: Text(snapshot.data![2]['Location'].toString()),
                        ),
                        ListTile(
                          leading: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Icon(Icons.email),
                          ),
                          title: Text("Email"),
                          subtitle: Text(snapshot.data![2]['Email'].toString()),
                        ),
                        ListTile(
                          leading: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Icon(Icons.phone),
                          ),
                          title: Text("Phone"),
                          subtitle: Text(snapshot.data![2]['Phone'].toString()),
                        ),
                        ListTile(
                          leading: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Icon(Icons.person),
                          ),
                          title: Text("About Me"),
                          subtitle: Text(
                              snapshot.data![2]['AboutMe'].toString()),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
            ],
          ),
        );
    }
        else{
          return Center(child: CircularProgressIndicator(),);
          }
        },
        )
    );
  }
  Future<List<dynamic>> fetchData() async{
    var response = await http.get(Uri.parse("https://638063a32f8f56e28ea22a40.mockapi.io/project/TransactionData"));
    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    }
    else{
      throw Exception("Unable to fetch api");
    }
  }
}
