import 'dart:async';

import 'package:auto_route/auto_route_annotations.dart';
import 'package:flutter/material.dart' hide Router;
import 'package:hear_better/models/hbuser.dart';
import 'package:hear_better/services/auth.dart';
import 'package:hear_better/theme/app_theme.dart';
import 'package:hear_better/theme/routes/router.gr.dart';
import 'package:hear_better/widget/loading.dart';
import 'package:provider/provider.dart';
import 'package:hear_better/services/database.dart';

class ProfileScreenMobile extends StatefulWidget {
  @override
  _ProfileScreenMobileState createState() => _ProfileScreenMobileState();
}

class _ProfileScreenMobileState extends State<ProfileScreenMobile> {
  final AuthService _auth = AuthService();
  @override
  Widget build(BuildContext context) {
    double _screenWidth = MediaQuery.of(context).size.width;
    double _screenHeight = MediaQuery.of(context).size.height;
    final user = Provider.of<HBUser>(context);

    return StreamBuilder<HBUser>(
      stream: DatabaseService(uid: user?.uid).user,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          HBUser userData = snapshot.data;
          return Container(
            decoration: BoxDecoration(
              color: AppTheme.colors.white,
              image: DecorationImage(
                image: AssetImage("assets/images/background.png"),
                fit: BoxFit.fitWidth,
                alignment: Alignment.bottomCenter,
              ),
            ),
            margin: EdgeInsets.all(0),
            child: Scaffold(
              backgroundColor: Colors.transparent,
              body: SafeArea(
                child: Center(
                  child: Container(
                    margin: EdgeInsets.fromLTRB(0, 20, 0, 20),
                    child: Column(
                      children: [
                        Container(
                          margin: EdgeInsets.only(left: 20, right: 20),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              IconButton(
                                onPressed: () => Router.navigator.pop(),
                                icon: Icon(Icons.arrow_back),
                                color: AppTheme.colors.primaryBlue,
                              ),
                              FlatButton(
                                onPressed: () => null,
                                child: Text(
                                  "Edit",
                                  style: TextStyle(fontSize: 20),
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(height: 100),
                        Container(
                          margin: EdgeInsets.only(left: 20, right: 20),
                          child: Column(
                            children: <Widget>[
                              Center(
                                child: SizedBox(
                                  height: 100,
                                  width: 100,
                                  child: RawMaterialButton(
                                    onPressed: null,
                                    elevation: 2.0,
                                    fillColor: Colors.red,
                                    child: Icon(
                                      Icons.person,
                                      size: 40.0,
                                    ),
                                    padding: EdgeInsets.all(15.0),
                                    shape: CircleBorder(),
                                  ),
                                ),
                              ),
                              Container(
                                margin: EdgeInsets.all(50),
                                child: Column(
                                  children: <Widget>[
                                    Row(
                                      children: [
                                        Text(
                                          "Name:",
                                          style: TextStyle(
                                              color:
                                                  AppTheme.colors.profileGrey,
                                              fontSize: 15),
                                        ),
                                        Spacer(),
                                        Text(
                                          userData.username ?? 'null',
                                          style: TextStyle(
                                              color: AppTheme.colors.black,
                                              fontSize: 15),
                                        )
                                      ],
                                    ),
                                    SizedBox(height: 20),
                                    Row(
                                      children: [
                                        Text(
                                          "Date Of Birth:",
                                          style: TextStyle(
                                              color:
                                                  AppTheme.colors.profileGrey,
                                              fontSize: 15),
                                        ),
                                        Spacer(),
                                        Text(
                                          userData.birth ?? "null",
                                          style: TextStyle(
                                              color: AppTheme.colors.black,
                                              fontSize: 15),
                                        )
                                      ],
                                    ),
                                    SizedBox(height: 20),
                                    Row(
                                      children: [
                                        Text(
                                          "Profession:",
                                          style: TextStyle(
                                              color:
                                                  AppTheme.colors.profileGrey,
                                              fontSize: 15),
                                        ),
                                        Spacer(),
                                        Text(
                                          userData.profession ?? "null",
                                          style: TextStyle(
                                              color: AppTheme.colors.black,
                                              fontSize: 15),
                                        )
                                      ],
                                    ),
                                    SizedBox(height: 20),
                                    Row(
                                      children: [
                                        Text(
                                          "Email:",
                                          style: TextStyle(
                                              color:
                                                  AppTheme.colors.profileGrey,
                                              fontSize: 15),
                                        ),
                                        Spacer(),
                                        Text(
                                          userData.email ?? 'null',
                                          style: TextStyle(
                                              color: AppTheme.colors.black,
                                              fontSize: 15),
                                        )
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                              SizedBox(height: 50),
                              Container(
                                margin: EdgeInsets.all(30),
                                child: SizedBox(
                                  width: _screenWidth,
                                  child: RaisedButton(
                                    color: AppTheme.colors.primaryRed,
                                    onPressed: () async {
                                      await _auth.signOut();
                                      Router.navigator.pop();
                                    },
                                    child: Text(
                                      'Sign Out',
                                      style: TextStyle(
                                        fontSize: 20,
                                        color: AppTheme.colors.white,
                                      ),
                                    ),
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(7),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          );
        } else {
          return Loading();
        }
      },
    );
  }
}
