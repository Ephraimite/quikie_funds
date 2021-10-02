import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:quikie_funds/model/users.dart';
import 'package:quikie_funds/states/auth_state.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  UsersModel _usersModel = UsersModel();

  @override
  void initState() {
    super.initState();
    AuthenticationProvider authenticationProvider =
        Provider.of<AuthenticationProvider>(context, listen: false);

    authenticationProvider.getUserDetails(_usersModel);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.lightBlueAccent,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: EdgeInsets.only(
                top: 60.0, bottom: 30.0, left: 30.0, right: 30.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Hello, ${_usersModel.firstName}'),
                SizedBox(height: 20),
                Text('Available balance', TextSty),
                Text('₦ 5,000.00'),

              ],
            ),
          ),
          Expanded(
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 20.0),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                    topRight: Radius.circular(20.0),
                    topLeft: Radius.circular(20.0)),
              ),
              child: Container(),
            ),
          ),
        ],
      ),
    );
  }
}
