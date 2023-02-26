
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:ui_interface/Profile.dart';
import 'package:ui_interface/TransactionPage.dart';
import 'package:http/http.dart' as http;

class AccountPage extends StatefulWidget {
  const AccountPage({Key? key}) : super(key: key);

  @override
  State<AccountPage> createState() => _AccountPageState();
}

class _AccountPageState extends State<AccountPage> {

  int selectedIndex=0;

  List<Widget> widgetsList =[
    AccountPage(),
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
                Image.asset(
                  "assets/images/blue2.jpg", fit: BoxFit.cover,
                  height: 800,),
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
                                  Navigator.push(context, MaterialPageRoute(
                                      builder: (context) => Profile()));
                                },
                                child: Container(
                                  // color: Colors.black,
                                  width: 50,
                                  height: 80,
                                  child: CircleAvatar(
                                    backgroundImage: NetworkImage(
                                        snapshot.data![2]['image'].toString()),
                                  ),
                                ),
                              )),
                              Expanded(child: Container(
                                padding: EdgeInsets.only(left: 12),
                                width: 50,
                                height: 80,
                                // color: Colors.yellow,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment
                                      .start,
                                  children: [
                                    Container(
                                      // color: Colors.yellow,
                                      padding: EdgeInsets.only(top: 10),
                                      child: Text(
                                        snapshot.data![2]['name'].toString(),
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 20,
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
                                          fontSize: 18,
                                          // fontFamily: "Yantra"
                                        ),
                                      ),
                                    ),
                                    // Expanded(child: Container(color: Colors.black,)),
                                  ],
                                ),
                              ), flex: 2,),
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
                    ), flex: 2,),
                    Expanded(child: Container(
                      padding: EdgeInsets.all(5),
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.only(topLeft: Radius
                              .circular(40), topRight: Radius.circular(40))
                      ),
                      child: Container(
                        child: Column(
                          children: [
                            Expanded(child: Container(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment
                                      .stretch,
                                  children: [
                                    Expanded(child: Container(
                                      padding: EdgeInsets.only(
                                          left: 20, top: 20),
                                      child: Text("My Cards",
                                        style: TextStyle(
                                            fontSize: 17,
                                            fontWeight: FontWeight.bold,
                                            color: Colors.black
                                        ),
                                      ),
                                    ), flex: 2,),
                                    Expanded(
                                      child: ListView(
                                        scrollDirection: Axis.horizontal,
                                        children: <Widget>[
                                          Container(
                                            margin: EdgeInsets.only(
                                                left: 20),
                                            width: 300,
                                            decoration: BoxDecoration(
                                                borderRadius: BorderRadius
                                                    .all(
                                                    Radius.circular(40)),
                                                color: Colors
                                                    .deepPurpleAccent
                                            ),
                                            child: Column(
                                              crossAxisAlignment: CrossAxisAlignment
                                                  .stretch,
                                              children: [
                                                Expanded(child: Row(
                                                  crossAxisAlignment: CrossAxisAlignment
                                                      .stretch,
                                                  children: [
                                                    Expanded(
                                                      child: Container(
                                                        padding: EdgeInsets
                                                            .only(
                                                            left: 30,
                                                            top: 17),
                                                        child: Text(
                                                          "Debit Card",
                                                          style: TextStyle(
                                                              fontSize: 15,
                                                              color: Colors
                                                                  .white,
                                                              fontWeight: FontWeight
                                                                  .bold
                                                          ),
                                                        ),
                                                      ), flex: 3,),
                                                    Expanded(
                                                      child: Container(
                                                          child: Icon(Icons
                                                              .join_left_rounded,
                                                            size: 50,
                                                            color: Colors
                                                                .white,
                                                          )
                                                      ), flex: 2,)
                                                  ],
                                                )),
                                                Expanded(child: Row(
                                                  crossAxisAlignment: CrossAxisAlignment
                                                      .stretch,
                                                  children: [
                                                    Expanded(
                                                      child: Container(
                                                        padding: EdgeInsets
                                                            .only(
                                                            left: 30,
                                                            top: 17),
                                                        child: Text(
                                                          snapshot.data![2]['CardNumber1'].toString(),
                                                          style: TextStyle(
                                                              fontSize: 15,
                                                              color: Colors
                                                                  .white,
                                                              fontWeight: FontWeight
                                                                  .bold
                                                          ),
                                                        ),
                                                      ), flex: 3,),
                                                    Expanded(
                                                      child: Container(
                                                        padding: EdgeInsets
                                                            .only(
                                                            top: 15,
                                                            left: 45),
                                                        child: Text("05/23",
                                                          style: TextStyle(
                                                              fontSize: 15,
                                                              color: Colors
                                                                  .white,
                                                              fontWeight: FontWeight
                                                                  .bold
                                                          ),
                                                        ),
                                                      ), flex: 2,)
                                                  ],
                                                )),
                                                Expanded(child: Container(
                                                  padding: EdgeInsets.only(
                                                      left: 30, top: 9),
                                                  child: Text('\$ '+snapshot.data![2]['Balance'].toString(),
                                                    style: TextStyle(
                                                        fontSize: 23,
                                                        color: Colors.white,
                                                        fontWeight: FontWeight
                                                            .bold
                                                    ),
                                                  ),
                                                )),
                                              ],
                                            ),

                                          ),
                                          Container(
                                            width: 300,
                                            margin: EdgeInsets.only(
                                                left: 15),
                                            decoration: BoxDecoration(
                                                borderRadius: BorderRadius
                                                    .all(
                                                    Radius.circular(40)),
                                                color: Colors.green
                                            ),
                                            child: Column(
                                              crossAxisAlignment: CrossAxisAlignment
                                                  .stretch,
                                              children: [
                                                Expanded(child: Row(
                                                  crossAxisAlignment: CrossAxisAlignment
                                                      .stretch,
                                                  children: [
                                                    Expanded(
                                                      child: Container(
                                                        padding: EdgeInsets
                                                            .only(
                                                            left: 30,
                                                            top: 17),
                                                        child: Text(
                                                          "Debit Card",
                                                          style: TextStyle(
                                                              fontSize: 15,
                                                              color: Colors
                                                                  .white,
                                                              fontWeight: FontWeight
                                                                  .bold
                                                          ),
                                                        ),
                                                      ), flex: 3,),
                                                    Expanded(
                                                      child: Container(
                                                          child: Icon(Icons
                                                              .join_left_rounded,
                                                            size: 50,
                                                            color: Colors
                                                                .white,
                                                          )
                                                      ), flex: 2,)
                                                  ],
                                                )),
                                                Expanded(child: Row(
                                                  crossAxisAlignment: CrossAxisAlignment
                                                      .stretch,
                                                  children: [
                                                    Expanded(
                                                      child: Container(
                                                        padding: EdgeInsets
                                                            .only(
                                                            left: 30,
                                                            top: 17),
                                                        child: Text(
                                                          snapshot.data![2]['CardNumber2'].toString(),
                                                          style: TextStyle(
                                                              fontSize: 15,
                                                              color: Colors
                                                                  .white,
                                                              fontWeight: FontWeight
                                                                  .bold
                                                          ),
                                                        ),
                                                      ), flex: 3,),
                                                    Expanded(
                                                      child: Container(
                                                        padding: EdgeInsets
                                                            .only(
                                                            top: 15,
                                                            left: 45),
                                                        child: Text("05/23",
                                                          style: TextStyle(
                                                              fontSize: 15,
                                                              color: Colors
                                                                  .white,
                                                              fontWeight: FontWeight
                                                                  .bold
                                                          ),
                                                        ),
                                                      ), flex: 2,)
                                                  ],
                                                )),
                                                Expanded(child: Container(
                                                  padding: EdgeInsets.only(
                                                      left: 30, top: 9),
                                                  child: Text("\$ "+snapshot.data![2]['Balance'].toString(),
                                                    style: TextStyle(
                                                        fontSize: 23,
                                                        color: Colors.white,
                                                        fontWeight: FontWeight
                                                            .bold
                                                    ),
                                                  ),
                                                )),
                                              ],
                                            ),
                                          ),
                                          Container(
                                            width: 300,
                                            height: 300,
                                            margin: EdgeInsets.only(
                                                left: 15, right: 15),
                                            decoration: BoxDecoration(
                                                borderRadius: BorderRadius
                                                    .all(
                                                    Radius.circular(40)),
                                                color: Colors.blue
                                            ),
                                            child: Column(
                                              crossAxisAlignment: CrossAxisAlignment
                                                  .stretch,
                                              children: [
                                                Expanded(child: Row(
                                                  crossAxisAlignment: CrossAxisAlignment
                                                      .stretch,
                                                  children: [
                                                    Expanded(
                                                      child: Container(
                                                        padding: EdgeInsets
                                                            .only(
                                                            left: 30,
                                                            top: 17),
                                                        child: Text(
                                                          "Debit Card",
                                                          style: TextStyle(
                                                              fontSize: 15,
                                                              color: Colors
                                                                  .white,
                                                              fontWeight: FontWeight
                                                                  .bold
                                                          ),
                                                        ),
                                                      ), flex: 3,),
                                                    Expanded(
                                                      child: Container(
                                                          child: Icon(Icons
                                                              .join_left_rounded,
                                                            size: 50,
                                                            color: Colors
                                                                .white,
                                                          )
                                                      ), flex: 2,)
                                                  ],
                                                )),
                                                Expanded(child: Row(
                                                  crossAxisAlignment: CrossAxisAlignment
                                                      .stretch,
                                                  children: [
                                                    Expanded(
                                                      child: Container(
                                                        padding: EdgeInsets
                                                            .only(
                                                            left: 30,
                                                            top: 17),
                                                        child: Text(
                                                          snapshot.data![2]['CardNumber3'].toString(),
                                                          style: TextStyle(
                                                              fontSize: 15,
                                                              color: Colors
                                                                  .white,
                                                              fontWeight: FontWeight
                                                                  .bold
                                                          ),
                                                        ),
                                                      ), flex: 3,),
                                                    Expanded(
                                                      child: Container(
                                                        padding: EdgeInsets
                                                            .only(
                                                            top: 15,
                                                            left: 45),
                                                        child: Text("05/23",
                                                          style: TextStyle(
                                                              fontSize: 15,
                                                              color: Colors
                                                                  .white,
                                                              fontWeight: FontWeight
                                                                  .bold
                                                          ),
                                                        ),
                                                      ), flex: 2,)
                                                  ],
                                                )),
                                                Expanded(child: Container(
                                                  padding: EdgeInsets.only(
                                                      left: 30, top: 9),
                                                  child: Text("\$ "+snapshot.data![2]['Balance'].toString(),
                                                    style: TextStyle(
                                                        fontSize: 23,
                                                        color: Colors.white,
                                                        fontWeight: FontWeight
                                                            .bold
                                                    ),
                                                  ),
                                                )),
                                              ],
                                            ),
                                          ),
                                        ],
                                      ),
                                      flex: 6,),
                                  ],
                                )
                            ), flex: 3,),
                            Container(height: 10,),
                            Expanded(child: Container(
                              // color: Colors.red,
                              margin: EdgeInsets.only(top: 10),
                              padding: EdgeInsets.only(left: 20, right: 20),
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment
                                    .stretch,
                                children: [
                                  Expanded(child: InkWell(
                                    onTap: () {
                                      Navigator.push(
                                          context, MaterialPageRoute(
                                          builder: (context) =>
                                              TransactionPage()));
                                    },
                                    child: Container(
                                      margin: EdgeInsets.only(
                                          left: 10, right: 10, top: 10),
                                      decoration: BoxDecoration(
                                          color: Colors
                                              .lightBlueAccent[100],
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(10))
                                      ),
                                      child: Icon(Icons.telegram_rounded),

                                    ),
                                  )),
                                  Expanded(child: Container(
                                    margin: EdgeInsets.only(
                                        left: 10, right: 10, top: 10),
                                    decoration: BoxDecoration(
                                        color: Colors.greenAccent[100],
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(10))
                                    ),
                                    child: Icon(
                                        Icons.compare_arrows_rounded),

                                  )),
                                  Expanded(child: Container(
                                    margin: EdgeInsets.only(
                                        left: 10, right: 10, top: 10),
                                    decoration: BoxDecoration(
                                        color: Colors.lightBlueAccent[100],
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(10))
                                    ),
                                    child: Icon(
                                        Icons.shopping_cart_rounded),

                                  )),
                                  Expanded(child: Container(
                                    margin: EdgeInsets.only(
                                        left: 10, right: 10, top: 10),
                                    decoration: BoxDecoration(
                                        color: Colors.greenAccent[100],
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(10))
                                    ),
                                    child: Icon(Icons.checklist_rounded),
                                  )),
                                ],
                              ),
                            ),),
                            Expanded(child: Container(

                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment
                                    .stretch,
                                children: [
                                  Expanded(child: Container(
                                    margin: EdgeInsets.only(top: 20),
                                    child: Padding(
                                      padding: const EdgeInsets.only(
                                          top: 15.0, left: 15),
                                      child: Text("Transaction",
                                        style: TextStyle(
                                            fontSize: 20,
                                            fontWeight: FontWeight.bold,
                                            color: Colors.black
                                        ),
                                      ),
                                    ),
                                  )),
                                  Expanded(child: Container(
                                    child: SingleChildScrollView(
                                        child: ConstrainedBox(
                                          constraints: BoxConstraints(
                                              maxHeight: MediaQuery
                                                  .of(context)
                                                  .size
                                                  .height),
                                          child: Container(
                                            padding: const EdgeInsets.only(
                                                left: 20, right: 20),
                                            height: 400,
                                            child: Column(
                                              children: [
                                                Expanded(child: Row(
                                                  children: [
                                                    Expanded(
                                                      child: Container( 
                                                          child: CircleAvatar(
                                                            // backgroundColor: Colors.transparent,
                                                            backgroundImage: AssetImage(
                                                                "assets/images/netflix.png"),
                                                            radius: 35,
                                                          )
                                                      ), flex: 3,),
                                                    Expanded(
                                                      child: Container(
                                                        padding: EdgeInsets
                                                            .only(
                                                            left: 10),
                                                        child: Column(
                                                          crossAxisAlignment: CrossAxisAlignment
                                                              .start,
                                                          children: [
                                                            Padding(
                                                              padding: const EdgeInsets
                                                                  .only(
                                                                  top: 17.0),
                                                              child: Text(
                                                                snapshot.data![2]['Transaction1'].toString(),
                                                                style: TextStyle(
                                                                    fontSize: 17,
                                                                    fontWeight: FontWeight
                                                                        .bold,
                                                                    color: Colors
                                                                        .black
                                                                ),),
                                                            ),
                                                            Padding(
                                                              padding: const EdgeInsets
                                                                  .only(
                                                                  top: 4.0),
                                                              child: Text(
                                                                "Subscription",
                                                                style: TextStyle(
                                                                    fontSize: 15,
                                                                    // fontWeight: FontWeight.bold,
                                                                    color: Colors
                                                                        .grey
                                                                ),),
                                                            )
                                                          ],
                                                        ),
                                                      ), flex: 7,),
                                                    Expanded(
                                                      child: Container(
                                                        child: Column(
                                                          crossAxisAlignment: CrossAxisAlignment
                                                              .end,
                                                          children: [
                                                            Padding(
                                                              padding: const EdgeInsets
                                                                  .only(
                                                                  top: 17.0),
                                                              child: Text(
                                                                "\$10",
                                                                style: TextStyle(
                                                                    fontSize: 17,
                                                                    fontWeight: FontWeight
                                                                        .bold,
                                                                    color: Colors
                                                                        .black
                                                                ),),
                                                            ),
                                                            Text(
                                                              "Mar 25,2021",
                                                              style: TextStyle(
                                                                  fontSize: 13,
                                                                  // fontWeight: FontWeight.bold,
                                                                  color: Colors
                                                                      .grey
                                                              ),)
                                                          ],
                                                        ),
                                                      ), flex: 4,),
                                                  ],
                                                )),
                                                Expanded(child: Row(
                                                  children: [
                                                    Expanded(
                                                      child: Container(
                                                          child: CircleAvatar(
                                                            // backgroundColor: Colors.transparent,
                                                            backgroundImage: AssetImage(
                                                                "assets/images/music.jpg"),
                                                            radius: 35,
                                                          )
                                                      ), flex: 3,),
                                                    Expanded(
                                                      child: Container(
                                                        padding: EdgeInsets
                                                            .only(
                                                            left: 10),
                                                        child: Column(
                                                          crossAxisAlignment: CrossAxisAlignment
                                                              .start,
                                                          children: [
                                                            Padding(
                                                              padding: const EdgeInsets
                                                                  .only(
                                                                  top: 17.0),
                                                              child: Text(
                                                                snapshot.data![2]['Transaction2'].toString(),
                                                                style: TextStyle(
                                                                    fontSize: 16,
                                                                    fontWeight: FontWeight
                                                                        .bold,
                                                                    color: Colors
                                                                        .black
                                                                ),),
                                                            ),
                                                            Padding(
                                                              padding: const EdgeInsets
                                                                  .only(
                                                                  top: 4.0),
                                                              child: Text(
                                                                "Subscription",
                                                                style: TextStyle(
                                                                    fontSize: 15,
                                                                    color: Colors
                                                                        .grey
                                                                ),),
                                                            )
                                                          ],
                                                        ),
                                                      ), flex: 7,),
                                                    Expanded(
                                                      child: Container(
                                                        child: Column(
                                                          crossAxisAlignment: CrossAxisAlignment
                                                              .end,
                                                          children: [
                                                            Padding(
                                                              padding: const EdgeInsets
                                                                  .only(
                                                                  top: 17.0),
                                                              child: Text(
                                                                "\$9.88",
                                                                style: TextStyle(
                                                                    fontSize: 17,
                                                                    fontWeight: FontWeight
                                                                        .bold,
                                                                    color: Colors
                                                                        .black
                                                                ),),
                                                            ),
                                                            Text(
                                                              "Mar 24,2021",
                                                              style: TextStyle(
                                                                  fontSize: 13,
                                                                  color: Colors
                                                                      .grey
                                                              ),)
                                                          ],
                                                        ),
                                                      ), flex: 4,),
                                                  ],
                                                )),
                                                Expanded(child: Row(
                                                  children: [
                                                    Expanded(
                                                      child: Container(
                                                          child: CircleAvatar(
                                                            // backgroundColor: Colors.transparent,
                                                            backgroundImage: AssetImage(
                                                                "assets/images/sonyliv.jpg"),
                                                            radius: 35,
                                                          )
                                                      ), flex: 3,),
                                                    Expanded(
                                                      child: Container(
                                                        padding: EdgeInsets
                                                            .only(
                                                            left: 10),
                                                        child: Column(
                                                          crossAxisAlignment: CrossAxisAlignment
                                                              .start,
                                                          children: [
                                                            Padding(
                                                              padding: const EdgeInsets
                                                                  .only(
                                                                  top: 17.0),
                                                              child: Text(
                                                                snapshot.data![2]['Transaction3'].toString(),
                                                                style: TextStyle(
                                                                    fontSize: 17,
                                                                    fontWeight: FontWeight
                                                                        .bold,
                                                                    color: Colors
                                                                        .black
                                                                ),),
                                                            ),
                                                            Padding(
                                                              padding: const EdgeInsets
                                                                  .only(
                                                                  top: 4.0),
                                                              child: Text(
                                                                "Subscription",
                                                                style: TextStyle(
                                                                    fontSize: 15,
                                                                    color: Colors
                                                                        .grey
                                                                ),),
                                                            )
                                                          ],
                                                        ),
                                                      ), flex: 7,),
                                                    Expanded(
                                                      child: Container(
                                                        child: Column(
                                                          crossAxisAlignment: CrossAxisAlignment
                                                              .end,
                                                          children: [
                                                            Padding(
                                                              padding: const EdgeInsets
                                                                  .only(
                                                                  top: 17.0),
                                                              child: Text(
                                                                "\$10",
                                                                style: TextStyle(
                                                                    fontSize: 17,
                                                                    fontWeight: FontWeight
                                                                        .bold,
                                                                    color: Colors
                                                                        .black
                                                                ),),
                                                            ),
                                                            Padding(
                                                              padding: const EdgeInsets
                                                                  .only(
                                                                  top: 5.0),
                                                              child: Text(
                                                                "Mar 25,2021",
                                                                style: TextStyle(
                                                                    fontSize: 13,
                                                                    color: Colors
                                                                        .grey
                                                                ),),
                                                            )
                                                          ],
                                                        ),
                                                      ), flex: 4,),
                                                  ],
                                                )),
                                                Expanded(child: Row(
                                                  children: [
                                                    Expanded(
                                                      child: Container(
                                                          child: CircleAvatar(
                                                            // backgroundColor: Colors.transparent,
                                                            backgroundImage: AssetImage(
                                                                "assets/images/amazon.jpg"),
                                                            radius: 35,
                                                          )
                                                      ), flex: 3,),
                                                    Expanded(
                                                      child: Container(
                                                        padding: EdgeInsets
                                                            .only(
                                                            left: 10),
                                                        child: Column(
                                                          crossAxisAlignment: CrossAxisAlignment
                                                              .start,
                                                          children: [
                                                            Padding(
                                                              padding: const EdgeInsets
                                                                  .only(
                                                                  top: 17.0),
                                                              child: Text(
                                                                snapshot.data![2]['Transaction4'].toString(),
                                                                style: TextStyle(
                                                                    fontSize: 16,
                                                                    fontWeight: FontWeight
                                                                        .bold,
                                                                    color: Colors
                                                                        .black
                                                                ),),
                                                            ),
                                                            Padding(
                                                              padding: const EdgeInsets
                                                                  .only(
                                                                  top: 4.0),
                                                              child: Text(
                                                                "Subscription",
                                                                style: TextStyle(
                                                                    fontSize: 15,
                                                                    color: Colors
                                                                        .grey
                                                                ),),
                                                            )
                                                          ],
                                                        ),
                                                      ), flex:7,),
                                                    Expanded(
                                                      child: Container(
                                                        child: Column(
                                                          crossAxisAlignment: CrossAxisAlignment
                                                              .end,
                                                          children: [
                                                            Padding(
                                                              padding: const EdgeInsets
                                                                  .only(
                                                                  top: 17.0),
                                                              child: Text(
                                                                "\$4",
                                                                style: TextStyle(
                                                                    fontSize: 17,
                                                                    fontWeight: FontWeight
                                                                        .bold,
                                                                    color: Colors
                                                                        .black
                                                                ),),
                                                            ),
                                                            Padding(
                                                              padding: const EdgeInsets
                                                                  .only(
                                                                  top: 4.0),
                                                              child: Text(
                                                                "Mar 25,2021",
                                                                style: TextStyle(
                                                                    fontSize: 13,
                                                                    color: Colors
                                                                        .grey
                                                                ),),
                                                            )
                                                          ],
                                                        ),
                                                      ), flex: 4,),
                                                  ],
                                                )),
                                                Expanded(child: Row(
                                                  children: [
                                                    Expanded(
                                                      child: Container(
                                                          child: CircleAvatar(
                                                            // backgroundColor: Colors.transparent,
                                                            backgroundImage: AssetImage(
                                                                "assets/images/netflix.png"),
                                                            radius: 35,
                                                          )
                                                      ), flex: 3,),
                                                    Expanded(
                                                      child: Container(
                                                        padding: EdgeInsets
                                                            .only(
                                                            left: 10),
                                                        child: Column(
                                                          crossAxisAlignment: CrossAxisAlignment
                                                              .start,
                                                          children: [
                                                            Padding(
                                                              padding: const EdgeInsets
                                                                  .only(
                                                                  top: 17.0),
                                                              child: Text(
                                                                snapshot.data![2]['Transaction5'].toString(),
                                                                style: TextStyle(
                                                                    fontSize: 17,
                                                                    fontWeight: FontWeight
                                                                        .bold,
                                                                    color: Colors
                                                                        .black
                                                                ),),
                                                            ),
                                                            Padding(
                                                              padding: const EdgeInsets
                                                                  .only(
                                                                  top: 4.0),
                                                              child: Text(
                                                                "Subscription",
                                                                style: TextStyle(
                                                                    fontSize: 15,
                                                                    color: Colors
                                                                        .grey
                                                                ),),
                                                            )
                                                          ],
                                                        ),
                                                      ), flex: 7,),
                                                    Expanded(
                                                      child: Container(
                                                        child: Column(
                                                          crossAxisAlignment: CrossAxisAlignment
                                                              .end,
                                                          children: [
                                                            Padding(
                                                              padding: const EdgeInsets
                                                                  .only(
                                                                  top: 17.0),
                                                              child: Text(
                                                                "\$10",
                                                                style: TextStyle(
                                                                    fontSize: 17,
                                                                    fontWeight: FontWeight
                                                                        .bold,
                                                                    color: Colors
                                                                        .black
                                                                ),),
                                                            ),
                                                            Padding(
                                                              padding: const EdgeInsets
                                                                  .only(
                                                                  top: 4.0),
                                                              child: Text(
                                                                "Mar 25,2021",
                                                                style: TextStyle(
                                                                    fontSize: 13,
                                                                    color: Colors
                                                                        .grey
                                                                ),),
                                                            )
                                                          ],
                                                        ),
                                                      ), flex: 4,),
                                                  ],
                                                )),
                                              ],
                                            ),
                                          ),
                                        )
                                    ),
                                  ), flex: 3,)
                                ],
                              ),
                            ), flex: 4,),
                          ],
                        ),
                      ),
                    ), flex: 9,)
                  ],
                ),
              ],
            );

          }
          else{
            return Center(child: CircularProgressIndicator());
          }
        },
      ),
    //     bottomNavigationBar: BottomNavigationBar(items: [
    // BottomNavigationBarItem(
    // icon: Icon(Icons.account_balance_wallet_rounded),
    // label: "Wallet",
    // backgroundColor: Colors.black
    // ),
    // BottomNavigationBarItem(
    // icon: Icon(Icons.album_rounded),
    // label: "Balance",
    // backgroundColor: Colors.black
    // ),
    // BottomNavigationBarItem(
    // icon: Icon(Icons.account_balance_wallet_rounded),
    // label: "Wallet",
    // backgroundColor: Colors.black
    // ),
    // BottomNavigationBarItem(
    // icon: Icon(Icons.settings),
    // label: "Setting",
    // backgroundColor: Colors.black
    // ),
    // ],
    //       selectedItemColor: Colors.white,
    //       backgroundColor: Colors.deepPurple,
    //       currentIndex: selectedIndex,
    //       onTap: (index) {
    //         setState(
    //               () {
    //             selectedIndex=index;
    //           },
    //         );
    //       },
    //     ),
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
