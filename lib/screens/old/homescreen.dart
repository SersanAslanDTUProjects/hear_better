/* import 'package:flutter/material.dart';
import 'package:hear_better/screens/test_prep_screens/test_prep_environment.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: BoxDecoration(
        color: Colors.white,
        image: DecorationImage(
            image: AssetImage(
              'assets/images/test_prep_images/checking_surrounding.png',
            ),
            fit: BoxFit.fitWidth,
            alignment: Alignment.bottomCenter),
      ),
      child: Align(
        child: Column(children: [
          Container(
            child: Image.asset('assets/images/general_images/logo.png'),
            margin: EdgeInsets.fromLTRB(30, 50, 0, 250),
          ),
          Container(
            child: RaisedButton(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => TestPreperationEnvironment(),
                    ));
              },
              padding: const EdgeInsets.all(20),
              child: Text(
                "Test your hearing",
                style: TextStyle(fontSize: 28),
              ),
              color: Color.fromRGBO(85, 233, 191, 1),
              textColor: Colors.white,
            ),
            margin: EdgeInsets.fromLTRB(0, 0, 0, 0),
          ),
        ]),
      ),
    );
  }
}
 */
