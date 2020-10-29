import 'package:flutter/material.dart';


class ResultScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text('Hear better'),
          centerTitle: true,
          backgroundColor: Colors.blue
      ),
      body: ListView(
        children: <Widget>[
          Container(
              margin: EdgeInsets.fromLTRB(0, 50, 0, 30) ,
              child: Center(
                child: Text(
                  'Your hearing is normal',
                  style: TextStyle(
                    fontSize: 28.0,
                    letterSpacing: 1.0,
                  ),
                ),
              )
          ),
          Container(
            margin: EdgeInsets.fromLTRB(0, 0, 0, 30),

            child: Image(
              image: AssetImage('assets/images/result-screen/Good.png'),
            ),
          ),
          Row(
            children: <Widget>[
              Container(
                margin: EdgeInsets.fromLTRB(70, 0, 10, 20) ,
                child: Image(
                  image: AssetImage('assets/images/result-screen/solid_light-bulb.png'),
                ),
              ),
              Center(
                child: Text(
                  'Listen to music on lower volume',
                  textAlign: TextAlign.center,
                ),
              )
            ],
          ),
          Image(
            image: AssetImage('assets/images/result-screen/audiogram.png'),
          ),
          Container(
            child: Image(
              image: AssetImage('assets/images/result-screen/Full-Green.png'),
            ),
          ),
          Container(
            child: Image(
              image: AssetImage('assets/images/result-screen/Full-Blue.png'),
            ),
          )
        ],
      ),
    );
  }
}