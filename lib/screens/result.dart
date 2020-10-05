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

        body: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  'Your hearing is normal',
                  style: TextStyle(
                    fontSize: 28.0,
                    fontWeight: FontWeight.bold,
                    letterSpacing: 1.0,
                    fontFamily: 'IndieFlower',
                  ),
                ),
              Image(
                image: AssetImage('assets/images/result-screen/audiogram.png'),
              )
            ],
            ),
        ),
    );
  }
}