import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:quikie_funds/components/reuseable_grid_items.dart';
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
                Text('Hello, ${_usersModel.firstName}', style: TextStyle(
                    fontSize: 14.0,
                    color: Colors.white
                ),),
                SizedBox(height: 20),
                Center(
                  child: Text('Available balance', style: TextStyle(
                    fontSize: 14.0,
                    color: Colors.white
                  ),),
                ),
                Center(
                  child: Text('₦ 5,000.00', style: TextStyle(
                      fontSize: 25.0,
                      color: Colors.white
                  ),),
                ),

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
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: GridView(
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2, mainAxisSpacing: 10, crossAxisSpacing: 10),
                  children: [
                    GridItems(icon: Icons.history, text: 'Transaction History'),
                    GridItems(icon: Icons.send, text: 'Send Money'),
                    GridItems(icon: Icons.lightbulb, text: 'Electricity'),
                    GridItems(icon: Icons.money, text: 'Apply for Loans'),
                    GridItems(icon: Icons.money, text: 'Buy Airtime'),
                    GridItems(icon: Icons.account_balance_wallet, text: 'cashout'),

                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
