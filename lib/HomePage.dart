import 'package:flutter/material.dart';
import 'package:ui_interface/AccountPage.dart';
import 'package:ui_interface/Home.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: [
          Image.asset("assets/images/blue2.jpg",fit: BoxFit.cover,height: 800,),
          Column(
            children: [
              Expanded(child: Column(
                children: [
                  Padding(
                    padding: EdgeInsets.only(top: 100.0),
                    child: Expanded(
                      child: Text("Welcome",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 35,
                            fontWeight: FontWeight.bold
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Expanded(
                      child: Text("Scan your fingerprint to Sign in",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 15,
                            fontWeight: FontWeight.bold
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  )
                ],
              ),flex:2,),
              // Expanded(child: Container(color: Colors.pink,),flex: 4,),
              Expanded(child: Image.asset("assets/images/fin2.png",width: 100,),flex: 4,),
              Expanded(child: InkWell(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => AccountPage()));
                },
                child: Container(
                  child: Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 40.0),
                        child: Expanded(child: Text("Sign with pnone number",
                        style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                          color: Colors.white
                        ),
                        ),flex: 3,),
                      ),
                      Expanded(child: Icon(Icons.keyboard_arrow_right_rounded,
                      color: Colors.white,
                        size: 60,
                      ))
                    ],
                  ),
                ),
              ),flex: 1,),
            ],
          )
          ],
      ),
    );
  }
}
