
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:ui_interface/AccountPage.dart';
import 'package:ui_interface/Profile.dart';
import 'package:http/http.dart' as http;

class TransactionPage extends StatefulWidget {
  const TransactionPage({Key? key}) : super(key: key);

  @override
  State<TransactionPage> createState() => _TransactionPageState();
}

class _TransactionPageState extends State<TransactionPage> {

  int selectedIndex=0;

  List<Widget> widgetsList =[
    // AccountPage(),
    Container(),
    Container(),
    Container(color: Colors.black,)
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder<dynamic>(
        future: fetchData(),
        builder: (context, snapshot) {
        if (snapshot.hasData) {
          return Stack(
        fit: StackFit.expand,
        children: [
          Image.asset("assets/images/blue2.jpg",fit: BoxFit.cover,height: 800,),
          Column(
            children: [
              Expanded(child: Container(
                // color: Colors.deepPurple,
                margin: EdgeInsets.only(top: 20),
                child: Expanded(
                  child: Row(
                      children: [
                        Expanded(child: InkWell(
                          onTap: () {
                            Navigator.push(context, MaterialPageRoute(builder: (context) => Profile()));
                          },
                          child: Container(
                            // color: Colors.black,
                            width: 50,
                            height: 80,
                            child: CircleAvatar(
                              backgroundImage: NetworkImage(snapshot.data![2]['image'].toString()),
                            ),
                          ),
                        )),
                        Expanded(child: Container(
                          padding: EdgeInsets.only(left: 12),
                          width: 50,
                          height: 80,
                          // color: Colors.yellow,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                padding: EdgeInsets.only(top: 10),
                                child: Text(
                                  snapshot.data![2]['name'].toString(),
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 22,
                                    fontWeight: FontWeight.bold,
                                    fontFamily: "Yantra",
                                  ),
                                ),
                              ),
                              Container(
                                padding: EdgeInsets.only(top: 5),
                                child: Text(
                                  "Welcome back!",
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 22,
                                      fontFamily: "Yantra"
                                  ),
                                ),
                              ),
                              // Expanded(child: Container(color: Colors.black,)),
                            ],
                          ),
                        ),flex: 2,),
                        Expanded(child: Container(
                            width: 50,
                            height: 80,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              // color: Colors.green
                            ),
                            child: Icon(
                              Icons.density_medium_rounded,
                              color: Colors.white,
                            )
                        ),
                        ),
                      ]
                  ),
                ),
              ),flex: 2,),
              Expanded(child: Container(
                padding: EdgeInsets.all(5),
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(topLeft: Radius.circular(40),topRight: Radius.circular(40))
                ),
                child: Container(
                  child: Column(
                    children: [
                      Expanded(child: Container(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            children: [
                              Expanded(child: Container(
                                padding: EdgeInsets.only(left: 10,top: 18),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.stretch,
                                  children: [
                                    Expanded(
                                      child: Row(
                                        children: [
                                          Expanded(
                                            child: InkWell(
                                              onTap: () {
                                                Navigator.pop(context, MaterialPageRoute(builder: (context) => AccountPage()));
                                              },
                                              child: Container(
                                                child: Icon(
                                                  Icons.keyboard_arrow_left_rounded,
                                                  size: 30,
                                                )
                                              ),
                                            ),
                                          ),
                                          Expanded(
                                            child: Container(

                                              child: Text("New Transaction",
                                                style: TextStyle(
                                                    fontSize: 20,
                                                    fontWeight: FontWeight.bold,
                                                    color: Colors.black
                                                ),
                                              ),
                                            ),
                                          flex : 10),
                                        ],
                                      ),
                                    ),
                                    Expanded(child: Container(
                                      // color: Colors.pink,
                                      child: Padding(
                                        padding: const EdgeInsets.only(top :5.0, left :13),
                                        child: Text("From",
                                          textAlign: TextAlign.left,
                                          style: TextStyle(
                                              fontSize: 17,
                                              // fontWeight: FontWeight.bold,
                                              color: Colors.black
                                          ),
                                        ),
                                      ),
                                    ))
                                  ],
                                )
                              ),flex: 2,),
                              Expanded(
                                child: ListView(
                                  scrollDirection: Axis.horizontal,
                                  children: <Widget>[
                                    Container(
                                      margin: EdgeInsets.only(left: 25),
                                      width: 300,
                                      decoration: BoxDecoration(
                                          borderRadius: BorderRadius.all(Radius.circular(30)),
                                          color: Colors.deepPurpleAccent
                                      ),
                                      child: Column(
                                        crossAxisAlignment: CrossAxisAlignment.stretch,
                                        children: [
                                          Expanded(child: Row(
                                            crossAxisAlignment: CrossAxisAlignment.stretch,
                                            children: [
                                              Expanded(child: Container(
                                                padding: EdgeInsets.only(left: 30,top: 30),
                                                child: Text("Debit Card",
                                                  style: TextStyle(
                                                      fontSize: 15,
                                                      color: Colors.white,
                                                      fontWeight: FontWeight.bold
                                                  ),
                                                ),
                                              ),flex: 3,),
                                              Expanded(child: Container(
                                                  child: Icon(Icons.join_left_rounded,
                                                    size: 50,
                                                    color: Colors.white,
                                                  )
                                              ),flex: 2,)
                                            ],
                                          )),
                                          Expanded(child: Row(
                                            crossAxisAlignment: CrossAxisAlignment.stretch,
                                            children: [
                                              Expanded(child: Container(
                                                padding: EdgeInsets.only(left: 30,top: 17),
                                                child: Text(snapshot.data![2]['CardNumber1'].toString(),
                                                  style: TextStyle(
                                                      fontSize: 15,
                                                      color: Colors.white,
                                                      fontWeight: FontWeight.bold
                                                  ),
                                                ),
                                              ),flex: 3,),
                                              Expanded(child: Container(
                                                padding: EdgeInsets.only(top: 15,left: 45),
                                                child: Text("05/23",
                                                  style: TextStyle(
                                                      fontSize: 15,
                                                      color: Colors.white,
                                                      fontWeight: FontWeight.bold
                                                  ),
                                                ),
                                              ),flex: 2,)
                                            ],
                                          )),
                                        ],
                                      ),

                                    ),
                                  ],
                                ),
                                flex: 3,),
                            ],
                          )
                      ),flex: 2,),
                      Expanded(child: Container(

                        margin: EdgeInsets.only(top: 20,bottom: 0 ),
                        padding: EdgeInsets.only(left: 20, right: 20),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            Expanded(
                              child: Container(
                                // color: Colors.red,
                                child: Text("\Amount",
                                style: TextStyle(
                                  fontSize: 17,
                                  // fontWeight: FontWeight.bold
                                ),
                                ),
                              ),
                            ),
                            Expanded(
                              child: Container(
                                // color: Colors.yellow,
                                child: Text("\$130",
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      fontSize: 30,
                                      fontWeight: FontWeight.bold
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      )),
                      Expanded(child: Container(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            Expanded(child: Container(
                              child: Padding(
                                padding: const EdgeInsets.only(top: 15.0,left: 15),
                                child: Text("To",
                                  style: TextStyle(
                                      fontSize: 17,
                                      // fontWeight: FontWeight.bold,
                                      color: Colors.black
                                  ),
                                ),
                              ),
                            )),
                            Expanded(child: Container(
                              child: SingleChildScrollView(
                                  child: ConstrainedBox(
                                    constraints: BoxConstraints(maxHeight: MediaQuery.of(context).size.height),
                                    child: Container(
                                      padding: const EdgeInsets.only(left: 20,right: 20),
                                      height: 400,
                                      child: Column(
                                        children: [
                                          Expanded(child: Row(
                                            crossAxisAlignment: CrossAxisAlignment.stretch,
                                            children: [
                                              Expanded(child: Container(
                                                child: CircleAvatar(
                                                  // backgroundColor: Colors.transparent,
                                                  backgroundImage: NetworkImage(snapshot.data![2]['Person1'].toString()),
                                                  radius: 35,
                                                )
                                              ),flex: 2,),
                                              Expanded(child: Container(
                                                // color: Colors.blue,
                                                padding: EdgeInsets.only(left: 10),
                                                child: Column(
                                                  crossAxisAlignment: CrossAxisAlignment.start,
                                                  children: [
                                                    Padding(
                                                      padding: const EdgeInsets.only(top: 30.0),
                                                      child: Text(snapshot.data![2]['Person1Name'].toString(),
                                                        textAlign: TextAlign.start,
                                                        style: TextStyle(
                                                            fontSize: 17,
                                                            fontWeight: FontWeight.bold,
                                                            color: Colors.black
                                                        ),),
                                                    ),

                                                  ],
                                                ),
                                              ),flex: 7,),
                                            ],
                                          )),
                                          Expanded(child: Row(
                                            children: [
                                              Expanded(child: Container(
                                                  child: CircleAvatar(
                                                    // backgroundColor: Colors.transparent,
                                                    backgroundImage: NetworkImage(snapshot.data![2]['Person2'].toString()),
                                                    radius: 35,
                                                  )
                                              ),flex: 2,),
                                              Expanded(child: Container(
                                                padding: EdgeInsets.only(left: 10),
                                                child: Column(
                                                  crossAxisAlignment: CrossAxisAlignment.start,
                                                  children: [
                                                    Padding(
                                                      padding: const EdgeInsets.only(top: 30.0),
                                                      child: Text(snapshot.data![2]['Person2Name'].toString(),
                                                        style: TextStyle(
                                                            fontSize: 17,
                                                            fontWeight: FontWeight.bold,
                                                            color: Colors.black
                                                        ),),
                                                    ),
                                                  ],
                                                ),
                                              ),flex: 7,),
                                            ],
                                          )),
                                          Expanded(child: Row(
                                            children: [
                                              Expanded(child: Container(
                                                  child: CircleAvatar(
                                                    // backgroundColor: Colors.transparent,
                                                    backgroundImage: NetworkImage(snapshot.data![2]['Person3'].toString()),
                                                    radius: 35,
                                                  )
                                              ),flex: 2,),
                                              Expanded(child: Container(
                                                padding: EdgeInsets.only(left: 10),
                                                child: Column(
                                                  crossAxisAlignment: CrossAxisAlignment.start,
                                                  children: [
                                                    Padding(
                                                      padding: const EdgeInsets.only(top: 30.0),
                                                      child: Text(snapshot.data![2]['Person3Name'].toString(),
                                                        style: TextStyle(
                                                            fontSize: 17,
                                                            fontWeight: FontWeight.bold,
                                                            color: Colors.black
                                                        ),),
                                                    ),
                                                  ],
                                                ),
                                              ),flex: 7,),
                                            ],
                                          )),
                                          Expanded(child: Row(
                                            children: [
                                              Expanded(child: Container(
                                                  child: CircleAvatar(
                                                    // backgroundColor: Colors.transparent,
                                                    backgroundImage: NetworkImage(snapshot.data![5]['Person1'].toString()),
                                                    radius: 35,
                                                  )
                                              ),flex: 2,),
                                              Expanded(child: Container(
                                                padding: EdgeInsets.only(left: 10),
                                                child: Column(
                                                  crossAxisAlignment: CrossAxisAlignment.start,
                                                  children: [
                                                    Padding(
                                                      padding: const EdgeInsets.only(top: 28.0),
                                                      child: Text(snapshot.data![2]['Person4Name'].toString(),
                                                        style: TextStyle(
                                                            fontSize: 17,
                                                            fontWeight: FontWeight.bold,
                                                            color: Colors.black
                                                        ),),
                                                    ),
                                                  ],
                                                ),
                                              ),flex: 7,),
                                            ],
                                          )),
                                          Expanded(child: Row(
                                            children: [
                                              Expanded(child: Container(
                                                  child: CircleAvatar(
                                                    // backgroundColor: Colors.transparent,
                                                    backgroundImage: NetworkImage(snapshot.data![5]['Person3'].toString()),
                                                    radius: 35,
                                                  )
                                              ),flex: 2,),
                                              Expanded(child: Container(
                                                padding: EdgeInsets.only(left: 10),
                                                child: Column(
                                                  crossAxisAlignment: CrossAxisAlignment.start,
                                                  children: [
                                                    Padding(
                                                      padding: const EdgeInsets.only(top: 30.0),
                                                      child: Text(snapshot.data![2]['Person5Name'].toString(),
                                                        style: TextStyle(
                                                            fontSize: 17,
                                                            fontWeight: FontWeight.bold,
                                                            color: Colors.black
                                                        ),),
                                                    ),
                                                  ],
                                                ),
                                              ),flex: 7,),
                                            ],
                                          )),
                                        ],
                                      ),
                                    ),
                                  )
                              ),
                            ),flex: 4,)
                          ],
                        ),
                      ),flex: 3,),
                    ],
                  ),
                ),
              ),flex: 9,)
            ],
          ),
        ],
      );
            }
        else{
          return Center(child: CircularProgressIndicator());
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
