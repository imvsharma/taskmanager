import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  @override
  HomeState createState() => HomeState();
}

class HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: PreferredSize(
          
          preferredSize: Size.fromHeight(300.0),
            child: Container(
              
              height: 300,
              color: const Color(0xFF2C9AB0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Expanded(
                    flex: 7,
                    child: Padding(
                      padding: EdgeInsets.only(left: 36, top: 70),
                        child: Text(
                          'Hi Kathnrie',
                          style: TextStyle(
                              fontSize: 30,
                              fontFamily: 'RalewayRegular',
                              color: Colors.white),
                        )),
                  ),
                  Expanded(
                    flex: 3,
                    child: Padding(
                        padding: EdgeInsets.only(left: 30, top: 65),
                        child: Container(
                          height: 50,
                          width: 50,
                          
                          decoration: BoxDecoration(
                            
                            color: Colors.redAccent,
                            shape: BoxShape.circle,
                          ),
                        )
                      ),
                  )
                ],
              ),
      ),
    ));
  }
}


