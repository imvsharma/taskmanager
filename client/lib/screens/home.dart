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
          color: const Color(0xFF2C9AB0),
          padding: EdgeInsets.only(left: 20, top: 40),
          child: Stack(
            children: <Widget>[
              Positioned(
                height: 250,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Padding(
                      padding: EdgeInsets.only(left: 16, top: 56),
                      child: Text('Hi Kathnrie',
                        style: TextStyle(fontSize: 30),
                      )
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
        
      )
      
    );
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