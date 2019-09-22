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
          preferredSize: Size.fromHeight(250.0),
            child: Container(
              height: 250,
              color: const Color(0xFF2C9AB0),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Expanded(
                    flex: 7,
                    child: Padding(
                      padding: EdgeInsets.only(left: 36),
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
                        padding: EdgeInsets.only(left: 30),
                        child: CircleAvatar(
                          backgroundColor: Colors.redAccent,
                          minRadius: 30,
                          maxRadius: 30,
                        )
                        /* IconButton(
                          icon: Icon(Icons.account_circle),
                          onPressed: () {},
                        ) */),
                  )
                ],
              ),
      ),
    ));
  }
}

/* PreferredSize(
        preferredSize: Size.fromHeight(200.0),
        child: AppBar(
          title: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            
            children: <Widget>[
              Padding(
                padding: EdgeInsets.only(left: 16, top: 56),
                child: IconButton(
                  icon: Icon(
                    Icons.account_circle
                    ),
                  onPressed: (){},),
                ),
              
            ],
          ),
          backgroundColor: const Color(0xFF2C9AB0),
        ),
      ), */
